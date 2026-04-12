
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'java', 'c', 'lua', "python", "rust", "cpp", "cuda" },
  callback = function()
    -- syntax highlighting, provided by Neovim
    vim.treesitter.start()
    -- folds, provided by Neovim (I don't like folds)
    -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    -- vim.wo.foldmethod = 'expr'
    -- indentation, provided by nvim-treesitter
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

