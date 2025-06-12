return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      window = {
        position = "right",
        width = 30,
        mappings = {
          ["o"] = "open",
          ["l"] = "open",
          ["h"] = "close_node",
          ["<esc>"] = "close_window",
          ["oc"] = false,
          ["od"] = false,
          ["og"] = false,
          ["om"] = false,
          ["on"] = false,
          ["os"] = false,
          ["ot"] = false,
        }
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            ".git",
          },
        },
        follow_current_file = {
          enabled = true,
        },
      },
      default_component_configs = {
        git_status = {
          symbols = {
            unstaged  = "✗",
            staged    = "✓",
            conflict  = "⚡",
          }
        },
      },
    })
    
    vim.keymap.set('n', '<leader>o', ':Neotree toggle<CR>', { silent = true })
  end
}
