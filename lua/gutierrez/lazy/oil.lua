return {
    "stevearc/oil.nvim",
    version = "*",
    opts = {
        default_file_explorer = true,
        columns = {
            -- "icon",
            -- "permissions",
            "size",
            --"mtime",
        },
        delete_to_trash = false,
        skip_confirm_for_simple_edits = true,
        prompt_save_on_select_new_entry = true,
        cleanup_delay_ms = 2000,
        watch_for_changes = true,
        keymaps = {
            --["g?"] = { "actions.show_help", mode = "n" },
            ["<CR>"] = "actions.select",
            --["<C-s>"] = { "actions.select", opts = { vertical = true } },
            --["<C-h>"] = { "actions.select", opts = { horizontal = true } },
            --["<C-t>"] = { "actions.select", opts = { tab = true } },
            ["<C-p>"] = "actions.preview",
            ["<C-c>"] = { "actions.close", mode = "n" },
            ["<C-l>"] = "actions.refresh",
            ["-"] = { "actions.parent", mode = "n" },
            --["_"] = { "actions.open_cwd", mode = "n" },
            --["`"] = { "actions.cd", mode = "n" },
            --["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
            ["s"] = { "actions.change_sort", mode = "n" },
            --["gx"] = "actions.open_external",
            ["."] = { "actions.toggle_hidden", mode = "n" },
            --["g\\"] = { "actions.toggle_trash", mode = "n" },
        },
        -- Set to false to disable all of the above keymaps
        use_default_keymaps = false,
        view_options = {
            show_hidden = true,
            is_hidden_file = function(name, bufnr)
                local m = name:match("^%.")
                return m ~= nil
            end,
            -- Sort file names with numbers in a more intuitive order for humans.
            -- Can be "fast", true, or false. "fast" will turn it off for large directories.
            natural_order = "fast",
            case_insensitive = false,
            sort = {
                -- see :help oil-columns to see which columns are sortable
                { "type", "asc" },
                { "name", "asc" },
            },
            highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
                return nil
            end,
        },
        preview_win = {
            -- Whether the preview window is automatically updated when the cursor is moved
            update_on_cursor_moved = true,
            -- How to open the preview window "load"|"scratch"|"fast_scratch"
            preview_method = "fast_scratch",
            -- A function that returns true to disable preview on a file e.g. to avoid lag
            disable_preview = function(filename)
                return false
            end,
            -- Window-local options to use for preview window buffers
            win_options = {},
        },
    },
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    lazy = false,
}
