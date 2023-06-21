local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.prettierd.with {
    filetypes = { "html", "markdown", "css", "javascript", "javascriptreact", "typescript", "typesriptreact" },
  }, -- so prettier works only on these filetypes
  b.diagnostics.eslint_d.with { filetypes = { "javascript", "javascriptreact", "typescript", "typesriptreact" } },
  b.diagnostics.codespell,

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,
}
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end
  end,
}
