
-- DB模型测试  

local nws = commonlib.gettable("nws")
local orm = commonlib.gettable("nws.orm")
local admin = nws.inherit(orm)

admin:tablename("admin")                   -- 表名
--demo:addfield("demo_id", "number", "ID")       -- 主键id
admin:addfield("username", "string", "用户名")      -- 用户名字段
admin:addfield("password", "string", "密码")      -- 密码字段
admin:addfield("email", "string", "email")  
admin:addfield("cellphone", "string", "cellphone")  
admin:addfield("privilege", "number", "privilege level")  

function admin:login(x, y)
	return x + y
end

return demo

