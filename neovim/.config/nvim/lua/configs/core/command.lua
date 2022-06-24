local command = vim.api.nvim_create_user_command
local bo = vim.bo

command("WriteAndReload", function()
    if bo.filetype == "vim" then
        vim.cmd("write")
        vim.cmd("source %")
    elseif bo.filetype == "lua" then
        vim.cmd("write")
        vim.cmd("luafile %")
    end
end, { nargs = 0 })

command("LF", function()
    os.execute('tmux display-popup -E "lf ' .. vim.loop.cwd() .. '"')
end, { nargs = 0 })
