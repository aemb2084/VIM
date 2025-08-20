-- Configuración de lazy.nvim (gestor de plugins) - Neovim 0.12+
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

-- Configurar lazy.nvim
require("lazy").setup({
  -- Esquema de colores
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        integrations = {
          telescope = true,
          nvimtree = true,
          which_key = true,
          gitsigns = true,
          treesitter = true,
        },
      })
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },

  -- Explorador de archivos mejorado
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 35,
          side = "left",
        },
        renderer = {
          group_empty = true,
          highlight_git = true,
          icons = {
            show = {
              git = true,
              folder = true,
              file = true,
              folder_arrow = true,
            },
          },
        },
        filters = {
          dotfiles = false,
          custom = { ".git", "node_modules", ".cache" },
        },
        git = {
          enable = true,
          ignore = false,
        },
      })
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
      vim.keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>", { desc = "Find file in explorer" })
    end,
  },

  -- Línea de estado moderna
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },

  -- Syntax highlighting avanzado con Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", "vim", "vimdoc", "javascript", "typescript", "python", 
          "html", "css", "json", "markdown", "bash", "yaml", "toml",
          "rust", "go", "cpp", "c"
        },
        highlight = { 
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = "<C-s>",
            node_decremental = "<C-backspace>",
          },
        },
      })
    end,
  },

  -- Fuzzy finder mejorado
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8", 
    dependencies = { 
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          path_display = { "truncate" },
          file_ignore_patterns = { ".git/", "node_modules/", "*.pyc" },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })
      telescope.load_extension("fzf")
      
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Find word" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
      vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
      vim.keymap.set("n", "<leader>fc", builtin.colorscheme, { desc = "Colorschemes" })
    end,
  },

  -- LSP moderno con Mason
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
      
      require("mason-lspconfig").setup({
        ensure_installed = { 
          "lua_ls", 
          "pyright",
          "pylsp",
          "ruff_lsp",
          "ts_ls",  -- Reemplaza tsserver
          "html",
          "cssls",
          "jsonls",
        },
        automatic_installation = true,
      })

      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Configuraciones específicas por servidor
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = { globals = { "vim" } },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              telemetry = { enable = false },
            },
          },
        },
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                autoImportCompletions = true,
              },
            },
          },
        },
        pylsp = {
          settings = {
            pylsp = {
              plugins = {
                pycodestyle = { enabled = false },
                mccabe = { enabled = false },
                pyflakes = { enabled = false },
                flake8 = { enabled = false },
                autopep8 = { enabled = false },
                yapf = { enabled = false },
                rope_autoimport = { enabled = true },
                rope_completion = { enabled = true },
              },
            },
          },
        },
        ruff_lsp = {
          init_options = {
            settings = {
              args = {},
            },
          },
        },
        ts_ls = {},
        html = {},
        cssls = {},
        jsonls = {},
      }

      -- Configurar cada servidor
      for server, config in pairs(servers) do
        config.capabilities = capabilities
        config.on_attach = function(client, bufnr)
          local opts = { buffer = bufnr, silent = true }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
          end, opts)
        end
        lspconfig[server].setup(config)
      end
    end,
  },

  -- Autocompletado avanzado
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      
      -- Cargar snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },

  -- Comentarios inteligentes
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },

  -- Auto pairs inteligentes
  {
    "windwp/nvim-autopairs",
    config = function()
      local autopairs = require("nvim-autopairs")
      autopairs.setup({
        check_ts = true,
        ts_config = {
          lua = { "string", "source" },
          javascript = { "string", "template_string" },
        },
      })
      
      -- Integración con cmp
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  -- Git integration avanzada
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        current_line_blame = true,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol",
          delay = 1000,
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Git navigation
          map("n", "]c", function()
            if vim.wo.diff then return "]c" end
            vim.schedule(function() gs.next_hunk() end)
            return "<Ignore>"
          end, { expr = true })

          map("n", "[c", function()
            if vim.wo.diff then return "[c" end
            vim.schedule(function() gs.prev_hunk() end)
            return "<Ignore>"
          end, { expr = true })

          -- Actions
          map("n", "<leader>hs", gs.stage_hunk)
          map("n", "<leader>hr", gs.reset_hunk)
          map("n", "<leader>hp", gs.preview_hunk)
          map("n", "<leader>hb", function() gs.blame_line({ full = true }) end)
        end,
      })
    end,
  },

  -- Which key mejorado
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      
      local wk = require("which-key")
      wk.setup({
        preset = "modern",
      })
      
      -- Registrar grupos de teclas
      wk.add({
        { "<leader>f", group = "Find" },
        { "<leader>h", group = "Git Hunks" },
        { "<leader>c", group = "Code/Coverage" },
        { "<leader>t", group = "Tabs/Tests" },
        { "<leader>s", group = "Splits/Send" },
        { "<leader>d", group = "Debug" },
        { "<leader>r", group = "REPL" },
        { "<leader>v", group = "Virtual Environment" },
        { "<leader>n", group = "Neogen" },
        { "<leader>m", group = "Format" },
      })
    end,
  },

  -- Indentación visual moderna
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = { 
          char = "│",
          tab_char = "│",
        },
        scope = { 
          enabled = true,
          show_start = true,
          show_end = true,
        },
      })
    end,
  },

  -- Navegación súper rápida
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
      require("leap").opts.highlight_unlabeled_phase_one_targets = true
    end,
  },

  -- Dashboard de inicio
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup({
        theme = "hyper",
        config = {
          week_header = {
            enable = true,
          },
          shortcut = {
            { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
            { desc = " Files", group = "Label", action = "Telescope find_files", key = "f" },
            { desc = " Config", group = "Number", action = "edit ~/.config/nvim/init.lua", key = "c" },
          },
        },
      })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Terminal flotante
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_terminals = true,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })
    end,
  },

  -- Python-specific plugins
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
    config = function()
      require("venv-selector").setup({
        auto_refresh = true,
        dap_enabled = true,
        anaconda_base_path = "~/anaconda3",
        anaconda_envs_path = "~/anaconda3/envs",
      })
      vim.keymap.set("n", "<leader>vs", "<cmd>VenvSelect<cr>", { desc = "Select Python Virtual Environment" })
      vim.keymap.set("n", "<leader>vc", "<cmd>VenvSelectCached<cr>", { desc = "Select Cached Python Virtual Environment" })
    end,
  },

  -- Python debugging
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()
      require("nvim-dap-virtual-text").setup()

      -- Python debugging setup
      require("dap-python").setup("python")

      -- DAP keymaps
      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
      vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step Over" })
      vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
      vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open REPL" })
      vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Run Last" })
      vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })

      -- Auto open/close DAP UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  -- Enhanced Python testing
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            dap = { justMyCode = false },
            args = {"--log-level", "DEBUG"},
            runner = "pytest",
          }),
        },
      })

      -- Test keymaps
      vim.keymap.set("n", "<leader>tt", function() require("neotest").run.run() end, { desc = "Run Test" })
      vim.keymap.set("n", "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Run Test File" })
      vim.keymap.set("n", "<leader>td", function() require("neotest").run.run({strategy = "dap"}) end, { desc = "Debug Test" })
      vim.keymap.set("n", "<leader>ts", function() require("neotest").summary.toggle() end, { desc = "Toggle Test Summary" })
      vim.keymap.set("n", "<leader>to", function() require("neotest").output_panel.toggle() end, { desc = "Toggle Test Output" })
    end,
  },

  -- Code formatting and linting
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          python = { "ruff_format", "ruff_fix" },
          lua = { "stylua" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })

      -- Format keymap
      vim.keymap.set({ "n", "v" }, "<leader>mp", function()
        require("conform").format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        })
      end, { desc = "Format file or range (in visual mode)" })
    end,
  },

  -- Python REPL
  {
    "Vigemus/iron.nvim",
    config = function()
      local iron = require("iron.core")
      iron.setup({
        config = {
          scratch_repl = true,
          repl_definition = {
            python = {
              command = {"python3"},
              format = require("iron.fts.common").bracketed_paste,
            }
          },
          repl_open_cmd = require("iron.view").bottom(40),
        },
        keymaps = {
          send_motion = "<space>sc",
          visual_send = "<space>sc",
          send_file = "<space>sf",
          send_line = "<space>sl",
          send_mark = "<space>sm",
          mark_motion = "<space>mc",
          mark_visual = "<space>mc",
          remove_mark = "<space>md",
          cr = "<space>s<cr>",
          interrupt = "<space>s<space>",
          exit = "<space>sq",
          clear = "<space>cl",
        },
        highlight = {
          italic = true
        },
        ignore_blank_lines = true,
      })
      
      -- REPL keymaps
      vim.keymap.set("n", "<leader>rs", "<cmd>IronRepl<cr>", { desc = "Start REPL" })
      vim.keymap.set("n", "<leader>rr", "<cmd>IronRestart<cr>", { desc = "Restart REPL" })
      vim.keymap.set("n", "<leader>rf", "<cmd>IronFocus<cr>", { desc = "Focus REPL" })
      vim.keymap.set("n", "<leader>rh", "<cmd>IronHide<cr>", { desc = "Hide REPL" })
    end,
  },

  -- Enhanced Python syntax and indentation
  {
    "Vimjas/vim-python-pep8-indent",
    ft = "python",
  },

  -- Python docstring generator
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("neogen").setup({
        enabled = true,
        languages = {
          python = {
            template = {
              annotation_convention = "google_docstrings"
            }
          }
        }
      })
      
      vim.keymap.set("n", "<leader>nf", function() require("neogen").generate({ type = "func" }) end, { desc = "Generate Function Docstring" })
      vim.keymap.set("n", "<leader>nc", function() require("neogen").generate({ type = "class" }) end, { desc = "Generate Class Docstring" })
      vim.keymap.set("n", "<leader>nt", function() require("neogen").generate({ type = "type" }) end, { desc = "Generate Type Docstring" })
    end,
  },

  -- Python import sorting
  {
    "PythonNut/vim-isort",
    ft = "python",
    config = function()
      vim.keymap.set("n", "<leader>is", "<cmd>Isort<cr>", { desc = "Sort Python Imports" })
    end,
  },

  -- Python coverage
  {
    "andythigpen/nvim-coverage",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("coverage").setup({
        commands = true,
        highlights = {
          covered = { fg = "#C3E88D" },
          uncovered = { fg = "#F07178" },
        },
        signs = {
          covered = { hl = "CoverageCovered", text = "▎" },
          uncovered = { hl = "CoverageUncovered", text = "▎" },
        },
        summary = {
          min_coverage = 80.0,
        },
        lang = {
          python = {
            coverage_command = "coverage json --fail-under=0 -q -o -",
          },
        },
      })
      
      vim.keymap.set("n", "<leader>cc", function() require("coverage").load(true) end, { desc = "Load Coverage" })
      vim.keymap.set("n", "<leader>cs", function() require("coverage").summary() end, { desc = "Coverage Summary" })
      vim.keymap.set("n", "<leader>ct", function() require("coverage").toggle() end, { desc = "Toggle Coverage" })
    end,
  },
})