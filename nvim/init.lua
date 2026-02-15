-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.termguicolors = true
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) -- для всплывающих окон (LSP, автодополнение)
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })  -- для колонки с знаками (git, диагностика)
