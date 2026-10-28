# Ejecútalo en Windows PowerShell desde el repositorio, SOLO después de desplegar el fork.
# Hace copia de seguridad del config actual y agrega/actualiza solamente drawdb-mcp-local.
$ErrorActionPreference = 'Stop'
if (-not $env:APPDATA) { throw 'Requiere Windows con APPDATA.' }
if (-not (Get-Command npx -ErrorAction SilentlyContinue)) {
  Write-Warning 'No se ha encontrado npx. Instala Node.js LTS antes de probar el puente.'
}
$url = Read-Host 'URL HTTP del MCP fork DrawDB (ejemplo: http://IP_PRIVADA_DEL_HOST:3100)'
try { $parsed = [uri]$url } catch { throw 'URL inválida.' }
if ($parsed.Scheme -notin @('http','https') -or -not $parsed.Host) { throw 'Se necesita una URL HTTP(S) completa.' }
if ($parsed.UserInfo) { throw 'No pongas credenciales en la URL.' }
Write-Warning 'El fork no autentica el acceso MCP por defecto: restringe acceso a la IP de tu PC antes de continuar.'
$confirmar = Read-Host "¿Agregar la conexión local al Claude Desktop de Windows con URL $url? (escribe SI)"
if ($confirmar -cne 'SI') { Write-Host 'No se ha cambiado ninguna configuración.'; exit 0 }
$dir = Join-Path $env:APPDATA 'Claude'
New-Item -ItemType Directory -Path $dir -Force | Out-Null
$path = Join-Path $dir 'claude_desktop_config.json'
if (Test-Path $path) {
  $backup = "$path.bak-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
  Copy-Item $path $backup -Force
  Write-Host "Copia creada: $backup"
  $raw = Get-Content -Path $path -Raw -Encoding UTF8
  try { $config = $raw | ConvertFrom-Json } catch { throw 'JSON actual inválido. No se modifica.' }
  if ($null -eq $config) { $config = [pscustomobject]@{} }
} else { $config = [pscustomobject]@{} }
if (-not $config.PSObject.Properties['mcpServers'] -or $null -eq $config.mcpServers) {
  $config | Add-Member -NotePropertyName mcpServers -NotePropertyValue ([pscustomobject]@{}) -Force
}
$args = @('-y','mcp-remote',$url)
if ($parsed.Scheme -eq 'http') { $args += '--allow-http' }
$bridge = [pscustomobject]@{command='npx'; args=$args}
$config.mcpServers | Add-Member -NotePropertyName 'drawdb-mcp-local' -NotePropertyValue $bridge -Force
$config | ConvertTo-Json -Depth 100 | Set-Content -Path $path -Encoding UTF8
Write-Host "Guardado en: $path"
Write-Host 'Cierra Claude Desktop COMPLETAMENTE y vuelve a abrirlo; comprueba herramientas MCP reales.'
Write-Warning 'Este método configura el MCP local en Claude Desktop. NO lo convierte en un conector remoto de Cowork ni garantiza que FCC/Ollama invoquen herramientas.'
