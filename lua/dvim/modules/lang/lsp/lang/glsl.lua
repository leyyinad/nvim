local lspconfig = require("lspconfig")

-- lspconfig.glsl_analyzer.setup {}
lspconfig.glslls.setup {
  cmd = { 'glslls', '--stdin', '--target-env', 'opengl' },
}
