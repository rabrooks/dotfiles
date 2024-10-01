-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- unhighlight serached words
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Move Visual lines up and down
vim.keymap.set('v', 'K', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'J', ":m '<-2<CR>gv=gv")

-- Format Whole buffer JSON using JQ
vim.keymap.set('n', '<Leader>jq', '<Cmd>%!jq<CR>', { desc = 'JSON Format Buffer' })
vim.keymap.set('n', '<Leader>jqc', '<Cmd>%!jq --compact-output<CR>', { desc = 'JSON Format Buffer Compact' })

-- Format Visual selection JSON using JQ
vim.keymap.set('v', '<Leader>jqv', ":'<,'>!jq<CR>", { desc = 'JSON Format V-Select' })

vim.keymap.set('n', '<leader>pv', '<Cmd>Explore<CR>', { desc = 'Opten up Netrw' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
vim.keymap.set({ 'n', 'i' }, '<F1>', '<ESC>', { silent = true, noremap = true, desc = 'Map F1 tp ESC in normal, insert mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
