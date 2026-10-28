# Cambios v3: DrawDB autoalojado

- DrawDB Pro cloud: **eliminado por completo** del flujo operativo y las dependencias.
- Plugin retirado: `drawdb-mcp-readonly`; no hay configuración `.mcp.json` que lance servicios a la nube.
- Plugin añadido: `drawdb-local` con skills `drawdb-local-intercambio` y `drawdb-local-respaldo`.
- `drawdb-supabase` actualizado con importación local de PostgreSQL/Supabase y diagnóstico del contenedor.
- Se mantiene el nombre del marketplace original para actualizarlo sin añadir otro mercado en Claude Desktop.
- El flujo es con SQL/DBML/JSON importables, **no una integración MCP de edición en tiempo real**.

Para aplicar: publica el contenido de este ZIP en el **mismo repositorio** de la versión anterior, desinstala el plugin antiguo si ya lo activaste, y actualiza el marketplace en Claude Desktop.
