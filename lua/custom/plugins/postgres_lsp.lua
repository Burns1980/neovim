return {
  'neovim/nvim-lspconfig',
  opts = {
    servers = {
      postgres_lsp = {
        -- On Windows, be explicit about the .exe and avoid wrapping in quotes
        cmd = {
          -- Option A: use the Mason shim directly (recommended if it’s on PATH)
          'postgrestools.exe',
          '--stdio',
        },
        filetypes = { 'sql', 'pgsql', 'plpgsql' },
        root_dir = function(fname)
          return require('lspconfig.util').root_pattern '.git'(fname) or vim.loop.cwd()
        end,
        settings = {
          postgres = {
            experimentalFeatures = true,
          },
        },
      },
    },
  },
}
