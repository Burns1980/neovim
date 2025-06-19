-- ~/.config/nvim/lua/custom/plugins/database.lua
return {
  {
    'tpope/vim-dadbod',
    dependencies = {
      'kristijanhusak/vim-dadbod-ui',
    },
  },
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      'tpope/vim-dadbod',
    },
    config = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_save_location = vim.fn.stdpath 'data' .. '/db_ui'

      -- Define all your database connections here
      vim.g.dbs = {
        ['supabase_local'] = 'postgres://postgres:postgres@localhost:54322/postgres',
        ['supabase_cloud'] = 'postgres://postgres:[YOUR-CLOUD-PASSWORD]@db.[YOUR-PROJECT-ID].supabase.co:5432/postgres',
      }
    end,
    keys = {
      { '<leader>db', '<cmd>DBUIToggle<cr>', desc = 'Toggle Database UI' },
      { '<leader>du', '<cmd>DBUI<cr>', desc = 'DB UI window' },
    },
  },
}
