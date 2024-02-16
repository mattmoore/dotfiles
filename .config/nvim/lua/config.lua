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
vim.cmd("colorscheme aura-dark")
local tokyonight = require("lualine.themes.tokyonight")
require("lualine").setup {
  options = {
    theme = tokyonight
  }
}


-- Telescope Setup --
require("telescope").setup()
require("telescope").load_extension "file_browser"
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
vim.api.nvim_set_keymap("n", "<space>.", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })
-- Buffer navigation
vim.api.nvim_set_keymap("n", "gt", ":bn<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "gT", ":bp<CR>", { noremap = true })







-- Rust --
local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
  "n",
  "<leader>p",
  function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end,
  { silent = true, buffer = bufnr }
)
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
