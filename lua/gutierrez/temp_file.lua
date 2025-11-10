local M = {}

local files_dir = vim.fn.expand("~") .. "/tempfiles"
local function temp_path(name)
    name = name or "default"
    return files_dir .. "/scratch-" .. name .. ".md"
end

local function mkdir_if_does_not_exists(path)
    if vim.fn.isdirectory(path) == 0 then
        local ok, err = pcall(vim.fn.mkdir, path, "p")
        if not ok then
            vim.notify("Failed creating directory: " .. tostring(err), vim.log.levels.ERROR)
        end
    end
end

function M.open_scratch(name)
    local path = temp_path(name)
    mkdir_if_does_not_exists(files_dir)
    vim.cmd("edit " .. vim.fn.fnameescape(path))

    local b = vim.api.nvim_get_current_buf()
    vim.bo[b].swapfile = false
    vim.bo[b].undofile = true
    vim.bo[b].bufhidden = "hide"
    vim.bo[b].filetype = "markdown"
    vim.bo[b].modifiable = true

    local group = "ScratchAutoSave_" .. name
    vim.api.nvim_create_augroup(group, { clear = true })
    vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
        group = group,
        buffer = b,
        callback = function()
            vim.cmd("silent! write")
        end,
    })
    vim.api.nvim_create_autocmd("VimLeavePre", {
        group = group,
        callback = function()
            vim.cmd("silent! wa")
        end,
    })
end

vim.api.nvim_create_user_command("Scratch", function(opts)
    M.open_scratch(opts.args ~= "" and opts.args or nil)
end, { nargs = "?" })

return M
