local flutter_tools = require("flutter-tools");

flutter_tools.setup {
  ui = {
    border = "rounded",
  },
  decorations = {
    statusline = {
      app_version = true,
      device = true,
    },
  },
  lsp = {
    color = {
      enabled = true,
      background = true,
      foreground = true,
    },
  },
  dev_log = {
    enabled = true,
    open_cmd = "tabedit",
  },
  debugger = {
    enabled = true,
    run_via_dap = true,
  },
  fvm = true, 
  widget_guides = {
    enabled = true,
  },
  closing_tags = {
    highlight = "Comment",
    prefix = "// ",
  },
}
