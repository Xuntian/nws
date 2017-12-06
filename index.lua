
local admin = nws.import("model/admin")
local adminController = nws.import("controller/adminController")
-- 业务代码开始
nws.router("/", function(ctx)
	ctx.response:send_file("statics/keepwork/index.html")

end)

nws.router("/login", function(ctx)
	ctx.response:send_file("statics/login.html")
end)

nws.router("/demo", function(ctx)
	ctx.response:render("demo.html", {message="Hello world"})
end)

nws.router("/t1", function(ctx)
	local sum = "sum demo"
	ctx.response:send(sum)
end)

nws.router("/admin", adminController)

--[[ nws.router("/login", function(ctx)
	ctx.response:send("login pages")
end) ]]
