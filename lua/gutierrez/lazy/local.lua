return {
    {
        "gabriGutiz/termacro.nvim",
        config = function()
            require("termacro").setup({
                default_commands = {
                    {
                        key = "l",
                        command = "ls -al",
                        buffer = true,
                    },
                },
                execute_key = "e",
            })
        end,
    },
}
