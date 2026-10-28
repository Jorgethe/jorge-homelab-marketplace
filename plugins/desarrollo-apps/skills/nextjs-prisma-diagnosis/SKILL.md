---
name: nextjs-prisma-diagnosis
description: "Diagnóstico de Next.js, Prisma y despliegues Docker. Úsala para tareas relacionadas con desarrollo apps, priorizando seguridad, verificación e idioma español."
---

# Diagnóstico de Next.js, Prisma y despliegues Docker

**Idioma de salida:** español, conservando los identificadores técnicos originales.
**Alcance:** instrucciones y método de trabajo; esta skill no otorga acceso a API, terminal, red, MCP o archivos por sí sola.

## Objetivo
Analizar errores en proyectos Next.js, Node, Prisma y Postgres sin actualizar dependencias innecesariamente.
## Método
1. Pedir versiones reales de Next.js, Node, Prisma y Postgres, error completo y comandos afectados.
2. Diferenciar problema de esquema Prisma, migración, base activa, permisos, cliente generado y entorno build/runtime.
3. Para un error P2021, inspeccionar configuración datasource, tablas existentes, schema/namespace y migraciones pendientes, sin inferir que una tabla no existe físicamente antes de comprobarlo.
4. Proponer comandos de lectura (`prisma migrate status`, consultas de esquema, logs) antes de migrar.
5. Revisar montajes, variables, volúmenes, dependencias de servicios y persistencia de datos Docker.
## Seguridad
No lanzar `prisma migrate reset`, `db push --force-reset`, `docker compose down -v` ni cambios de esquema en producción sin backup, impacto y aprobación explícita.
## Resultado
Causa probable, evidencia, corrección mínima y prueba de regresión.
