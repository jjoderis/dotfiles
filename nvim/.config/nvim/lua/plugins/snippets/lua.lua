local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

local s = ls.s
local t = ls.t
local i = ls.i
local rep = require("luasnip.extras").rep

return {
	s("req", fmt("local {} = require('{}')", { i(1, "default"), rep(1) })),
}
