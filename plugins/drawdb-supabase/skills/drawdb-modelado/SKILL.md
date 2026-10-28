---
name: drawdb-modelado
description: Diseñar entidades, relaciones y DDL PostgreSQL importables a DrawDB autoalojado
---

# Diseño de bases de datos para DrawDB local

**Idioma:** Español. **Política:** sin escrituras ni migraciones sin autorización.

1. Obtener requisitos, entidades, relaciones, claves primarias/foráneas, cardinalidad, restricciones e índices.
2. Diferenciar si es diseño nuevo o reflejo de esquema ya desplegado. Para esquema real, priorizar inspección de solo lectura y no inventar columnas.
3. Producir DDL PostgreSQL como **artefacto revisable** (no ejecutable automáticamente), y cuando convenga DBML o Mermaid.
4. Explicar cómo importar **ese archivo** en el editor DrawDB desplegado en Docker, sin introducir servicios cloud.
5. Validar visualmente tablas, campos, FKs y tipos; guardar una exportación JSON/DDB del diagrama para no depender exclusivamente de IndexedDB del navegador.
6. Si el usuario pide edición automática en pantalla, comprobar explícitamente si dispone de una integración local compatible; no afirmar que existe un MCP oficial de escritura.

**Resultado:** diagrama lógico propuesto, archivo importable, limitaciones y lista de decisiones pendientes.
