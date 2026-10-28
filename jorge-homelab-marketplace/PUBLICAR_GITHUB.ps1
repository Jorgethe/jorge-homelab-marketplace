$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
if (-not (Get-Command git -ErrorAction SilentlyContinue)) { throw 'Falta Git. Instala Git for Windows o publica los archivos manualmente.' }
if (-not (Get-Command gh -ErrorAction SilentlyContinue)) { throw 'Falta GitHub CLI (gh). Instálalo o publica los archivos manualmente.' }
& gh auth status
if ($LASTEXITCODE -ne 0) { throw 'Ejecuta primero: gh auth login' }
$repoName = 'jorge-homelab-marketplace'
$owner = (& gh api user --jq .login).Trim()
if (-not $owner) { throw 'No pude identificar la cuenta de GitHub.' }
& gh repo view "$owner/$repoName" --json name *> $null
if ($LASTEXITCODE -eq 0) { throw "El repositorio $owner/$repoName ya existe. No voy a modificarlo automáticamente." }
if (-not (Test-Path .git)) { & git init -b main; if ($LASTEXITCODE -ne 0) { throw 'git init falló.' } }
& git add .claude-plugin plugins README.md PUBLICAR_GITHUB.ps1 AGREGAR_SKILL.ps1 AGREGAR_PLUGIN_REMOTO.ps1 ACTUALIZAR_MARKETPLACE.ps1 GUIA-AMPLIACION.md GUIA-DRAWDB-Y-MEMORIA.md
if ($LASTEXITCODE -ne 0) { throw 'git add falló.' }
& git diff --cached --quiet
if ($LASTEXITCODE -eq 0) { throw 'No hay cambios que publicar.' }
& git commit -m 'Initial homelab marketplace'
if ($LASTEXITCODE -ne 0) { throw 'git commit falló. Comprueba user.name y user.email en Git.' }
& gh repo create "$owner/$repoName" --public --source . --remote origin --push
if ($LASTEXITCODE -ne 0) { throw 'La publicación ha fallado. Revisa el estado de Git/GitHub.' }
Write-Host "Publicado: $owner/$repoName"
Write-Host "Añadir a Claude Desktop: $owner/$repoName"
