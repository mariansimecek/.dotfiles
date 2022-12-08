local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  b.formatting.prettier,

  -- Lua
  b.formatting.stylua,

  -- Shell
  -- b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
  b.diagnostics.eslint_d.with({ -- js/ts linter
    -- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
    condition = function(utils)
      return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
    end,
  })
}

null_ls.setup {
  debug = true,
  sources = sources,
}
