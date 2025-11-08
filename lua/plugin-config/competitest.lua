return {
    {
        'xeluxee/competitest.nvim',
        dependencies = 'MunifTanjim/nui.nvim',
        config = function() require('competitest').setup({
            compile_command = {
                cpp = {
                    exec = "g++", 
                    args = {
                        "-Wall",
                        "-std=c++23",
                        "-O2",
                        "$(FNAME)",
                        "-o",
                        "E:/OneDrive/Project/cp/tmp/sol.exe"
                    }
                }
            },
            output_compare_method = "squish",
            run_command = {
                cpp = { 
                    exec = "E:/OneDrive/Project/cp/tmp/sol.exe" 
                }
            },
            floating_border = "rounded",
	floating_border_highlight = "FloatBorder",
            runner_ui = {
                interface = "split",
                selector_show_nu = false,
                selector_show_rnu = false,
                show_nu = true,
                show_rnu = false,
                mappings = {
                    run_again = "R",
                    run_all_again = "<C-r>",
                    kill = "K",
                    kill_all = "<C-k>",
                    view_input = { "i", "I" },
                    view_output = { "a", "A" },
                    view_stdout = { "o", "O" },
                    view_stderr = { "e", "E" },
                    toggle_diff = { "d", "D" },
                    close = { "q", "Q" },
                },
                viewer = {
                    width = 0.5,
                    height = 0.5,
                    show_nu = true,
                    show_rnu = false,
                    open_when_compilation_fails = true,
                },
            },
            split_ui = {
                position = "right",
                relative_to_editor = true,
                total_width = 0.5,
                vertical_layout = {
                    { 1, "tc" },
                    { 1, { { 1, "so" }, { 1, "eo" } } },
                    { 1, { { 1, "si" }, { 1, "se" } } },
                },
                total_height = 0.4,
                horizontal_layout = {
                    { 2, "tc" },
                    { 3, { { 1, "so" }, { 1, "si" } } },
                    { 3, { { 1, "eo" }, { 1, "se" } } },
                },
            },
            -- 运行时间
            maximum_time = 3000,
            
            companion_port = 22365,
            testcases_directory = "E:/OneDrive/Project/cp/tmp/tc",
            testcases_use_single_file = false,
            receive_print_message = true,
            start_receiving_persistently_on_setup = false,
            testcases_auto_detect_storage = true,
            -- testcases_single_file_format = "$(FNOEXT).testcases",
            testcases_input_file_format = "$(FABSPATH)_input$(TCNUM).txt",
            testcases_output_file_format = "$(FABSPATH)_output_$(TCNUM).txt",
        }) end,
    }
}
