# Agrega una skill al plugin local elegido sin editar marketplace.json.
param(
    [string]$Plugin = '',
    [string]$Nombre = '',
    [string]$CarpetaOrigen = ''
)
$ErrorActionPreference = 'Stop'
$raiz = $PSScriptRoot
$directorioPlugins = Join-Path $raiz 'plugins'
$permitidos = @(Get-ChildItem $directorioPlugins -Directory | Where-Object { Test-Path (Join-Path $_.FullName '.claude-plugin/plugin.json') } | Select-Object -ExpandProperty Name)
Write-Host ('Plugins locales: ' + ($permitidos -join ', '))
if (-not $Plugin) { $Plugin = (Read-Host 'Plugin existente donde añadir la skill').Trim() }
if ($Plugin -notin $permitidos) { throw "Plugin '$Plugin' desconocido. Elige uno de la lista." }
if (-not $Nombre) { $Nombre = (Read-Host 'Nombre corto de la skill, ej. redes-wifi').Trim() }
if ($Nombre -cnotmatch '^[a-z][a-z0-9-]{1,63}$') { throw 'Usa minúsculas, números y guiones; empieza por letra.' }
$destino = Join-Path $directorioPlugins "$Plugin/skills/$Nombre"
if (Test-Path $destino) { throw 'Ya existe una skill con ese nombre: no se sobrescribe.' }
if (-not $CarpetaOrigen) {
    $CarpetaOrigen = (Read-Host 'Ruta de carpeta de skill externa con SKILL.md (Enter para plantilla vacía)').Trim()
}
if ($CarpetaOrigen) {
    if (-not (Test-Path (Join-Path $CarpetaOrigen 'SKILL.md'))) { throw 'La carpeta externa debe contener SKILL.md.' }
    Write-Warning 'Revisa el contenido y scripts de la skill externa antes de instalarla; puede incluir instrucciones o código de terceros.'
    $ok = Read-Host 'Copiar carpeta completa tras revisarla? (escribe SI)'
    if ($ok -cne 'SI') { Write-Host 'Cancelado sin cambios'; exit 0 }
    New-Item -ItemType Directory -Path $destino -Force | Out-Null
    Copy-Item (Join-Path $CarpetaOrigen '*') -Destination $destino -Recurse -Force
} else {
    $descripcion = (Read-Host 'Descripción breve de cuándo utilizarla').Trim()
    if (-not $descripcion) { $descripcion = "Asiste con $Nombre en el homelab" }
    $descripcion = $descripcion.Replace('"', "'")
    New-Item -ItemType Directory -Path $destino -Force | Out-Null
    $contenido = @"
---
name: $Nombre
description: "$descripcion"
---

# $Nombre

Responde en español. No inventes herramientas disponibles ni resultados. No realices modificaciones sin autorización expresa.

## Cuándo usar
Describe qué necesidad resuelve.

## Pasos
1. Comprueba el estado y la evidencia disponibles.
2. Propón opciones seguras y verificables.
3. Confirma la autorización antes de ejecutar cambios.

## Entregable
Presenta los resultados, fuentes y próximos pasos.
"@
    [System.IO.File]::WriteAllText((Join-Path $destino 'SKILL.md'), $contenido, (New-Object System.Text.UTF8Encoding($false)))
}
Write-Host "Skill creada en $destino"
Write-Host 'Revisa SKILL.md. Luego ejecuta .\ACTUALIZAR_MARKETPLACE.ps1 para publicar el cambio.'
