vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.leader = ' '

-- vim.keymap.set("n", "<leader>", function() print "hi" end)

vim.o.clipboard = 'unnamedplus'

vim.o.number = true
vim.o.relativenumber = true


vim.o.signcolumn = 'yes'

vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.updatetime = 300

vim.o.termguicolors = true

vim.o.mouse = 'a'

vim.g.transparent_window = true

if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  vim.g.neovide_transparency = 0.9
  -- vim.g.transparency = 0.9
  vim.g.neovide_background_color = "#1C1C25"

end

vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_view_general_viewer = 'zathura'
vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'
vim.g.vimtex_quickfix_open_on_warning = 0

