vim.opt.number = true
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.mouse = 'a'
vim.opt.termguicolors = true
-- vim.opt.guifont = "DejaVu Sans Mono for Powerline"
-- vim.opt.guifont = "Source Code Pro:h12:#h-slight"


-- Theming --
--vim.cmd("colorscheme aura-dark")
--vim.cmd("colorscheme catppuccin-mocha")
--vim.cmd("colorscheme carbonfox")
vim.cmd("colorscheme tokyonight-night")
local tokyonight = require("lualine.themes.tokyonight")
require("lualine").setup {
  options = {
    theme = tokyonight
  }
}
vim.cmd("hi normal guibg=NONE")


-- Telescope Setup --
require("telescope").load_extension("file_browser")
--require("telescope").load_extension("media_files")
require("telescope").setup {
  extensions = {
    file_browser = {},
    media_files = {
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "rg"
    }
  }
}
require("bufferline").setup()
require("nvim-web-devicons").setup()
local builtin = require('telescope.builtin')


require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.api.nvim_set_keymap(
  "n",
  "T",
  ":NvimTreeToggle<CR>",
  { noremap = true }
)


-- Key bindings --
vim.keymap.set('v', '<', '<gv', { remap = false })
vim.keymap.set('v', '>', '>gv', { remap = false })
-- Telescope
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- Telescope file browser
-- Standard:
--vim.api.nvim_set_keymap("n", "<space>fb", ":Telescope file_browser<CR>", { noremap = true })
-- Open file_browser with the path of the current buffer:
vim.api.nvim_set_keymap("n", "<space>.", ":Telescope file_browser path=%:p:h select_buffer=true hidden=true<CR>", { noremap = true })
-- Telescope Media Files
vim.keymap.set('n', '<leader>fm', ":Telescope media_files<CR>", {})
-- Buffer navigation
vim.api.nvim_set_keymap("n", "gt", ":bn<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "gT", ":bp<CR>", { noremap = true })
