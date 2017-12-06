
-- DB模型测试  

local nws = commonlib.gettable("nws")
local orm = commonlib.gettable("nws.orm")
local admin = nws.inherit(orm)

admin:tablename("admin")                   -- 表名
admin:addfield("demo_id", "number", "ID")       -- 主键id
admin:addfield("username", "string", "username")      -- 用户名字段
admin:addfield("password", "string", "password")      -- 密码字段
admin:addfield("email", "string", "email")  
admin:addfield("cellphone", "string", "cellphone")  
admin:addfield("privilege", "number", "privilege level")  
--admin:insert({username="user1", password="123456"})
--[[

function admin:get()
	return "admin get()"
end
function admin:getUsername()
	return "lizq"
end
function admin:getPassword()
	return "123456"
end
]]
function admin:getNumber()
	return admin:find({_id=1})
end
function admin:login(params)
	if (not params.username) or (not params.password) then 
		return {error="账户名或密码不能为空", data=nil}
	end
	local userInfo = admin:find_one({username=params.username})
	if (not userInfo) then 
		return {error="账户名不存在", data=nil}
	end
	if (userInfo.password ~= params.password) then 
		return {error="账户名或密码错误", data=nil}
	end
	--[[
		local token = encodeJWT({userId=userinfo._id, username=userinfo.username})
		setAuthCookie(token)
	]]
	local token = nws.util.encode_jwt({userId=userInfo._id, username=userInfo.username}, "keepwork", 3600)

	return {error="登录成功", data=userInfo, token=token} 
end

return admin

