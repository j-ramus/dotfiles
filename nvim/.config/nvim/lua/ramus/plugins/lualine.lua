return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local colors = {
      blue = "#65D1FF",
      green = "#3EFFDC",
      violet = "#FF61EF",
      yellow = "#FFDA7B",
      red = "#FF4A4A",
      fg = "#c3ccdc",
      bg = "#112638",
      inactive_bg = "#2c3043",
    }


    local my_lualine_theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.red, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
        b = { bg = colors.inactive_bg, fg = colors.semilightgray },
        c = { bg = colors.inactive_bg, fg = colors.semilightgray },
      },
    }
    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = my_lualine_theme,
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "filetype" },
        },
      },
      tabline = {
        lualine_a = {
          {
            'buffers',
            show_filename_only = true,
            hide_filename_extension = false,
            show_modified_status = true,
            cond = function()
              -- Only show if more than one meaningful buffer (exclude empty unnamed buffers)
              local bufs = vim.fn.getbufinfo({buflisted = 1})
              local meaningful_bufs = {}
              for _, buf in ipairs(bufs) do
                -- Include if: has a name OR is modified (even if unnamed)
                if buf.name ~= "" or buf.changed == 1 then
                  table.insert(meaningful_bufs, buf)
                end
              end
              return #meaningful_bufs > 1
            end,
            symbols = {
              modified = ' ',
              alternate_file = '',  -- Remove the # symbol
              directory =  '',
            },
            mode = 0, -- 0: Shows buffer name
                      -- 1: Shows buffer index
                      -- 2: Shows buffer name + buffer index
            max_length = vim.o.columns * 2 / 3,
            filetype_names = {
              TelescopePrompt = 'Telescope',
              dashboard = 'Dashboard',
              packer = 'Packer',
              fzf = 'FZF',
              alpha = 'Alpha'
            },
            buffers_color = {
              active = { fg = colors.bg, bg = colors.blue, gui = 'bold' },
              inactive = { fg = colors.fg, bg = colors.inactive_bg },
            },
          }
        },
        lualine_z = {
          {
            'tabs',
            max_length = vim.o.columns / 3,
            tabs_color = {
              active = { fg = colors.bg, bg = colors.blue, gui = 'bold' },
              inactive = { fg = colors.fg, bg = colors.inactive_bg },
            }
          }
        }
      }
    })
  end,
}
