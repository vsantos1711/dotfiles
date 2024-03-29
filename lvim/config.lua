-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Keymaps
-- move lines up and down (littlebox)
vim.keymap.set("n", "<A-j>", ":m .+1<cr>==")
vim.keymap.set("n", "<A-k>", ":m .-2<cr>==")

vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")


-- Additional Plugins
lvim.plugins = {
  {
    'andweeb/presence.nvim',
    lazy = false
  },
  {
    'wakatime/vim-wakatime',
    lazy = false
  },
  {
		"github/copilot.vim",
		event = "VeryLazy",
		config = function()
			-- copilot assume mapped
			vim.g.copilot_assume_mapped = true
			vim.g.copilot_no_tab_map = true
		end,
	},
	{
		"hrsh7th/cmp-copilot",
		config = function()
			lvim.builtin.cmp.formatting.source_names["copilot"] = "( )"
			table.insert(lvim.builtin.cmp.sources, 2, { name = "copilot" })
		end,
	},
  {
    'folke/trouble.nvim',
    keys = {
      { "<leader>tt", "<cmd>TroubleToggle<CR>", desc = "Trouble Toggle", },
    },
    config = function()
      require("trouble").setup {
        -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
        mode = "workspace_diagnostics",
        position = "bottom", -- position of the list can be: bottom, top, left, right
        height = 15,
        padding = false,
        action_keys = {
          -- key mappings for actions in the trouble list
          close = "q",                -- close the list
          cancel = "<esc>",           -- cancel the preview and get back to your last window / buffer / cursor
          refresh = "r",              -- manually refresh
          jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
          open_split = { "<c-x>" },   -- open buffer in new split
          open_vsplit = { "<c-v>" },  -- open buffer in new vsplit
          open_tab = { "<c-t>" },     -- open buffer in new tab
          jump_close = { "o" },       -- jump to the diagnostic and close the list
          toggle_mode = "m",          -- toggle between "workspace" and "document" diagnostics mode
          toggle_preview = "P",       -- toggle auto_preview
          hover = "K",                -- opens a small popup with the full multiline message
          preview = "p",              -- preview the diagnostic location
          close_folds = { "zM" },     -- close all folds
          open_folds = { "zR" },      -- open all folds
          toggle_fold = { "za" },     -- toggle fold of current file
        },
        auto_jump = {},
        use_diagnostic_signs = true,
      }
    end
  },

}


vim.opt.timeoutlen = 500


