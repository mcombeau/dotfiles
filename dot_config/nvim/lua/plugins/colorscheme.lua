return {
  {
    -- dir = "~/Documents/perso/colorscheme/monoquoi.nvim",

    "mcombeau/monoquoi.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("monoquoi").setup({
        -- This callback can be used to override the colors used in the palette.
        on_palette = function(palette)
          return palette
        end,
        -- accent_color = "#00b3b3",
        -- accent_color = "#9370db",
        --
        -- accent_color = "#e06c75",
        -- accent_color = "#ee9360",
        -- accent_color = "#e5c07b",
        accent_color = "#98c379",
        -- accent_color = "#56b6c2",
        -- accent_color = "#61afe7",
        -- accent_color = "#c688cd",
        --
        -- accent_color = "#FF0000",
        -- accent_color = "#FF8000",
        -- accent_color = "#FFFF00",
        -- accent_color = "#00FF00",
        -- accent_color = "#0000FF",
        -- accent_color = "#8000FF",
        -- accent_color = "#FF00FF",
        --
        -- accent_color = "#FF8888",
        -- accent_color = "#FFCC88",
        -- accent_color = "#FFFF88",
        -- accent_color = "#88FF88",
        -- accent_color = "#8888FF",
        -- accent_color = "#CC88FF",
        -- accent_color = "#FF88FF",
        --
        -- accent_color = "#FFBBBB",
        -- accent_color = "#FFDDBB",
        -- accent_color = "#FFFFBB",
        -- accent_color = "#BBFFBB",
        -- accent_color = "#BBBBFF",
        -- accent_color = "#DDBBFF",
        -- accent_color = "#FFBBFF",
        -- Enable bold keywords.
        bold_keywords = false,
        -- Enable italic comments.
        italic_comments = true,
        -- Enable general editor background transparency.
        transparent_bg = false,
        -- Enable brighter float border.
        bright_border = true,
        -- Swap the dark background with the normal one.
        swap_backgrounds = true,
        -- Override the styling of any highlight group.
        override = {},
        -- Cursorline options.  Also includes visual/selection.
        cursorline = {
          -- Bold font in cursorline.
          bold = false,
          -- Bold cursorline number.
          bold_number = true,
          -- Available styles: 'dark', 'light'.
          theme = "light",
          -- Blending the cursorline bg with the buffer bg.
          blend = 0.85,
        },
        noice = {
          -- Available styles: `classic`, `flat`.
          style = "classic",
        },
        telescope = {
          -- Available styles: `classic`, `flat`.
          style = "flat",
        },
        leap = {
          -- Dims the backdrop when using leap.
          dim_backdrop = false,
        },
        ts_context = {
          -- Enables dark background for treesitter-context window
          dark_background = true,
        },
      })
      require("monoquoi").load()
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monoquoi",
    },
  },
}
