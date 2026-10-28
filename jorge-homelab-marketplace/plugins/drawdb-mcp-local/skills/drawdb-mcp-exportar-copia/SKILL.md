---
name: drawdb-mcp-exportar-copia
description: Crear copias verificables de diagramas del fork DrawDB MCP y planificar exportación PostgreSQL/DBML/JSON
---

# Copias de diagramas DrawDB MCP local

**Idioma:** español. No confundir exportar el diagrama con hacer un backup de PostgreSQL.

1. Comprueba que existe una conexión MCP real con `anatoly-lab/drawdb-mcp`; una skill instalada no equivale a servidor activo.
2. Si hay cambios pendientes, solicita confirmación antes de cualquier importación o reemplazo del estado del diagrama.
3. Cuando esté disponible, utiliza `export_diagram` para obtener el estado JSON completo. También admite `export_dbml` y `export_sql` para intercambio, no para restauración idéntica.
4. Guarda los resultados solo si el cliente dispone de una herramienta real de escritura de archivos o permite descargar exportaciones. Si no, muestra el contenido o explica cómo guardarlo manualmente.
5. Verifica que el archivo JSON se puede leer e identifica esquema, fecha y versión si son conocidas; no inventes metadatos.
6. Para probar restauración, usa un entorno de ensayo o un diagrama de prueba independiente, no el único ejemplar del usuario.
7. Exporta siempre antes de reiniciar, actualizar o recrear el contenedor: el almacenamiento de estado del backend es en memoria en la implementación revisada.

Nunca copiar claves, credenciales, connection strings de Supabase ni datos de producción al marketplace.
