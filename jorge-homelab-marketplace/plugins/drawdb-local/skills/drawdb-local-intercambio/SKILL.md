---
name: drawdb-local-intercambio
description: Intercambio local de esquemas entre Claude, PostgreSQL y DrawDB Docker
---

# Intercambio seguro de esquemas con DrawDB local

**Idioma:** Español. No modificar base de datos, contenedores ni diagramas sin permiso.

1. Identificar si el usuario quiere diseñar tablas nuevas, importar una BD real o recuperar un diagrama existente.
2. Para bases existentes, preferir importación desde base de datos con consulta de catálogo del editor; alternativa, DDL PostgreSQL de esquema sin registros. El SQL de modelado nunca se ejecuta sin autorización.
3. Para diseños nuevos, preparar SQL/DBML que DrawDB pueda importar manualmente. La estructura de entrada debe corresponder al dialecto seleccionado.
4. Para devolver un diagrama a Claude, pedir exportación JSON/DDB o SQL/DBML del DrawDB autoalojado; analizar solo los archivos que el usuario comparta o que una herramienta permita leer.
5. Marcar de manera explícita toda transición manual. No inventar acceso web, filesystem, API, MCP ni estado sincronizado.
6. Revisar relaciones, índices y restricciones después de cada importación.

El objetivo es un puente de archivos y metadatos 100 % bajo control del usuario, no una integración cloud.
