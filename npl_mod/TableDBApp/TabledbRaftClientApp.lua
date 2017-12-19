--[[
Title: 
Author: liuluheng
Date: 2017.03.25
Desc: 
]]--

NPL.load("(gl)script/ide/commonlib.lua");
NPL.load("(gl)script/ide/System/Compiler/lib/util.lua");
NPL.load("npl_packages/TableDB/npl_mod/Raft/ServerState.lua");
NPL.load("npl_packages/TableDB/npl_mod/Raft/RaftParameters.lua");
NPL.load("npl_packages/TableDB/npl_mod/Raft/RaftContext.lua");
NPL.load("npl_packages/TableDB/npl_mod/Raft/RpcListener.lua");
NPL.load("npl_packages/TableDB/npl_mod/TableDBApp/MessagePrinter.lua");
NPL.load("npl_packages/TableDB/npl_mod/Raft/RaftClient.lua");
NPL.load("(gl)script/ide/socket/url.lua");
NPL.load("npl_packages/TableDB/npl_mod/Raft/RaftConsensus.lua");
NPL.load("npl_packages/TableDB/npl_mod/Raft/ClusterServer.lua");
NPL.load("npl_packages/TableDB/npl_mod/TableDB/RaftTableDBStateMachine.lua");

local RaftTableDBStateMachine = commonlib.gettable("TableDB.RaftTableDBStateMachine");
local ClusterServer = commonlib.gettable("Raft.ClusterServer");
local RaftClient = commonlib.gettable("Raft.RaftClient");
local RaftParameters = commonlib.gettable("Raft.RaftParameters");
local RaftContext = commonlib.gettable("Raft.RaftContext");
local RpcListener = commonlib.gettable("Raft.RpcListener");
local url = commonlib.gettable("commonlib.socket.url")
local RaftConsensus = commonlib.gettable("Raft.RaftConsensus");
local MessagePrinter = commonlib.gettable("TableDBApp.MessagePrinter");
local util = commonlib.gettable("System.Compiler.lib.util")
local LoggerFactory = NPL.load("npl_packages/TableDB/npl_mod/Raft/LoggerFactory.lua");

local logger = LoggerFactory.getLogger("App")

local TabledbRaftClientApp = commonlib.gettable("TabledbRaftClientApp");

--[[
local threadName = ParaEngine.GetAppCommandLineByParam("threadName", "main");
local baseDir = ParaEngine.GetAppCommandLineByParam("baseDir", "");
-- local mpPort = ParaEngine.GetAppCommandLineByParam("mpPort", "8090");
local listenIp = ParaEngine.GetAppCommandLineByParam("listenIp", "0.0.0.0");
local listenPort = ParaEngine.GetAppCommandLineByParam("listenPort", nil);
local raftMode = ParaEngine.GetAppCommandLineByParam("raftMode", "server");
local clientMode = ParaEngine.GetAppCommandLineByParam("clientMode", "appendEntries");
local serverId = tonumber(ParaEngine.GetAppCommandLineByParam("serverId", "5"));

start "client" /D "%curdir%\client" npl bootstrapper="npl_mod/TableDBApp/App.lua" servermode="true" dev="../../" raftMode="client" baseDir="./" clientMode="%2" serverId="%3"
]]

local threadName = "main"
local baseDir = "./"
local listenIp = "0.0.0.0"
local raftMode = "client"
local clientMode = "appendEntries"

if threadName ~= "main" then
    NPL.CreateRuntimeState(threadName, 0):Start();
end

local raftThreadName = "raft"
NPL.CreateRuntimeState(raftThreadName, 0):Start();

local useFileStateManager = true;
local ServerStateManager;
if useFileStateManager then
	NPL.load("(gl)npl_mod/Raft/FileBasedServerStateManager.lua");
	local FileBasedServerStateManager = commonlib.gettable("Raft.FileBasedServerStateManager");
	ServerStateManager = FileBasedServerStateManager;
else
  	NPL.load("(gl)npl_mod/Raft/SqliteBasedServerStateManager.lua");
  	local SqliteBasedServerStateManager = commonlib.gettable("Raft.SqliteBasedServerStateManager");
  	ServerStateManager = SqliteBasedServerStateManager;
end

local sqlHandlerFile = format("(%s)npl_mod/TableDB/SQLHandler.lua", threadName);
NPL.activate(sqlHandlerFile, {start = true, baseDir = baseDir, useFile = true});

logger.info("app arg:"..baseDir.. " " ..raftMode)

local stateManager = ServerStateManager:new(baseDir);
local config = stateManager:loadClusterConfiguration();

logger.info("config:%s", util.table_tostring(config))

local thisServer = config:getServer(stateManager.serverId)
if not thisServer then
	-- perhaps thisServer has been removed last time
	logger.error("thisServer is nil!")
	ParaGlobal.Exit(0);
	--- C/C++ API call is counted as one instruction, so Exit does not block
	return;
end
local localEndpoint = thisServer.endpoint
local parsed_url = url.parse(localEndpoint)
logger.info("local state info"..util.table_tostring(parsed_url))
if not listenPort then
  	listenPort = parsed_url.port
end

local function executeAsClient(stateMachine)
	NPL.load("(gl)npl_mod/TableDB/RaftSqliteStore.lua");
	local RaftSqliteStore = commonlib.gettable("TableDB.RaftSqliteStore");
	NPL.load("(gl)npl_mod/TableDB/RaftSqliteWALStore.lua");
	local RaftSqliteWALStore = commonlib.gettable("TableDB.RaftSqliteWALStore");
	stateMachine:start2(RaftSqliteWALStore)
	NPL.load("(gl)npl_mod/TableDB/test/test_TableDatabase.lua");
	-- TestSQLOperations();
	-- TestInsertThroughputNoIndex()
	-- TestPerformance()
	-- TestBulkOperations()
	-- TestTimeout()
	-- TestBlockingAPI()
	-- TestBlockingAPILatency()
	-- TestConnect()
	-- TestRemoveIndex()
	-- TestTable()
	-- TestTableDatabase();
	-- TestRangedQuery();
	-- TestPagination()
	-- TestCompoundIndex()
	-- TestCountAPI()
	-- TestDelete()
end

local started = false;
function TabledbRaftClientApp:init()
	if not started then 
		started = true;
		-- raft stateMachine
		logger.info("start stateMachine");
		local rtdb = RaftTableDBStateMachine:new(baseDir, raftThreadName)
		executeAsClient(rtdb)
	end
end
