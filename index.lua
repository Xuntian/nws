

-- 业务代码开始
nws.router("/", function(ctx)
	ctx.response:render("index.html", {message="Hello world"})
end)

nws.router("/demo", function(ctx)
	ctx.response:render("demo.html", {message="Hello world"})
end)

nws.router("/t1", function(ctx)
	ctx.response:send("asd")
end)


nws.router("/dashboard", function(ctx)
	ctx.response:render("dashboard/index.html")
end)
