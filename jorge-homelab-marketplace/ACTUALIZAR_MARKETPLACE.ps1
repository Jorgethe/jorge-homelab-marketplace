# Verifica estructura y publica cambios al mismo repositorio, sin recrear marketplaces.
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
$manifest = Get-Content -Raw -Encoding UTF8 '.claude-plugin/marketplace.json' | ConvertFrom-Json
$nombres=@{}
foreach ($p in $manifest.plugins) {
  if ($nombres.ContainsKey($p.name)) { throw "Plugin duplicado: $($p.name)" }
  $nombres[$p.name]=$true
  if ($p.source -is [string] -and $p.source.StartsWith('./')) {
    $ruta = Join-Path $PSScriptRoot $p.source.Substring(2)
    $pluginJson = Join-Path $ruta '.claude-plugin/plugin.json'
    if (-not (Test-Path $pluginJson)) { throw "No existe $pluginJson" }
    $plugin = Get-Content -Raw -Encoding UTF8 $pluginJson | ConvertFrom-Json
    if ($plugin.name -ne $p.name) { throw "Diferencia de nombres en $($p.name)" }
    $skills = @(Get-ChildItem (Join-Path $ruta 'skills') -Directory -ErrorAction SilentlyContinue)
    foreach ($s in $skills) { if (-not (Test-Path (Join-Path $s.FullName 'SKILL.md'))) { throw "Falta SKILL.md en $($s.FullName)" } }
  }
}
Write-Host "JSON correcto. $($manifest.plugins.Count) plugins declarados."
if (Get-Command claude -ErrorAction SilentlyContinue) {
  Write-Host 'Validación adicional con Claude CLI:'
  & claude plugin validate .
  if ($LASTEXITCODE -ne 0) { throw 'Falló validación Claude CLI; no se publica.' }
} else { Write-Warning 'No está disponible el validador Claude CLI. Validación estructural limitada.' }
if (-not (Get-Command git -ErrorAction SilentlyContinue)) { throw 'Falta Git: sube manualmente los cambios del marketplace al repositorio existente.' }
if (-not (Test-Path '.git')) { throw 'La carpeta no está enlazada con Git. Clona tu repositorio y añade las skills dentro de esa copia.' }
& git status --short
$confirmar = Read-Host '¿Publicar cambios al repositorio Git actual? (escribe SI)'
if ($confirmar -cne 'SI') { Write-Host 'Validado, sin publicar.'; exit 0 }
& git add .claude-plugin plugins README.md *.ps1 GUIA-AMPLIACION.md GUIA-DRAWDB-Y-MEMORIA.md GUIA-DRAWDB-MCP-LOCAL.md CAMBIOS-V3.md CAMBIOS-V4.md
if ($LASTEXITCODE -ne 0) { throw 'git add falló' }
& git diff --cached --quiet
if ($LASTEXITCODE -eq 0) { Write-Host 'Sin cambios nuevos para publicar'; exit 0 }
& git commit -m 'Update skills and plugins in Jorge Homelab Marketplace'
if ($LASTEXITCODE -ne 0) { throw 'git commit falló' }
& git push
if ($LASTEXITCODE -ne 0) { throw 'git push falló, cambios guardados localmente' }
Write-Host 'Publicado. En Claude Desktop, actualiza el marketplace existente; no añadas otro.'
