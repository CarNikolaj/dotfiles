vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- 1. Starte den Python-Watcher im Hintergrund (damit er Änderungen mitbekommt)
-- Er generiert das Theme neu, wenn du 'wal' ausführst.
os.execute("python ~/.config/nvim/pywal/chadwal.py &> /dev/null &")

-- 2. Autocommand zum Live-Reload
-- Wenn das Python-Skript die Theme-Datei aktualisiert, lädt NvChad die Farben neu.
vim.api.nvim_create_autocmd({ "Signal" }, {
  pattern = { "SIGUSR1" }, -- Wir nutzen ein Signal oder Filewatcher
  callback = function()
    require("base46").load_all_highlights()
  end,
})

-- Alternative: Filewatcher (zuverlässiger als Signale)
-- Wenn sich die generierte Datei ändert, lade neu.
local pywal_file = vim.fn.expand("~/.cache/wal/colors-wal.vim")
local w = vim.loop.new_fs_event()
w:start(pywal_file, {}, vim.schedule_wrap(function()
  require("base46").load_all_highlights()
end))
