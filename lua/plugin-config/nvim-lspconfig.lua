return {
      {
          "williamboman/mason.nvim",
          config = function()
              require("mason").setup({
                  ui = { border = "rounded" },
              })
          end,
      },
      { "williamboman/mason-lspconfig.nvim" },
      { "neovim/nvim-lspconfig" },
      config = function()
          require("mason-lspconfig").setup({
              ensure_installed = {
                  "pyright",      -- Python LSP
                  "clangd",       -- C/C++ LSP
                  "lua_ls",       -- Lua LSP
              },
          })

          local lspconfig = require("lspconfig")
          local capabilities = require("cmp_nvim_lsp").default_capabilities()

          -- Python 配置
          lspconfig.pyright.setup({
              capabilities = capabilities,
              settings = {
                  python = {
                      analysis = {
                          typeCheckingMode = "basic",
                          autoSearchPaths = true,
                          useLibraryCodeForTypes = true,
                      },
                  },
              },
          })

          -- C++ 配置
          lspconfig.clangd.setup({
              capabilities = capabilities,
              cmd = {
                  "clangd",
                  "--background-index",
                  "--clang-tidy",
                  "--completion-style=detailed",
                  "--header-insertion=iwyu",
                  "--function-arg-placeholders",
                  "--fallback-style=llvm",
              },
          })

          -- 通用 LSP 键位绑定
          vim.api.nvim_create_autocmd("LspAttach", {
              group = vim.api.nvim_create_augroup("UserLspConfig", {}),
              callback = function(ev)
                  local opts = { buffer = ev.buf }
                  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
                  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
                  vim.keymap.set("n", "<space>wl", function()
                      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                  end, opts)
                  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
                  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
                  vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
                  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                  vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
                  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
                  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
              end,
          })
      end,
  }

