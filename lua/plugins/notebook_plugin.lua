return {
  {
    "benlubas/molten-nvim",
    lazy = false,
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    build = ":UpdateRemotePlugins",
    init = function()
      -- TODO: Make Neovim auto locate the env location
      vim.g.python3_host_prog = vim.fn.expand("/Users/renezeto/projects/test/env/bin/python3")
      vim.g.molten_image_provider = "image.nvim"

      -- TODO: Make Window stay after cursor leaves
      -- TODO: Add auto initialization
      vim.g.molten_image_location = "both" -- Show images in float and virtual text
      vim.g.molten_output_win_border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }
      vim.g.molten_output_show_exec_time = false
      -- vim.g.molten_output_virt_lines = true -- Enable virtual lines for better spacing
      -- vim.g.molten_virt_text_output = true -- Keep output as virtual text after cursor leaves
      -- vim.g.molten_virt_lines_off_by_1 = true -- Better alignment of output

      vim.g.molten_output_win_hide_on_leave = false -- Prevent output window from closing when leaving
      vim.g.molten_output_win_cover_gutter = false -- Don't cover the gutter
    end,
  },
  {
    "3rd/image.nvim",
    opts = {
      backend = "kitty",
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = true,
          filetypes = { "markdown", "vimwiki" },
        },
      },
      -- max_width = 100,
      -- max_height = 12,
      -- max_height_window_percentage = 50, -- Limit height to 50% of window
      -- max_width_window_percentage = 50, -- Limit width to 50% of window
      window_overlap_clear_enabled = true, -- Clear images when windows overlap
      window_overlap_clear_ft_ignore = {
        "cmp_menu",
        "cmp_docs",
        "notify",
        "mason",
        "popup",
      },
      editor_only_render_when_focused = true, -- Hide images when editor loses focus
      tmux_show_only_in_active_window = true, -- Show only in active tmux window
      hijack_file_patterns = { -- Render these files as images
        "*.png",
        "*.jpg",
        "*.jpeg",
        "*.gif",
        "*.webp",
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      code = {
        sign = false,
        width = "full",
        right_pad = 1,
      },
    },
  },
  {
    -- Add which-key group for molten-nvim
    "folke/which-key.nvim",
    keys = {
      {
        "<leader>m",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Molten",
      },
    },
  },
}
