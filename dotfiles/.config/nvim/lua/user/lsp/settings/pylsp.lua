return {
  settings = {
    pylsp = {
      plugins = {
        -- pycodestyle = {
        --   maxLineLength = 88,
        -- },
        -- formatter options
        black = { enabled = false },
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        -- linter options
        pylint = { enabled = true },
        ruff = { enabled = false },
        pyflakes = { enabled = false },
        pycodestyle = { enabled = false },
        -- type checker
        pylsp_mypy = {
          enabled = true,
        },
        -- auto-completion options
        jedi_completion = { enabled = true, fuzzy = true },
        -- import sorting
        isort = { enabled = true },
      },
    },
  },
}
