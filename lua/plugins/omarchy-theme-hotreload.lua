return {
  {
    name = "theme-hotreload",
    dir = vim.fn.stdpath("config"),
    lazy = false,
    priority = 1000,
    config = function()
      -- Detect macOS
      local is_mac = vim.fn.has("mac") == 1
      local transparency_file = vim.fn.stdpath("config") .. "/plugin/after/transparency.lua"

      if is_mac then
        -- Apply Everforest theme on macOS
        vim.cmd.colorscheme("everforest")
        return
      end

      -- Set up hotreload for other platforms
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyReload",
        callback = function()
          package.loaded["plugins.theme"] = nil

          vim.schedule(function()
            local ok, theme_spec = pcall(require, "plugins.theme")
            if not ok then
              return
            end

            -- Find the theme plugin and unload it
            local theme_plugin_name = nil
            for _, spec in ipairs(theme_spec) do
              if spec[1] and spec[1] ~= "LazyVim/LazyVim" then
                theme_plugin_name = spec.name or spec[1]
                break
              end
            end

            -- Reset highlights
            vim.cmd("highlight clear")
            if vim.fn.exists("syntax_on") == 1 then
              vim.cmd("syntax reset")
            end
            vim.o.background = "dark"

            -- Unload plugin Lua modules
            if theme_plugin_name then
              local plugin = require("lazy.core.config").plugins[theme_plugin_name]
              if plugin then
                local plugin_dir = plugin.dir .. "/lua"
                require("lazy.core.util").walkmods(plugin_dir, function(modname)
                  package.loaded[modname] = nil
                  package.preload[modname] = nil
                end)
              end
            end

            -- Reload LazyVim theme
            for _, spec in ipairs(theme_spec) do
              if spec[1] == "LazyVim/LazyVim" and spec.opts and spec.opts.colorscheme then
                local colorscheme = spec.opts.colorscheme
                require("lazy.core.loader").colorscheme(colorscheme)

                vim.defer_fn(function()
                  pcall(vim.cmd.colorscheme, colorscheme)
                  vim.cmd("redraw!")

                  -- Load transparency if file exists
                  if vim.fn.filereadable(transparency_file) == 1 then
                    vim.defer_fn(function()
                      vim.cmd.source(transparency_file)
                      vim.api.nvim_exec_autocmds("ColorScheme", { modeline = false })
                      vim.api.nvim_exec_autocmds("VimEnter", { modeline = false })
                      vim.cmd("redraw!")
                    end, 5)
                  end
                end, 5)

                break
              end
            end
          end)
        end,
      })
    end,
  },
}
