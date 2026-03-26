local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

-- Suppress 'search hit BOTTOM, continuing at TOP' messages
vim.opt.shortmess:append("S")

require("lazy").setup({
  -- Treesitter (defer to buffer read)
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    config = function()
      require('nvim-treesitter').setup({
        ensure_installed = {
          "javascript",
          "python",
          "c",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "php",
          "rust"
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,

          disable = function(lang, buf)
            local name = vim.api.nvim_buf_get_name(buf)
            if name:match("%.bash_history$") or name:match("/%.bash_history$") then
              return true
            end
            return false
          end,
        },
      })
    end
  },

  -- Telescope (lazy-load on keys)
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = 'Telescope',
    keys = {
      {
        '<leader>pf',
        function()
          require('telescope.builtin').find_files(
            { hidden = true })
        end,
        desc = "Find Files (including hidden)"
      },
      { '<C-p>',      '<cmd>Telescope git_files<cr>',            desc = "Git Files" },
      { 'gs',         '<cmd>Telescope buffers<cr>',              desc = "Buffers" },
      { '<leader>ph', '<cmd>Telescope help_tags<cr>',            desc = "Find Help Tags" },
      { '<leader>fs', '<cmd>Telescope lsp_document_symbols<cr>', desc = "Find Symbols" },
      { '<leader>gc', '<cmd>Telescope git_commits<cr>',          desc = "Search Git Commits" },
      { '<leader>gb', '<cmd>Telescope git_bcommits<cr>',         desc = "Search Git Commits for Buffer" },
      { '<leader>fk', '<cmd>Telescope keymaps<cr>',              desc = "Find Keymaps" },
      { '<leader>pw', '<cmd>Telescope grep_string<cr>',          desc = "Find Word under Cursor" },
      {
        '<leader>ff',
        function()
          local word = vim.fn.expand("<cword>")
          require('telescope.builtin').grep_string({ search = word })
        end,
        desc = "Find Symbol in Workspace"
      },
      { '<leader>fc', '<cmd>Telescope commands<cr>', desc = "Find Commands" },
      {
        '<leader>ps',
        function()
          vim.ui.input({ prompt = "Grep:" }, function(input)
            if input then
              require('telescope.builtin').grep_string({ search = input })
            end
          end)
        end,
        desc = "Grep for a string (floating input)"
      },
    },
    config = function()
      local actions = require('telescope.actions')
      require('telescope').setup({
        defaults = {
          mappings = {
            i = {
              ['<Right>'] = actions.preview_scrolling_right,
              ['<Left>'] = actions.preview_scrolling_left,
            },
            n = {
              ['<Right>'] = actions.preview_scrolling_right,
              ['<Left>'] = actions.preview_scrolling_left,
            }
          }
        },
        pickers = {
          find_files = {
            hidden = true,
            find_command = { "fd", "--type", "f", "--hidden", "--follow", "--exclude", ".git" },
          }
        }
      })
    end
  },

  -- CMP (defer to insert mode)
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
      'onsails/lspkind.nvim',
    },
    config = function()
      local cmp = require('cmp')
      local lspkind = require('lspkind')

      cmp.setup({
        preselect = cmp.PreselectMode.None,
        completion = {
          completeopt = 'menu,menuone,noinsert,noselect'
        },
        window = {
          completion = {
            border = "rounded",
            scrollbar = true,
            max_height = 15,
            max_width = 80,
            winhighlight = "Normal:Normal,CursorLine:Visual,Search:None",
            col_offset = -3,
            side_padding = 0,
          },
          documentation = {
            border = "rounded",
            max_height = 15,
            max_width = 80
          },
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = lspkind.cmp_format({
            mode = 'text',
            maxwidth = 50,
            ellipsis_char = '...',
            show_labelDetails = true,

            -- Custom menu labels
            menu = ({
              buffer = "[Buf]",
              nvim_lsp = "[LSP]",
              luasnip = "[Snip]",
              path = "[Path]",
            })
          })
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
          { name = 'buffer' },
        }),
        experimental = {
          ghost_text = true,
        },
      })
    end
  },

  -- LSP
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
      },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },

      --sqlite
      { "kkharji/sqlite.lua" } }
  },

  -- Nvim-tree
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      -- disable nvim tree when starting
      vim.cmd([[autocmd VimEnter * :NvimTreeClose]])
      -- optionally enable 24-bit colour
      vim.opt.termguicolors = true

      -- setup with options
      require("nvim-tree").setup({
        sort = {
          sorter = "case_sensitive",
        },
        view = {
          side = 'right',
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = false,
        },
        git = {
          enable = true,
          ignore = false,
          timeout = 500,
        },
      })

      -- NvimTree remap toggle
      vim.api.nvim_set_keymap(
        'n',
        '<A-c>',
        ':NvimTreeToggle<CR>',
        { noremap = true, silent = true, desc = "Toggle NvimTree" }
      )
    end
  },

  -- Colorizer (Hex colors)
  {
    "brenoprata10/nvim-highlight-colors",
    event = "VeryLazy",
    config = function()
      require("nvim-highlight-colors").setup({
        ---Render style: 'background'
        render = 'background',
        enable_hex = true,
        enable_short_hex = true,
        enable_rgb = true,
        enable_hsl = true,
        enable_var_usage = true,
        enable_named_colors = true,

        ---Highlight tailwind colors, e.g. 'bg-blue-500'
        enable_tailwind = true,
      })
    end
  },

  -- Kanagawa (load early for colors; integrate color detection)
  {
    'rebelot/kanagawa.nvim',
    name = 'kanagawa',
    priority = 1000, -- Load early for colors
    config = function()
      require('kanagawa').setup({
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = false },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true,
        dimInactive = false,
        terminalColors = false,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none"
              }
            }
          },
          palette = {},
        },
        overrides = function(colors)
          local theme = colors.theme
          return {
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          }
        end,
        theme = "dragon",
        background = { dark = "dragon", light = "lotus" },
      })

      -- Integrate colors.lua logic (defer file read to VimEnter)
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.cmd.colorscheme('kanagawa-dragon')
          vim.api.nvim_set_hl(0, 'CursorLine', { bg = 'none' })
          vim.cmd 'highlight TelescopeBorder guibg=none'
          vim.cmd 'highlight TelescopeTitle guibg=none'
        end
      })
    end
  },

  -- Indent-blankline (load with treesitter or VeryLazy)
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    config = function()
      local highlight = {
        "IndentDarkGray", "IndentDarkGray2", "IndentGray", "IndentGray2",
        "IndentDarkBlue", "IndentBlue", "IndentCyan",
      }

      local hooks = require "ibl.hooks"
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "IndentDarkGray", { fg = "#1F1F28" })
        vim.api.nvim_set_hl(0, "IndentDarkGray2", { fg = "#2A2A37" })
        vim.api.nvim_set_hl(0, "IndentGray", { fg = "#363646" })
        vim.api.nvim_set_hl(0, "IndentGray2", { fg = "#54546D" })
        vim.api.nvim_set_hl(0, "IndentDarkBlue", { fg = "#223249" })
        vim.api.nvim_set_hl(0, "IndentBlue", { fg = "#2D4F67" })
        vim.api.nvim_set_hl(0, "IndentCyan", { fg = "#658594" })
      end)
      require("ibl").setup { indent = { highlight = highlight } }
    end
  },

  -- Lualine (load early for statusline)
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = "VeryLazy",
    config = function()
      local ok, lualine = pcall(require, 'lualine')
      if not ok then
        return
      end

      local function lsp_clients()
        local bufnr = vim.api.nvim_get_current_buf()
        -- handle 0.10+ vs 0.9 compatibility
        local get_clients = vim.lsp.get_clients or vim.lsp.get_active_clients
        local clients = get_clients({ bufnr = bufnr })

        if next(clients) == nil then return '' end

        local c = {}
        for _, client in pairs(clients) do
          local name = client.name
          if name == "jedi_language_server" then name = "jedi" end
          if name == "eslint" then name = "elnt" end
          if name == "intelephense" then name = "itlphse" end
          if name == "clangd" then name = "cld" end
          if name == "lua_ls" then name = "lua" end
          if name == "rust_analyzer" then name = "rust" end
          table.insert(c, name)
        end

        local str = table.concat(c, '|')

        if #str > 20 then
          return ' ' .. #c .. ' Clients'
        end

        return ' ' .. str
      end

      local colors = {
        crystalBlue = '#7E9CD8',
        lightBlue   = '#A3D4D5',
        sumiBlack   = '#1F1F28',
        fujiWhite   = '#DCD7BA',
        peachRed    = '#FF5D62',
        sakuraPink  = '#D27E99',
        fujiGray    = '#727169',
        trueBlack   = '#000000',
        oniViolet   = '#957FB8',
      }

      local bubbles_theme = {
        normal = {
          a = { fg = colors.trueBlack, bg = colors.sakuraPink },
          b = { fg = colors.fujiWhite, bg = colors.sumiBlack },
          c = { fg = colors.fujiWhite, bg = 'NONE' },
          z = { fg = colors.fujiWhite, bg = colors.sumiBlack },
        },
        insert = {
          a = { fg = colors.trueBlack, bg = colors.crystalBlue },
          z = { fg = colors.fujiWhite, bg = colors.sumiBlack },
        },
        visual = {
          a = { fg = colors.trueBlack, bg = colors.lightBlue },
          z = { fg = colors.fujiWhite, bg = colors.sumiBlack },
        },
        terminal = {
          a = { fg = colors.trueBlack, bg = colors.oniViolet },
          z = { fg = colors.fujiWhite, bg = colors.sumiBlack },
        },
        replace = {
          a = { fg = colors.trueBlack, bg = colors.peachRed },
          z = { fg = colors.fujiWhite, bg = colors.sumiBlack },
        },
        inactive = {
          a = { fg = colors.fujiWhite, bg = colors.sumiBlack },
          b = { fg = colors.fujiWhite, bg = colors.sumiBlack },
          c = { fg = colors.fujiWhite, bg = 'NONE' },
          z = { fg = colors.fujiWhite, bg = colors.sumiBlack },
        },
      }

      -- Function to abbreviate mode names
      local function mode_abbrev(mode)
        local map = {
          ['NORMAL'] = 'N',
          ['INSERT'] = 'I',
          ['VISUAL'] = 'V',
          ['V-LINE'] = 'V-L',
          ['V-BLOCK'] = 'V-B',
          ['REPLACE'] = 'R',
          ['COMMAND'] = 'C',
          ['TERMINAL'] = 'T',
          ['SELECT'] = 'S',
        }
        return map[mode] or mode
      end

      -- Truncate long filenames
      local function truncate_filename(name, max_length)
        if #name > max_length then
          return string.sub(name, 1, max_length) .. "..."
        end
        return name
      end

      -- Function to get file size in a human-readable format
      local function format_filesize()
        local filesize = vim.fn.getfsize(vim.fn.expand('%:p'))
        if filesize < 1024 then
          return filesize .. 'B'
        elseif filesize < 1024 * 1024 then
          return string.format('%.1fKB', filesize / 1024)
        elseif filesize < 1024 * 1024 * 1024 then
          return string.format('%.1fMB', filesize / (1024 * 1024))
        else
          return string.format('%.1fGB', filesize / (1024 * 1024 * 1024))
        end
      end

      -- Function to get position info (col, line, total lines)
      local function position_info()
        local col = vim.fn.col('.') - 1
        local line = vim.fn.line('.')
        local total = vim.fn.line('$')
        return string.format('%d %d%d', col, line, total)
      end

      -- Set up lualine
      lualine.setup {
        options = {
          theme = bubbles_theme,
          component_separators = '',
          section_separators = { left = '', right = '' },
          globalstatus = true,
        },
        sections = {
          lualine_a = {
            {
              'mode',
              separator = { left = ' ' },
              fmt = mode_abbrev,
            },
            {
              position_info,
              separator = { right = '' },
            },
          },
          lualine_b = {
            'progress',
            {
              'searchcount',
              maxcount = 999999,
              timeout = 500,
            },
            { 'filename', fmt = function(str)
              return truncate_filename(str, 200)
            end
            },
            'branch',
            {
              'diagnostics',
              sources = { 'nvim_diagnostic' },
              sections = { 'error', 'warn', 'info', 'hint' },
              symbols = { error = 'E:', warn = 'W:', info = 'I:', hint = 'H:' },
              colored = true,
              update_in_insert = false,
              always_visible = false,
            },
          },
          lualine_c = {
            '%=',
          },
          lualine_x = {
          },
          lualine_y = {
            {
              lsp_clients,
              color = { fg = '#957FB8', gui = 'italic' }
            },
            { 'filename', fmt = function()
              return format_filesize()
            end
            },
            { 'filetype', separator = { right = ' ' }, left_padding = 2 },
          },
          lualine_z = {
          },
        },
        inactive_sections = {
          lualine_a = { 'filename' },
          lualine_b = { 'progress' },
          lualine_c = {},
          lualine_x = {},
          lualine_y = { 'filetype' },
          lualine_z = {},
        },
        tabline = {},
        extensions = {},
      }

      vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", ctermbg = "NONE" })
      vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", ctermbg = "NONE" })
    end
  },

  -- Copilot
  --'github/copilot.vim',

  -- Scrollbar with highlights
  {
    'petertriho/nvim-scrollbar',
    event = 'VeryLazy',
    dependencies = { 'kevinhwang91/nvim-hlslens' },
    config = function()
      local scrollbar = require('scrollbar')
      scrollbar.setup({
        show = true,
        show_in_active_only = false,
        set_highlights = true,
        folds = 1000,
        max_lines = false,
        hide_if_all_visible = true,
        throttle_ms = 50,
        handle = {
          text = ' ',
          blend = 20,
          color = "#2A2A37",
          hide_if_all_visible = true,
        },
        handlers = {
          cursor = true,
          diagnostic = true,
          gitsigns = true,
          handle = true,
          search = false,
          ale = false,
        },
        marks = {
          Cursor = { text = '•', priority = 0, color = nil, gui = nil },
          Search = { text = { '-', 's' }, priority = 1, color = "#2D4F67", gui = nil },
          Error = { text = { '-', 'e' }, priority = 2, color = "#E82424", gui = nil },
          Warn = { text = { '-', 'w' }, priority = 3, color = "#FF9E3B", gui = nil },
          Info = { text = { '-', 'i' }, priority = 4, color = "#76946A", gui = nil },
          Hint = { text = { '-', 'h' }, priority = 5, color = "#54546D", gui = nil },
          Misc = { text = { '-', 'm' }, priority = 6, color = "#49443C", gui = nil },
        },
      })
    end,
  },

  -- Which-Key: Key binding popup
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      preset = "helix",

      show_help = false,
      show_keys = false,

      layout = {
        spacing = 1,
        align = "left",
      },
    }
  },

  -- Autopairs: Auto-close brackets and quotes
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
    dependencies = { 'hrsh7th/nvim-cmp' },
    init = function()
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end
  },
  'stevearc/dressing.nvim',
  'nvim-lua/plenary.nvim',
  'junegunn/fzf',
  { 'junegunn/fzf.vim', dependencies = { 'junegunn/fzf' } },
  {
    'mbbill/undotree',         -- Cmd = 'UndotreeToggle'
    keys = {
      { "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle UndoTree" },
    },
  },
  {
    'tpope/vim-fugitive',      -- Cmd = 'Git'
    keys = {
      {
        "<leader>gs",
        function()
          vim.cmd.Git()
          -- Calculate 1/4 of the total screen height and apply it to the current window
          local win_height = math.floor(vim.o.lines / 4)
          vim.api.nvim_win_set_height(0, win_height)
        end,
        desc = "Git status fugitive",
      },
    },
  },
  'nvim-tree/nvim-web-devicons',
  'lewis6991/gitsigns.nvim',
  'mg979/vim-visual-multi',
}, {
  -- Global lazy.nvim opts for perf
  performance = {
    rtp = {
      -- Disable unused built-ins
      disabled_plugins = {
        --"netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "gzip",
        "zipPlugin"
      },
    },
  },
})
