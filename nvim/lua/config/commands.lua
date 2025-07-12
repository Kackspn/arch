local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- return to last position in buffer

vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- auto close terminal

vim.api.nvim_create_autocmd("TermClose", {
  group = augroup,
  callback = function()
    if vim.v.event.status == 0 then
      vim.api.nvim_buf_delete(0, {})
    end
  end,
})


-- CREATE TERMINAl

local terminal_state = {
  buf = nil,
  win = nil,
  is_open = false,
}

local function FloatingTerminal()
  -- close terminal if already open
  if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
    vim.api.nvim_win_close(terminal_state.win, false)
    terminal_state.is_open = false
    return
  end

  -- create buffer if not exist or if not valid
  if not terminal_state.buf or not vim.api.nvim_buf_is_valid(terminal_state.buf) then
    terminal_state.buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_option(terminal_state.buf, 'bufhidden', 'hide')
  end

  -- set dimensions

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns- width) / 2)

  terminal_state.win = vim.api.nvim_open_win(terminal_state.buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  })

  vim.api.nvim_win_set_option(terminal_state.win, 'winblend', 0)
  vim.api.nvim_win_set_option(terminal_state.win, 'winhighlight', 'Normal:FloatingTermNormal,FloatBorder:FloatingTermBorder')

  local has_term = false
  local lines = vim.api.nvim_buf_get_lines(terminal_state.buf, 0, -1, false)
  for _, lines in ipairs(lines) do
    if lines ~= "" then
      has_term = true
      break
    end
  end

  if not has_term then
    vim.fn.termopen(os.getenv("SHELL"))
  end

  terminal_state.is_open = true
  vim.cmd("startinsert")

  -- setup autoclose

  vim.api.nvim_create_autocmd("BufLeave", {
    buffer = terminal_state.buf,
    callback = function() 
      if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
        vim.api.nvim_win_close(terminal_state.win, false)
        terminal_state.is_open = false
      end
    end,
    once = true
  })
end


local function CloseFloatingTerminal()
  if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
    vim.api.nvim_win_close(terminal_state.win, false)
    terminal_state.is_open = false
  end
end


-- KEYMAPS
vim.keymap.set("n", "<leader>t", FloatingTerminal, {noremap = true, silent = true})
vim.keymap.set("t", "<Esc>", CloseFloatingTerminal, {noremap = true, silent = true})

