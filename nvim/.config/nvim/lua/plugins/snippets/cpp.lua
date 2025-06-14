local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

local s = ls.s
local t = ls.t
local i = ls.i
local c = ls.c
local rep = require("luasnip.extras").rep

return {
	s("print", fmt('std::cout << {} << "\\n";', { i(1) })),
}
