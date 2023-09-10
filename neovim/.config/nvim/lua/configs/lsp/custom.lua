local M = {}

function M.show_documentation()
    if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
        vim.cmd("h " .. vim.fn.expand("<cword>"))
    else
        vim.lsp.buf.hover()
    end
end

function M.custom_capabilities()
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = cmp_lsp.default_capabilities(capabilities)
    return capabilities
end

function M.custom_on_init()
    vim.notify("Language Server Protocol started!", vim.log.levels.INFO)
end

function M.custom_cwd()
    if vim.loop.cwd() == vim.loop.os_homedir() then
        return vim.fn.expand("%:p:h")
    end
    return vim.loop.cwd()
end

function M.custom_on_attach(client, bufnr)
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

    -- load buffer keymap
    M.keymap()
end

function M.keymap()
    local keymap = vim.keymap
    keymap.set("n", "K", "<CMD>Lspsaga hover_doc<CR>", { buffer = true, desc = "LSP: Show documentation" })
    keymap.set(
        "n",
        "<Leader>a",
        "<CMD>Lspsaga outline<CR>",
        { desc = "LSP: Lists LSP document symbols in the current buffer" }
    )
    keymap.set(
        "n",
        "ga",
        "<CMD>Lspsaga code_action<CR>",
        { buffer = true, desc = "LSP: Lists any LSP actions for the word under the cursor which can be triggered" }
    )
    keymap.set(
        "n",
        "gd",
        "<CMD>Lspsaga goto_definition<CR>",
        { buffer = true, desc = "LSP: Goto the definition of the word under the cursor" }
    )
    keymap.set(
        "n",
        "[e",
        "<CMD>Lspsaga diagnostic_jump_prev<CR>",
        { buffer = true, desc = "LSP: Goto previous diagnostic" }
    )
    keymap.set(
        "n",
        "]e",
        "<CMD>Lspsaga diagnostic_jump_next<CR>",
        { buffer = true, desc = "LSP: Goto next diagnostic" }
    )
    keymap.set(
        "n",
        "gR",
        "<CMD>Lspsaga rename<CR>",
        { buffer = true, desc = "LSP: Renames all references to the symbol under the cursor." }
    )

    -- diagnostic
    keymap.set(
        "n",
        "<leader>t",
        "<CMD>TroubleToggle document_diagnostics<CR>",
        { buffer = true, desc = "LSP: Show diagnostic from current buffer" }
    )
    keymap.set(
        "n",
        "<leader>T",
        "<CMD>TroubleToggle workspace_diagnostics<CR>",
        { buffer = true, desc = "LSP: Show diagnostic from current workspace" }
    )
end

function M.default(configs)
    local custom_config = {
        root_dir = M.custom_cwd,
        on_init = M.custom_on_init,
        on_attach = M.custom_on_attach,
        capabilities = M.custom_capabilities(),
    }
    if configs ~= nil then
        for key, value in pairs(configs) do
            custom_config[key] = value
        end
    end
    return custom_config
end

return M
