-- Temporary debug file to track window resizes
-- Add `require('abrooks.core.debug-resize')` to your init.lua temporarily

vim.api.nvim_create_autocmd({ 'WinResized', 'VimResized' }, {
  callback = function(args)
    local msg = string.format('[%s] Window resized - Event: %s, Buffer: %s, File: %s',
      os.date('%H:%M:%S'),
      args.event,
      vim.api.nvim_buf_get_name(args.buf),
      vim.fn.expand('%:t')
    )
    vim.notify(msg, vim.log.levels.INFO)
    -- Also log to a file for review
    local log_file = vim.fn.stdpath('state') .. '/resize-debug.log'
    local file = io.open(log_file, 'a')
    if file then
      file:write(msg .. '\n')
      file:close()
    end
  end,
  desc = 'Debug window resize events'
})

vim.keymap.set('n', '<leader>dr', function()
  local log_file = vim.fn.stdpath('state') .. '/resize-debug.log'
  vim.cmd('edit ' .. log_file)
end, { desc = 'View resize debug log' })