return {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = {
    'pyrightconfig.json',
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    '.git',
  },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'openFilesOnly',
        -- diagnosticSeverityOverrides = {
        --   reportMissingImports = 'none',
        --   reportUndefinedVariable = 'none',
        --   reportGeneralTypeIssues = 'none',
        --   reportMissingModuleSource = 'none',
        -- }
      },
      -- venvPath = os.getenv("VIRTUAL_ENV"),
    },
  },
}
