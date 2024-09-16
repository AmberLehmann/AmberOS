local wk = require("which-key")
wk.add({
  { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
  { "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
  { "<leader>b", group = "buffers", expand = function()
      return require("which-key.extras").expand.buf()
    end
  },
  { "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next"},
  { "<leader>bb", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous"},
  { "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "Jump" },

    -- Nested mappings are allowed and can be added in any order
    -- Most attributes can be inherited or overridden on any level
    -- There's no limit to the depth of nesting
    mode = { "n", "v" }, -- NORMAL and VISUAL mode
    { "<leader>q", "<cmd>confirm q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
    { "<leader>w", "<cmd>w<cr>", desc = "Write" },
    { "<leader>c", "<cmd>BufferKill<CR>", desc = "Close Buffer" },
    -- requires toggle_term
    { "<leader>gg","<cmd>lua require 'toggle_term'.lazygit_toggle()<cr>", desc = "Lazygit"},
    { "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight" },
    -- requires nvimtree
    -- { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Explorer"}
    --requires comment.nvim
    { "<leader>/", "<Plug>(comment_toggle_linewise_current)", desc = "Comment toggle current line" },
})
