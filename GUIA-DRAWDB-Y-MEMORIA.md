# Memoria y DrawDB (v3 — instancia Docker local)

## Memoria

- `memoria-homelab`: reglas de trabajo para registrar decisiones en Markdown. No crea memoria automática ni accede a archivos si el cliente no tiene las herramientas necesarias.
- `claude-mem`: plugin orientado principalmente a Claude Code, con hooks y proceso local; verificar compatibilidad antes de usarlo con Claude Desktop.
- `claude-mem-cowork`: puede sincronizar información con cmem.ai externo; **no activar** si se exige mantener los datos únicamente en el homelab.

## DrawDB: solo tu contenedor Docker

Este marketplace **NO incluye `@drawdb/mcp` ni una clave DrawDB Pro Cloud**. La versión v2 incluía un plugin `drawdb-mcp-readonly`, que se ha **sustituido** por `drawdb-local`. La configuración `.mcp.json` de aquel plugin se ha eliminado.

### Qué puede hacer hoy Claude

1. Consultar un esquema real PostgreSQL/Supabase cuando disponga de un conector o acceso de lectura **verificado**; no asumir que existe acceso por mencionar Supabase.
2. Generar SQL/DBML de diseño para importar manualmente en tu DrawDB local.
3. Si ya existe una base, utilizar la función **File → Import from database** cuando esté presente en tu versión de DrawDB: el editor suministra una consulta de catálogo, que se ejecuta en PostgreSQL/Supabase y cuyo resultado se pega/importa en DrawDB. Alternativamente importar DDL SQL de solo esquema.
4. Analizar archivos JSON/DDB/SQL/DBML exportados desde tu DrawDB cuando el usuario los comparta.
5. Ayudar con copias y comparación entre el diagrama y las migraciones de tu proyecto.

### Qué NO hace todavía

- No lee ni modifica directamente el estado del navegador DrawDB ni ofrece control programático sobre el lienzo.
- No sincroniza automáticamente cambios DrawDB ↔ PostgreSQL.
- No proporciona una API ni un MCP local por instalar una skill.
- No hace falta exponer tu contenedor en Internet, cambiar OPNsense ni conectarte a DrawDB Pro Cloud.

### Copia de seguridad importante

En el editor libre OSS los diagramas se almacenan habitualmente en **IndexedDB del navegador**; un backup del contenedor Docker podría **no incluirlos**. Exporta tu diagrama como JSON/DDB desde el editor y guarda copia en una ubicación de tu homelab. Prueba una importación de restauración antes de confiar en la copia. Comprueba si tu instalación tiene backend de almacenamiento adicional, sin darlo por hecho.

### Edición automática real mediante MCP (añadida en v4)

La v4 añade el plugin **opcional** `drawdb-mcp-local` para el fork https://github.com/anatoly-lab/drawdb-mcp. Se despliega **en otro contenedor**, no se instala encima del DrawDB oficial. Requiere una conexión MCP configurada por separado. Lee `GUIA-DRAWDB-MCP-LOCAL.md` antes de activarlo. El estado backend del fork es volátil en reinicios: exporta JSON.

## Actualizar desde v2

1. Sustituye los archivos por los de v3 en **el mismo repositorio Git**.
2. Si habías instalado `drawdb-mcp-readonly`, **desinstálalo/desactívalo** en Claude Desktop; la nueva versión del marketplace no lo utiliza.
3. Publica con `ACTUALIZAR_MARKETPLACE.ps1` desde tu clon Git y actualiza el mercado existente en Claude Desktop.
4. Instala `drawdb-local` y `drawdb-supabase`; no existe un nuevo marketplace que registrar.

## Fuentes

- https://github.com/drawdb-io/drawdb
- https://drawdb-io.github.io/docs/how-it-works
- https://www.drawdb.app/blog/generate-er-diagram-from-database
- https://drawdb-io.github.io/docs/pro/mcp (para explicar por qué **no** usarlo)
- https://github.com/anatoly-lab/drawdb-mcp (alternativa, no incluida)
