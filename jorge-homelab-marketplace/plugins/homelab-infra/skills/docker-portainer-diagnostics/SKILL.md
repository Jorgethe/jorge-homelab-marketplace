---
name: docker-portainer-diagnostics
description: "Diagnóstico de stacks Portainer, redes Docker y volúmenes. Úsala para tareas relacionadas con homelab infra, priorizando seguridad, verificación e idioma español."
---

# Diagnóstico de stacks Portainer, redes Docker y volúmenes

**Idioma de salida:** español, conservando los identificadores técnicos originales.
**Alcance:** instrucciones y método de trabajo; esta skill no otorga acceso a API, terminal, red, MCP o archivos por sí sola.

## Objetivo
Localizar errores en contenedores, redes externas, Compose, puertos, permisos, healthchecks y almacenamiento.
## Diagnóstico
1. Solicitar Compose del stack anonimizado, logs relevantes y resultado esperado/real.
2. Proponer lecturas: `docker ps --format ...`, `docker inspect`, `docker network inspect`, `docker compose config`, `docker logs --tail 100`, `docker system df`.
3. Comprobar que un contenedor está unido a la red esperada **tras recrearlo**, y distinguir nombre de proyecto Compose de nombre real de la red; revisar `external: true` cuando se comparte una red.
4. Analizar dependencias, healthchecks, variables, montajes, persistencia de datos y conflictos de puertos.
5. Evitar suponer que editar un stack ya existente aplica inmediatamente todos los cambios: documentar el modo de redeploy y los efectos.
## Seguridad
No recomendar `docker system prune`, `docker volume rm`, `down -v`, eliminación de redes o recreación destructiva sin inventario/backup/confirmación.
## Entrega
Diagnóstico de causa raíz, comandos de **lectura**, propuesta mínima de cambio y pruebas de aceptación.
