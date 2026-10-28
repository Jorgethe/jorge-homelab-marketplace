---
name: postgres-supabase-review
description: "Diseño de PostgreSQL y Supabase para documentación. Úsala para tareas relacionadas con desarrollo apps, priorizando seguridad, verificación e idioma español."
---

# Diseño de PostgreSQL y Supabase para documentación

**Idioma de salida:** español, conservando los identificadores técnicos originales.
**Alcance:** instrucciones y método de trabajo; esta skill no otorga acceso a API, terminal, red, MCP o archivos por sí sola.

## Objetivo
Diseñar un esquema coherente para inventario, documentación, eventos y relaciones de infraestructura.
## Reglas
- Diferenciar hosts físicos, máquinas virtuales, LXC, interfaces, redes, servicios, dependencias, credenciales (referencias, nunca secretos), respaldos, eventos y fuentes.
- Proponer claves primarias estables, claves foráneas, timestamps con zona, unicidad y versionado de datos observados.
- Priorizar políticas de acceso, roles de lectura e índices según consultas esperadas.
- Tener en cuenta RLS cuando se exponga Supabase al cliente; no revelar claves de servicio.
- Diseñar consultas que distingan dato histórico de estado actual verificado.
## Entrega
ERD textual, SQL propuesto (no ejecutado), control de acceso y plan de migración reversible.
