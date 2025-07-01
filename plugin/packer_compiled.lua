-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/chickencuber/.cache/nvim/packer_hererocks/2.1.1748459687/share/lua/5.1/?.lua;/home/chickencuber/.cache/nvim/packer_hererocks/2.1.1748459687/share/lua/5.1/?/init.lua;/home/chickencuber/.cache/nvim/packer_hererocks/2.1.1748459687/lib/luarocks/rocks-5.1/?.lua;/home/chickencuber/.cache/nvim/packer_hererocks/2.1.1748459687/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/chickencuber/.cache/nvim/packer_hererocks/2.1.1748459687/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["better-comments.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nSetup\19better-comment\frequire\0" },
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/better-comments.nvim",
    url = "https://github.com/Djancyp/better-comments.nvim"
  },
  ["c3.nvim"] = {
    config = { "\27LJ\2\n\"\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\ac3\frequire\0" },
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/c3.nvim",
    url = "https://github.com/wstucco/c3.nvim"
  },
  catppuccin = {
    config = { "\27LJ\2\nD\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0\21catppuccin-mocha\16colorscheme\bcmd\bvim\0" },
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  harpoon = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/theprimeagen/harpoon"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["mini.indentscope"] = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/mini.indentscope",
    url = "https://github.com/echasnovski/mini.indentscope"
  },
  ["multicursor.nvim"] = {
    config = { "\27LJ\2\n+\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2ÿÿB\0\2\1K\0\1\0\0À\18lineAddCursor+\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\1\0B\0\2\1K\0\1\0\0À\18lineAddCursor,\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2ÿÿB\0\2\1K\0\1\0\0À\19lineSkipCursor,\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\1\0B\0\2\1K\0\1\0\0À\19lineSkipCursor,\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\1\0B\0\2\1K\0\1\0\0À\19matchAddCursor-\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\1\0B\0\2\1K\0\1\0\0À\20matchSkipCursor,\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2ÿÿB\0\2\1K\0\1\0\0À\19matchAddCursor-\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2ÿÿB\0\2\1K\0\1\0\0À\20matchSkipCursorg\0\0\2\1\3\0\r-\0\0\0009\0\0\0B\0\1\2\14\0\0\0X\0\4€-\0\0\0009\0\1\0B\0\1\1X\0\3€-\0\0\0009\0\2\0B\0\1\1K\0\1\0\0\0\17clearCursors\18enableCursors\19cursorsEnabledÆ\1\1\1\6\1\f\0\24\18\1\0\0005\3\0\0'\4\1\0-\5\0\0009\5\2\5B\1\4\1\18\1\0\0005\3\3\0'\4\4\0-\5\0\0009\5\5\5B\1\4\1\18\1\0\0005\3\6\0'\4\a\0-\5\0\0009\5\b\5B\1\4\1\18\1\0\0'\3\t\0'\4\n\0003\5\v\0B\1\4\1K\0\1\0\0À\0\n<esc>\6n\17deleteCursor\14<leader>x\1\3\0\0\6n\6x\15nextCursor\f<right>\1\3\0\0\6n\6x\15prevCursor\v<left>\1\3\0\0\6n\6x£\b\1\0\b\0:\0o6\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0016\1\3\0009\1\4\0019\1\5\1\18\2\1\0005\4\6\0'\5\a\0003\6\b\0B\2\4\1\18\2\1\0005\4\t\0'\5\n\0003\6\v\0B\2\4\1\18\2\1\0005\4\f\0'\5\r\0003\6\14\0B\2\4\1\18\2\1\0005\4\15\0'\5\16\0003\6\17\0B\2\4\1\18\2\1\0005\4\18\0'\5\19\0003\6\20\0B\2\4\1\18\2\1\0005\4\21\0'\5\22\0003\6\23\0B\2\4\1\18\2\1\0005\4\24\0'\5\25\0003\6\26\0B\2\4\1\18\2\1\0005\4\27\0'\5\28\0003\6\29\0B\2\4\1\18\2\1\0'\4\30\0'\5\31\0009\6 \0B\2\4\1\18\2\1\0'\4\30\0'\5!\0009\6\"\0B\2\4\1\18\2\1\0'\4\30\0'\5#\0009\6$\0B\2\4\1\18\2\1\0005\4%\0'\5&\0009\6'\0B\2\4\0019\2(\0003\4)\0B\2\2\0016\2\3\0009\2*\0029\2+\2\18\3\2\0)\5\0\0'\6,\0005\a-\0B\3\4\1\18\3\2\0)\5\0\0'\6.\0005\a/\0B\3\4\1\18\3\2\0)\5\0\0'\0060\0005\a1\0B\3\4\1\18\3\2\0)\5\0\0'\0062\0005\a3\0B\3\4\1\18\3\2\0)\5\0\0'\0064\0005\a5\0B\3\4\1\18\3\2\0)\5\0\0'\0066\0005\a7\0B\3\4\1\18\3\2\0)\5\0\0'\0068\0005\a9\0B\3\4\0012\0\0€K\0\1\0\1\0\1\tlink\15SignColumn\28MultiCursorDisabledSign\1\0\1\tlink\vVisual\30MultiCursorDisabledVisual\1\0\1\freverse\2\30MultiCursorDisabledCursor\1\0\1\tlink\vSearch\28MultiCursorMatchPreview\1\0\1\tlink\15SignColumn\20MultiCursorSign\1\0\1\tlink\vVisual\22MultiCursorVisual\1\0\1\freverse\2\22MultiCursorCursor\16nvim_set_hl\bapi\0\19addKeymapLayer\17toggleCursor\n<c-q>\1\3\0\0\6n\6x\23handleMouseRelease\20<c-leftrelease>\20handleMouseDrag\17<c-leftdrag>\16handleMouse\18<c-leftmouse>\6n\0\14<leader>S\1\3\0\0\6n\6x\0\14<leader>N\1\3\0\0\6n\6x\0\14<leader>s\1\3\0\0\6n\6x\0\14<leader>n\1\3\0\0\6n\6x\0\19<leader><down>\1\3\0\0\6n\6x\0\17<leader><up>\1\3\0\0\6n\6x\0\v<down>\1\3\0\0\6n\6x\0\t<up>\1\3\0\0\6n\6x\bset\vkeymap\bvim\nsetup\21multicursor-nvim\frequire\0" },
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/multicursor.nvim",
    url = "https://github.com/jake-stewart/multicursor.nvim"
  },
  neogit = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua",
    url = "https://github.com/akinsho/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\nð\2\0\0\6\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\a\0005\5\b\0=\5\t\4=\4\n\3=\3\v\0024\3\0\0=\3\f\2B\0\2\1K\0\1\0\rbuftypes\25user_default_options\tsass\fparsers\1\2\0\0\bcss\1\0\2\venable\1\fparsers\0\1\0\14\rtailwind\1\tsass\0\rAARRGGBB\1\nnames\2\vhsl_fn\1\18always_update\1\16virtualtext\bâ– \vcss_fn\1\vRRGGBB\2\bRGB\2\vrgb_fn\1\rRRGGBBAA\1\bcss\1\tmode\16virtualtext\14filetypes\1\0\3\rbuftypes\0\25user_default_options\0\14filetypes\0\1\2\0\0\6*\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/NvChad/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ufo"] = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["org-bullets.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16org-bullets\frequire\0" },
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/org-bullets.nvim",
    url = "https://github.com/akinsho/org-bullets.nvim"
  },
  ["org-roam.nvim"] = {
    config = { "\27LJ\2\nR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\14directory\15~/orgfiles\nsetup\rorg-roam\frequire\0" },
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/org-roam.nvim",
    url = "https://github.com/chipsenkbeil/org-roam.nvim"
  },
  orgmode = {
    config = { "\27LJ\2\n“\2\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\2B\0\2\1K\0\1\0\rmappings\borg\1\0\1\borg\0\1\0\3\21org_global_cycle\1\14org_cycle\1\24org_toggle_checkbox\15<leader>tt\1\0\4\27org_default_notes_file\26~/orgfiles/refile.org\21org_agenda_files\20~/orgfiles/**/*\23org_startup_folded\finherit\rmappings\0\nsetup\forgmode\frequire\0" },
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/orgmode",
    url = "https://github.com/nvim-orgmode/orgmode"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["promise-async"] = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  ["rainbow-delimiters.nvim"] = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/rainbow-delimiters.nvim",
    url = "https://github.com/HiPhish/rainbow-delimiters.nvim"
  },
  ["render-markdown.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\20render-markdown\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/opt/render-markdown.nvim",
    url = "https://github.com/MeanderingProgrammer/render-markdown.nvim"
  },
  ["ron.vim"] = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/ron.vim",
    url = "https://github.com/ron-rs/ron.vim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggle-checkbox.nvim"] = {
    config = { "\27LJ\2\nK\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tchar\6X\nsetup\20toggle-checkbox\frequire\0" },
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/toggle-checkbox.nvim",
    url = "https://github.com/chickencuber/toggle-checkbox.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/chickencuber/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: c3.nvim
time([[Config for c3.nvim]], true)
try_loadstring("\27LJ\2\n\"\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\ac3\frequire\0", "config", "c3.nvim")
time([[Config for c3.nvim]], false)
-- Config for: org-bullets.nvim
time([[Config for org-bullets.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16org-bullets\frequire\0", "config", "org-bullets.nvim")
time([[Config for org-bullets.nvim]], false)
-- Config for: multicursor.nvim
time([[Config for multicursor.nvim]], true)
try_loadstring("\27LJ\2\n+\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2ÿÿB\0\2\1K\0\1\0\0À\18lineAddCursor+\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\1\0B\0\2\1K\0\1\0\0À\18lineAddCursor,\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2ÿÿB\0\2\1K\0\1\0\0À\19lineSkipCursor,\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\1\0B\0\2\1K\0\1\0\0À\19lineSkipCursor,\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\1\0B\0\2\1K\0\1\0\0À\19matchAddCursor-\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\1\0B\0\2\1K\0\1\0\0À\20matchSkipCursor,\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2ÿÿB\0\2\1K\0\1\0\0À\19matchAddCursor-\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2ÿÿB\0\2\1K\0\1\0\0À\20matchSkipCursorg\0\0\2\1\3\0\r-\0\0\0009\0\0\0B\0\1\2\14\0\0\0X\0\4€-\0\0\0009\0\1\0B\0\1\1X\0\3€-\0\0\0009\0\2\0B\0\1\1K\0\1\0\0\0\17clearCursors\18enableCursors\19cursorsEnabledÆ\1\1\1\6\1\f\0\24\18\1\0\0005\3\0\0'\4\1\0-\5\0\0009\5\2\5B\1\4\1\18\1\0\0005\3\3\0'\4\4\0-\5\0\0009\5\5\5B\1\4\1\18\1\0\0005\3\6\0'\4\a\0-\5\0\0009\5\b\5B\1\4\1\18\1\0\0'\3\t\0'\4\n\0003\5\v\0B\1\4\1K\0\1\0\0À\0\n<esc>\6n\17deleteCursor\14<leader>x\1\3\0\0\6n\6x\15nextCursor\f<right>\1\3\0\0\6n\6x\15prevCursor\v<left>\1\3\0\0\6n\6x£\b\1\0\b\0:\0o6\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0016\1\3\0009\1\4\0019\1\5\1\18\2\1\0005\4\6\0'\5\a\0003\6\b\0B\2\4\1\18\2\1\0005\4\t\0'\5\n\0003\6\v\0B\2\4\1\18\2\1\0005\4\f\0'\5\r\0003\6\14\0B\2\4\1\18\2\1\0005\4\15\0'\5\16\0003\6\17\0B\2\4\1\18\2\1\0005\4\18\0'\5\19\0003\6\20\0B\2\4\1\18\2\1\0005\4\21\0'\5\22\0003\6\23\0B\2\4\1\18\2\1\0005\4\24\0'\5\25\0003\6\26\0B\2\4\1\18\2\1\0005\4\27\0'\5\28\0003\6\29\0B\2\4\1\18\2\1\0'\4\30\0'\5\31\0009\6 \0B\2\4\1\18\2\1\0'\4\30\0'\5!\0009\6\"\0B\2\4\1\18\2\1\0'\4\30\0'\5#\0009\6$\0B\2\4\1\18\2\1\0005\4%\0'\5&\0009\6'\0B\2\4\0019\2(\0003\4)\0B\2\2\0016\2\3\0009\2*\0029\2+\2\18\3\2\0)\5\0\0'\6,\0005\a-\0B\3\4\1\18\3\2\0)\5\0\0'\6.\0005\a/\0B\3\4\1\18\3\2\0)\5\0\0'\0060\0005\a1\0B\3\4\1\18\3\2\0)\5\0\0'\0062\0005\a3\0B\3\4\1\18\3\2\0)\5\0\0'\0064\0005\a5\0B\3\4\1\18\3\2\0)\5\0\0'\0066\0005\a7\0B\3\4\1\18\3\2\0)\5\0\0'\0068\0005\a9\0B\3\4\0012\0\0€K\0\1\0\1\0\1\tlink\15SignColumn\28MultiCursorDisabledSign\1\0\1\tlink\vVisual\30MultiCursorDisabledVisual\1\0\1\freverse\2\30MultiCursorDisabledCursor\1\0\1\tlink\vSearch\28MultiCursorMatchPreview\1\0\1\tlink\15SignColumn\20MultiCursorSign\1\0\1\tlink\vVisual\22MultiCursorVisual\1\0\1\freverse\2\22MultiCursorCursor\16nvim_set_hl\bapi\0\19addKeymapLayer\17toggleCursor\n<c-q>\1\3\0\0\6n\6x\23handleMouseRelease\20<c-leftrelease>\20handleMouseDrag\17<c-leftdrag>\16handleMouse\18<c-leftmouse>\6n\0\14<leader>S\1\3\0\0\6n\6x\0\14<leader>N\1\3\0\0\6n\6x\0\14<leader>s\1\3\0\0\6n\6x\0\14<leader>n\1\3\0\0\6n\6x\0\19<leader><down>\1\3\0\0\6n\6x\0\17<leader><up>\1\3\0\0\6n\6x\0\v<down>\1\3\0\0\6n\6x\0\t<up>\1\3\0\0\6n\6x\bset\vkeymap\bvim\nsetup\21multicursor-nvim\frequire\0", "config", "multicursor.nvim")
time([[Config for multicursor.nvim]], false)
-- Config for: catppuccin
time([[Config for catppuccin]], true)
try_loadstring("\27LJ\2\nD\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0\21catppuccin-mocha\16colorscheme\bcmd\bvim\0", "config", "catppuccin")
time([[Config for catppuccin]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\nð\2\0\0\6\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\a\0005\5\b\0=\5\t\4=\4\n\3=\3\v\0024\3\0\0=\3\f\2B\0\2\1K\0\1\0\rbuftypes\25user_default_options\tsass\fparsers\1\2\0\0\bcss\1\0\2\venable\1\fparsers\0\1\0\14\rtailwind\1\tsass\0\rAARRGGBB\1\nnames\2\vhsl_fn\1\18always_update\1\16virtualtext\bâ– \vcss_fn\1\vRRGGBB\2\bRGB\2\vrgb_fn\1\rRRGGBBAA\1\bcss\1\tmode\16virtualtext\14filetypes\1\0\3\rbuftypes\0\25user_default_options\0\14filetypes\0\1\2\0\0\6*\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: toggle-checkbox.nvim
time([[Config for toggle-checkbox.nvim]], true)
try_loadstring("\27LJ\2\nK\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tchar\6X\nsetup\20toggle-checkbox\frequire\0", "config", "toggle-checkbox.nvim")
time([[Config for toggle-checkbox.nvim]], false)
-- Config for: orgmode
time([[Config for orgmode]], true)
try_loadstring("\27LJ\2\n“\2\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\2B\0\2\1K\0\1\0\rmappings\borg\1\0\1\borg\0\1\0\3\21org_global_cycle\1\14org_cycle\1\24org_toggle_checkbox\15<leader>tt\1\0\4\27org_default_notes_file\26~/orgfiles/refile.org\21org_agenda_files\20~/orgfiles/**/*\23org_startup_folded\finherit\rmappings\0\nsetup\forgmode\frequire\0", "config", "orgmode")
time([[Config for orgmode]], false)
-- Config for: org-roam.nvim
time([[Config for org-roam.nvim]], true)
try_loadstring("\27LJ\2\nR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\14directory\15~/orgfiles\nsetup\rorg-roam\frequire\0", "config", "org-roam.nvim")
time([[Config for org-roam.nvim]], false)
-- Config for: better-comments.nvim
time([[Config for better-comments.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nSetup\19better-comment\frequire\0", "config", "better-comments.nvim")
time([[Config for better-comments.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter ]]
vim.cmd [[ packadd render-markdown.nvim ]]

-- Config for: render-markdown.nvim
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\20render-markdown\frequire\0", "config", "render-markdown.nvim")

time([[Sequenced loading]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-autopairs'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
