---
name: drawdb-desde-supabase
description: Importar esquemas PostgreSQL o Supabase a DrawDB autoalojado sin modificar datos
---

# PostgreSQL/Supabase -> DrawDB Docker (local)

**Idioma:** Responder en español. **Seguridad:** solo lectura del origen, sin publicar credenciales, no aplicar SQL/migraciones automáticamente.

## Propósito
Ayudar a representar visualmente en el DrawDB Docker que ya tiene el usuario una base real gestionada con PostgreSQL/Supabase, o un esquema todavía en diseño.

## Flujo prioritario: importación desde base existente
1. Verificar que el usuario tiene acceso a DrawDB **autoalojado** y que es una versión compatible con la importación.
2. Si el editor ofrece `File -> Import from database` (verificar en su versión), seleccionar PostgreSQL y obtener la **consulta de catálogo de solo lectura** que aporta DrawDB.
3. Ejecutar la consulta con un cliente SQL autorizado o el SQL Editor de Supabase (solo metadatos, sin leer registros). Pegar/importar el resultado JSON en el DrawDB local.
4. Alternativa universal: exportar el DDL con `pg_dump --schema-only --no-owner --no-acl` usando credenciales de lectura adecuadas y usar la importación de SQL; otra alternativa es importar DBML compatible.
5. Revisar PK/FK, tipos, esquemas, índices y restricciones tras importar; si faltan, anotar los límites de la conversión.
6. Exportar el diagrama a JSON/DDB y guardarlo fuera del navegador, idealmente en almacenamiento bajo control del usuario.

## Importante
- Importar **no equivale a sincronización en vivo** ni a conectar el navegador de DrawDB con PostgreSQL mediante una API.
- El conector Supabase de Claude debe estar realmente disponible y autorizado; no asumir que funciona por aparecer instalado.
- Los archivos DDL/JSON también pueden revelar estructura, comentarios o lógica sensible. Revisarlos antes de compartir.
- No cambiar credenciales, Docker Compose, tablas o reglas de red por iniciativa propia.
