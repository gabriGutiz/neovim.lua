return {
    "gabriGutiz/oil.nvim",
    version = "*",
    opts = {
        default_file_explorer = true,
        columns = {
            "size",
            "icon",
        },
        delete_to_trash = false,
        skip_confirm = true,
        prompt_save_on_select_new_entry = true,
        cleanup_delay_ms = 2000,
        watch_for_changes = true,
        keymaps = {
            ["<CR>"] = "actions.select",
            ["<C-p>"] = "actions.preview",
            ["<C-c>"] = { "actions.close", mode = "n" },
            ["<C-l>"] = "actions.refresh",
            ["-"] = { "actions.parent", mode = "n" },
            ["<C-s>"] = { "actions.change_sort", mode = "n" },
            ["."] = { "actions.toggle_hidden", mode = "n" },
        },
        use_default_keymaps = false,
        view_options = {
            show_hidden = true,
            is_hidden_file = function(name, bufnr)
                local m = name:match("^%.")
                return m ~= nil
            end,
            natural_order = "fast",
            case_insensitive = false,
            sort = {
                { "type", "asc" },
                { "name", "asc" },
            },
            highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
                return nil
            end,
        },
        preview_win = {
            update_on_cursor_moved = true,
            preview_method = "fast_scratch",
            disable_preview = function(filename)
                return false
            end,
            win_options = {},
        },
    },
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    lazy = false,
}
