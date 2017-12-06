local admin = nws.import("model/admin")	
-- 获取控制器类
local controller = commonlib.gettable("nws.controller")
--  创建test控制器
local adminController = controller:new("adminController")

-- 编写test方法
function adminController:test(ctx)
	local userlist =  admin:find()
	ctx.response:send(userlist)
end

function adminController:login(ctx)

	local params = ctx.request:get_params()
	local result = admin:login(params)
	
	ctx.response:send(result)
end

return adminController
