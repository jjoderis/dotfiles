local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

local s = ls.s
local t = ls.t
local i = ls.i
local f = ls.f
local d = ls.d
local sn = ls.sn
local rep = require("luasnip.extras").rep

local function generate_prop_type_definition(args, parent, user_args)
  local propType = string.sub(args[1][1], 2, #args[1][1] - 1)

  if string.len(propType) == 0 then
    return sn(nil, { t("") })
  end

  if string.find(propType, "%W") or string.find(propType, "PropsWithChildren") then
    return sn(nil, { t("") })
  end

  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  for _, line in ipairs(lines) do
    if line:match(" " .. propType .. " ") then
      return sn(nil, { t("") })
    end
  end

  return sn(nil, fmt("type {} = {{\n{}\n}} {}\n\n\n", { t(propType), i(1), i(2) }))
end

function trim(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

local function generate_function_arguments(args)
  if string.find(args[2][1], "PropsWithChildren") then
    return sn(nil, { t("{ children }") })
  end

  local fmtString = ""
  local nodes = {}
  local nodeIndex = 1

  if #args[1] > 2 then
    for count = 2, math.max(#args[1], 2), 1 do
      local colonPos = string.find(args[1][count], ":")
      if colonPos then
        if #nodes > 0 then
          fmtString = fmtString .. ", "
        else
          fmtString = fmtString .. "{{ "
        end
        fmtString = fmtString .. "{}"
        table.insert(nodes, i(nodeIndex, trim(string.sub(args[1][count], 1, colonPos - 1))))
        nodeIndex = nodeIndex + 1
      end

      if string.find(args[1][count], "PropsWithChildren") then
        if #nodes > 0 then
          fmtString = fmtString .. ", "
        else
          fmtString = fmtString .. "{{ "
        end
        fmtString = fmtString .. "{}"
        table.insert(nodes, i(nodeIndex, "children"))
        nodeIndex = nodeIndex + 1
      end
    end
  end

  if #fmtString > 0 then
    fmtString = fmtString .. " }}"
    return sn(nil, fmt(fmtString, nodes))
  end

  return sn(nil, { i(1) })
end

return {
  s(
    "rfc",
    fmt("{}const {}: React.FC{} = ({}) => {{\n\treturn (\n\t\t{}\n\t);\n}}", {
      d(1, generate_prop_type_definition, { 3 }),
      i(2),
      i(3),
      d(4, generate_function_arguments, { 1, 3 }),
      i(5),
    })
  ),
  s("<>", fmt("<{}>\n{}\n</{}>", { i(1), i(2), rep(1) })),
}
