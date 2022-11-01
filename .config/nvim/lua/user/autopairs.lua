local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

autopairs.setup({
  -- fast_wrap = {
  -- }
})

local BRACKETS = { { "(", ")" }, { "[", "]" }, { "{", "}" } }
local Rule = require("nvim-autopairs.rule")

autopairs.add_rules({
  Rule(" ", " "):with_pair(function(opts)
    local pair = opts.line:sub(opts.col - 1, opts.col)
    return vim.tbl_contains({
      BRACKETS[1][1] .. BRACKETS[1][2],
      BRACKETS[2][1] .. BRACKETS[2][2],
      BRACKETS[3][1] .. BRACKETS[3][2],
    }, pair)
  end),
})

for _, bracket in pairs(BRACKETS) do
  autopairs.add_rules({
    Rule(bracket[1] .. " ", " " .. bracket[2])
      :with_pair(function()
        return false
      end)
      :with_move(function(opts)
        return opts.prev_char:match(".%" .. bracket[2]) ~= nil
      end)
      :use_key(bracket[2]),
  })
end

local status_ok_cmp_autopairs, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
local status_ok_cmp, cmp = pcall(require, "cmp")

if not (status_ok_cmp_autopairs or status_ok_cmp) then
  return
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
