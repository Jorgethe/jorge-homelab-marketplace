---
name: drawdb-mcp-diagramas
description: Crear, consultar y editar diagramas ER con el MCP autoalojado anatoly-lab/drawdb-mcp de forma controlada
---

# Diseño visual asistido con DrawDB MCP local

**Idioma de respuesta: español.** Esta skill documenta un procedimiento; no proporciona conectividad por sí sola.

## Antes de operar

1. Distingue el **DrawDB OSS que ya existe** del **fork anatoly-lab/drawdb-mcp**. Son editores diferentes. No asumas sincronización ni migración entre ambos.
2. Comprueba que el cliente realmente anuncia herramientas MCP del servidor `drawdb-mcp` y que puedes invocarlas. Si no aparecen, explica que no existe conexión efectiva; no inventes llamadas ni ejecuciones.
3. Trabaja sobre un diagrama de prueba por defecto y pregunta antes de sobrescribir diagramas o importar esquemas con operaciones destructivas.
4. Nunca ejecutes SQL generado en Supabase/PostgreSQL sin revisión y aprobación explícitas.

## Flujo para crear un esquema

1. Solicita o identifica entidades, claves, campos y relaciones del diseño.
2. Presenta un borrador lógico (tipos PostgreSQL, claves, cardinalidades, restricciones).
3. Antes de escribir en el backend MCP, confirma cuál será el **diagrama destino** y si hay datos que conservar. Si existe, exporta una copia JSON cuando la herramienta esté disponible.
4. Invoca las herramientas REALES anunciadas por el MCP (por ejemplo las operaciones de tablas/relaciones; no asumas nombres). Usa `import_dbml` solo cuando se haya validado el contenido y confirmado el reemplazo.
5. Comprueba el resultado con lecturas/exportaciones MCP, y pide visualizar el canvas en el frontend del fork. Si no pudiste leerlo, no afirmes haber comprobado nada.
6. Prepara, si se solicita, `export_dbml` y `export_sql` como artefactos para revisión, **no como migraciones ejecutadas**.

## Restricciones

- La herramienta MCP del fork puede modificar el diagrama; no implica acceso a SQL de producción.
- No usar DrawDB Pro Cloud ni su MCP oficial de solo lectura.
- El servicio MCP del fork funciona sin autenticación por defecto: úsalo solo en una red de confianza, con reglas restrictivas de firewall, y jamás lo publiques sin añadir un control de acceso adecuado.
- Recuerda que el estado del backend es **volátil tras reiniciar** en la implementación actual: exporta JSON antes de un reinicio/actualización y comprueba la restauración.

Fuente del fork: https://github.com/anatoly-lab/drawdb-mcp
