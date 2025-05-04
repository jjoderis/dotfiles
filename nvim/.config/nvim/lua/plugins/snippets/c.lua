local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

local s = ls.s
local t = ls.t
local i = ls.i
local c = ls.c
local rep = require("luasnip.extras").rep

return {
	s("ifn", fmt("#ifndef {}\n#define {}\n\n{}\n\n#endif", { i(1), rep(1), i(2) })),
	s("print", fmt('std::cout << {} << "\\n";', { i(1) })),
	s("inc", fmt("#include {}", { c(1, { fmt('"{}"', { i(1) }), fmt("<{}>", { i(1) }) }) })),
}
