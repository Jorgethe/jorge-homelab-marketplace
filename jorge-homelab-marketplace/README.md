# Jorge Homelab Marketplace — v4 (DrawDB local + MCP opcional)

Marketplace único de Claude Desktop para el homelab, IA local, memoria, bases de datos, documentación y seguridad. **Todos los flujos DrawDB están diseñados para el contenedor autoalojado; no utiliza DrawDB Pro Cloud.**

## Plugins incluidos

| Plugin | Tipo | Función |
|---|---|---|
| `homelab-infra` | Local | Proxmox, OPNsense, TrueNAS y Docker |
| `ia-local` | Local | Ollama, FCC, OmniRoute, diagnóstico de herramientas |
| `homelab-documentacion` | Local | Inventarios, diagramas, runbooks |
| `desarrollo-apps` | Local | Next.js, Prisma, PostgreSQL |
| `seguridad-y-calidad` | Local | Auditorías, confirmación y verificación |
| `docker-skills` | Externo | Colección oficial Docker |
| `superpowers` | Externo | Depuración, pruebas y validación |
| `fullstack-dev-skills` | Externo | Colección de desarrollo de software |
| `memoria-homelab` | Local | Contexto Markdown; no memoria automática |
| **`drawdb-supabase`** | Local | SQL/DBML e importación de esquemas a DrawDB Docker |
| **`drawdb-local`** | Local | Import/export, respaldo, diagnóstico de DrawDB autoalojado |
| **`drawdb-mcp-local`** | Local opcional | Guía, pruebas y copias para fork anatoly-lab/drawdb-mcp. Requiere desplegar segundo contenedor y conectar MCP aparte |
| `claude-mem` | Externo opcional | Memoria Claude Code con configuración adicional |
| `claude-mem-cowork` | Externo opcional | Memoria Cowork, puede enviar contenido a cmem.ai externo |

**14 plugins declarados, 26 skills locales.** Los tres plugins de trabajo con DrawDB/BD descritos arriba no conectan automáticamente el navegador ni leen PostgreSQL sin una herramienta real. No se incluyen credenciales ni redes internas.

## Novedades v4

- Añadido `drawdb-mcp-local` con 2 skills, ejemplo Docker Compose para pruebas, fragmento de configuración MCP y script opcional de configuración local de Claude Desktop.
- El fork MCP es una instalación separada del DrawDB oficial. No sustituye ni sincroniza automáticamente el original.
- El backend del fork tiene estado en memoria: **exportar JSON antes de reiniciar**.
- Guía: `GUIA-DRAWDB-MCP-LOCAL.md`. El marketplace NO activa servidores automáticamente ni publica endpoints.

## Qué ha cambiado desde la v2

- Eliminado `drawdb-mcp-readonly` y su `.mcp.json` (el MCP oficial va orientado a diagramas Pro cloud, no a tu editor OSS Docker).
- Añadido `drawdb-local` para importaciones, exportaciones, copias y diagnósticos.
- Reescritas las skills de PostgreSQL/Supabase para el **DrawDB local**, sin asumir APIs, sincronización ni MCP.
- Documentada la persistencia frecuente en **IndexedDB del navegador**: exportar JSON/DDB para respaldar los diagramas.
- Todo lo demás, incluidos scripts de ampliación y opciones de memoria, se mantiene.

## Publicación / actualización

Descomprime este ZIP y publica su **contenido** en la raíz de tu repositorio `jorge-homelab-marketplace` conservando `.claude-plugin/marketplace.json`.

- Si es nuevo: en Claude Desktop → Configuración → Plugins → Mercados de plugins → Añadir, registra `TU_USUARIO/jorge-homelab-marketplace`.
- Si ya lo registraste: **no añadas otro marketplace**; reemplaza archivos, publica con Git y actualiza el existente desde Claude Desktop.
- Si instalaste `drawdb-mcp-readonly`, desactívalo o desinstálalo; en v3 ya no existe.
- Para DrawDB local activa `drawdb-supabase` y `drawdb-local`. `drawdb-mcp-local` es opcional: necesitas desplegar el fork y conectar su MCP por separado.

Más detalles en `GUIA-DRAWDB-MCP-LOCAL.md`, `GUIA-DRAWDB-Y-MEMORIA.md` y `GUIA-AMPLIACION.md`.

## Añadir nuevas skills o plugins

Desde tu copia Git en PowerShell:

```powershell
.\AGREGAR_SKILL.ps1
.\AGREGAR_PLUGIN_REMOTO.ps1  # solo para plugins realmente compatibles
.\ACTUALIZAR_MARKETPLACE.ps1
```

Los scripts ayudan a mantener el catálogo sin cambiar la configuración de Claude Desktop, pero una skill no concede por sí sola permisos a Docker, DrawDB ni Supabase. Chat, Cowork y Claude Code pueden variar en capacidades y ejecución de plugins.

## Privacidad

No contiene contraseñas ni direcciones de red. `claude-mem-cowork` puede usar un proveedor externo y permanece opcional. Antes de activar integraciones con acceso de escritura, comprueba qué permisos solicita cada plugin.

## Referencias

- https://code.claude.com/docs/en/plugin-marketplaces
- https://github.com/drawdb-io/drawdb
- https://drawdb-io.github.io/docs/how-it-works
- https://www.drawdb.app/blog/generate-er-diagram-from-database
