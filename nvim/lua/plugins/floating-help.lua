return {
  "Tyler-Barham/floating-help.nvim",
  config = function()
    local fh = require("floating-help")

    fh.setup({
      -- Defaults
      width = 80, -- Whole numbers are columns/rows
      height = 0.9, -- Decimals are a percentage of the editor
      position = "E", -- NW,N,NW,W,C,E,SW,S,SE (C==center)
    })

    -- Create a keymap for toggling the help window
    vim.keymap.set("n", "<F1>", fh.toggle)

    -- Only replace cmds, not search; only replace the first instance
    local function cmd_abbrev(abbrev, expansion)
      local cmd = "cabbr "
        .. abbrev
        .. ' <c-r>=(getcmdpos() == 1 && getcmdtype() == ":" ? "'
        .. expansion
        .. '" : "'
        .. abbrev
        .. '")<CR>'
      vim.cmd(cmd)
    end

    -- Redirect `:h` to `:FloatingHelp`
    cmd_abbrev("h", "FloatingHelp")
    cmd_abbrev("help", "FloatingHelp")
    cmd_abbrev("helpc", "FloatingHelpClose")
    cmd_abbrev("helpclose", "FloatingHelpClose")
  end,
}
