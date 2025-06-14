local ls = require("luasnip")

local s = ls.s
local t = ls.t
local i = ls.i

return {
  s("trig", {
    i(1),
    t("text"),
    i(2),
    t("text again"),
    i(3),
  }),
}
