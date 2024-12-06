local home = vim.env.HOME
local jdtls = require('jdtls')

-- Função para configurar e iniciar o JDTLS
local function setup_jdtls()
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
    local workspace_dir = vim.fn.stdpath('data') .. '/jdtls-workspace/' .. project_name

    -- Determinar configuração para o sistema operacional
    local os_config = 'config_linux' -- Ajuste para config_mac ou config_win se necessário
    if vim.loop.os_uname().sysname == 'Darwin' then
        os_config = 'config_mac'
    elseif vim.loop.os_uname().sysname == 'Windows_NT' then
        os_config = 'config_win'
    end

    -- Caminho para os arquivos instalados pelo Mason
    local mason_jdtls_dir = vim.fn.stdpath('data') .. '/mason/packages/jdtls'
    local launcher_jar = mason_jdtls_dir .. '/plugins/org.eclipse.equinox.launcher_*.jar'

    -- Configuração do JDTLS
    local config = {
        cmd = {
            'java', -- Certifique-se de que o Java está no PATH ou ajuste o caminho completo
            '-Declipse.application=org.eclipse.jdt.ls.core.id1',
            '-Dosgi.bundles.defaultStartLevel=4',
            '-Declipse.product=org.eclipse.jdt.ls.core.product',
            '-Dlog.protocol=true',
            '-Dlog.level=ALL',
            '-Xms1g',
            '-jar', vim.fn.glob(launcher_jar, 1), -- Encontra o JAR principal automaticamente
            '-configuration', mason_jdtls_dir .. '/' .. os_config,
            '-data', workspace_dir,
        },
        root_dir = require('jdtls.setup').find_root({ '.git', 'pom.xml', 'build.gradle' }),
        settings = {
            java = {
                eclipse = { downloadSources = true },
                configuration = { updateBuildConfiguration = "automatic" },
                maven = { downloadSources = true },
                implementationsCodeLens = { enabled = true },
                referencesCodeLens = { enabled = true },
                format = { enabled = true },
            },
        },
        init_options = {
            bundles = {},
        },
    }

    -- Iniciar o cliente LSP do JDTLS
    jdtls.start_or_attach(config)
end

-- Auto-executar o JDTLS ao abrir arquivos Java
vim.api.nvim_create_autocmd("FileType", {
    pattern = "java",
    callback = setup_jdtls,
})
