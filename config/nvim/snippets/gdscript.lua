local ls = require "luasnip"

local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local s = ls.snippet
local c = ls.choice_node
local d = ls.dynamic_node
local i = ls.insert_node
local t = ls.text_node
local sn = ls.snippet_node

ls.add_snippets("gdscript", {
  s("conn", fmta(
    [[
<type>.connect(func(): <func>)
<finish>
]],
    {
      type = i(1),
      func = i(2),
      finish = i(0)
    }
  )),

  s("@ex", fmta(
    [[
<dec> var <name>: <type>
<finish>
    ]],
    {
      dec = c(1, {
        t("@export"),
        t("@onready")
      }),
      name = i(2),
      type = i(3),
      finish = i(0)
    }
  )),

  s("boil", fmta(
    [[
func _ready():
  <start>
  <finish>
  pass

func _process(delta: float):
  pass

func _physics_process(delta: float):
  pass
    ]],
    {
      start = i(1),
      finish = i(0)
    }
  ))
})
