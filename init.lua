-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.number = true
vim.opt.relativenumber = true
vim.cmd.colorscheme("everforest")

-- ##### Install Font to display icons for code files #######
local function install_nerd_font()
  if vim.fn.executable("fc-list") == 0 then
    return
  end -- not linux, skip

  local installed = vim.fn.system("fc-list | grep -i 'JetBrainsMono Nerd Font'")
  if installed ~= "" then
    return
  end -- already installed

  vim.notify("Installing JetBrainsMono Nerd Font...", vim.log.levels.INFO)

  vim.fn.jobstart({
    "bash",
    "-c",
    [[
      mkdir -p ~/.local/share/fonts &&
      curl -fLo /tmp/JetBrainsMono.zip \
        https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip &&
      unzip -o /tmp/JetBrainsMono.zip -d ~/.local/share/fonts &&
      fc-cache -fv
    ]],
  }, {
    on_exit = function(_, code)
      if code == 0 then
        vim.notify("Nerd Font installed! Restart your terminal.", vim.log.levels.INFO)
      else
        vim.notify("Font install failed.", vim.log.levels.WARN)
      end
    end,
  })
end
install_nerd_font()
-- /END ##### Install Font to display icons for code files #######
