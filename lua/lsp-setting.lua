-- LSP 服务器特定设置
local M = {}

-- Python 设置
M.pyright = {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticSeverityOverrides = {
                    reportUnusedImport = "information",
                    reportUnusedVariable = "warning",
                },
            },
        },
    },
}

-- C++ 设置
M.clangd = {
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--completion-style=detailed",
        "--header-insertion=iwyu",
        "--function-arg-placeholders",
        "--fallback-style=llvm",
    },
}

return M
