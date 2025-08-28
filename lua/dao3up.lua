local M = {}
local function run_command_in_terminal(command)
    vim.cmd('botright 12split')

    -- 直接在terminal命令中执行
    vim.cmd('terminal ' .. command)

    local bufnr = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_option(bufnr, 'bufhidden', 'wipe')
    vim.api.nvim_buf_set_option(bufnr, 'buflisted', false)

    vim.cmd('startinsert')

    return bufnr
end

function M.setup(opts)
    opts=opts or {}
    local npx_cmd=opts.npx_cmd or "npx -y --registry=https://mirrors.cloud.tencent.com/npm/ "
    vim.api.nvim_create_user_command('UpLogin', function()
        run_command_in_terminal(npx_cmd.."dao3up@latest login")
    end, {})
    vim.api.nvim_create_user_command('UpNew', function(opts)
        run_command_in_terminal(npx_cmd.."create-arena-project@latest .. && "..npx_cmd.."dao3up@latest init")
    end, {})
    vim.api.nvim_create_user_command('UpLink', function(opts)
        run_command_in_terminal(npx_cmd.."dao3up@latest link")
    end, {})
    vim.api.nvim_create_user_command('UpBuild', function(opts)
        run_command_in_terminal(npx_cmd.."dao3up@latest build")
    end, {})
    vim.api.nvim_create_user_command('UpWatch', function(opts)
        run_command_in_terminal(npx_cmd.."dao3up@latest watch")
    end, {})
end

return M
