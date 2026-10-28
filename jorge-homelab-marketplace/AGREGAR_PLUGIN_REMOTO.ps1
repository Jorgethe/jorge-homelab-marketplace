# Agrega al mismo marketplace un plugin de un GitHub confiable, sin registrarlo como marketplace separado.
param([string]$Nombre = '',[string]$Repositorio = '',[string]$Subcarpeta = '')
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
if (-not $Nombre) { $Nombre = (Read-Host 'Nombre EXACTO del plugin.json del repositorio').Trim() }
if ($Nombre -cnotmatch '^[a-z][a-z0-9-]+$') { throw 'Nombre inválido' }
if (-not $Repositorio) { $Repositorio = (Read-Host 'Repositorio GitHub owner/repo').Trim() }
if ($Repositorio -notmatch '^[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+$') { throw 'Repositorio inválido; usa owner/repo' }
if (-not $Subcarpeta) { $Subcarpeta = (Read-Host 'Subcarpeta que contiene .claude-plugin/plugin.json (Enter si está en la raíz)').Trim() }
if ($Subcarpeta -and ($Subcarpeta -match '\.\.' -or $Subcarpeta.StartsWith('/') -or $Subcarpeta.StartsWith('\\'))) { throw 'Ruta de subcarpeta inválida' }
$archivo = Join-Path $PSScriptRoot '.claude-plugin/marketplace.json'
$datos = Get-Content -Raw -Encoding UTF8 $archivo | ConvertFrom-Json
if (@($datos.plugins | Where-Object { $_.name -eq $Nombre }).Count -gt 0) { throw 'El plugin ya está incluido.' }
$origen = if ($Subcarpeta) { @{ source='git-subdir'; url=$Repositorio; path=$Subcarpeta } } else { @{ source='github'; repo=$Repositorio } }
Write-Host "Plugin: $Nombre | Source: $Repositorio/$Subcarpeta"
Write-Warning 'Antes de continuar, comprueba el plugin.json, scripts, hooks, dependencias, permisos y licencia del repositorio externo.'
$ok = Read-Host '¿Has revisado la fuente y quieres añadirla? (escribe SI)'
if ($ok -cne 'SI') { Write-Host 'Cancelado'; exit 0 }
$nuevo = [pscustomobject]@{ name=$Nombre; source=$origen; description="Plugin externo opcional de $Repositorio (revisar permisos antes de activar)" }
$datos.plugins = @($datos.plugins) + @($nuevo)
$json = $datos | ConvertTo-Json -Depth 30
[System.IO.File]::WriteAllText($archivo,($json+"`n"),(New-Object System.Text.UTF8Encoding($false)))
Write-Host 'Añadido al índice. No se instaló ni ejecutó nada. Publica con .\ACTUALIZAR_MARKETPLACE.ps1'
