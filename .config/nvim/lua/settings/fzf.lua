--require'fzf-lua'.files({ cmd = "find -type f -not -path '*/node_modules/*' -printf '%P\n'" })

vim.api.nvim_set_keymap('n', ' ff', [[<cmd>lua require('fzf-lua').files({ cmd = "fd --type f --exclude node_modules" })<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ' fb', "<cmd>lua require('fzf-lua').buffers()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ' fp', [[<cmd>lua require('fzf-lua').grep_project({ cmd = "rg --color=always --smart-case -g '!{.git,node_modules,log}/'" })<CR>]], { noremap = true, silent = true })
