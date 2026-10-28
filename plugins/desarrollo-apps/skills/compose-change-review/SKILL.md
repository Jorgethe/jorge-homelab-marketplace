---
name: compose-change-review
description: "Revisión de cambios en servicios antes de desplegar. Úsala para tareas relacionadas con desarrollo apps, priorizando seguridad, verificación e idioma español."
---

# Revisión de cambios en servicios antes de desplegar

**Idioma de salida:** español, conservando los identificadores técnicos originales.
**Alcance:** instrucciones y método de trabajo; esta skill no otorga acceso a API, terminal, red, MCP o archivos por sí sola.

## Objetivo
Revisar propuestas de Compose, Dockerfile y configuración de aplicaciones antes de que afecten servicios activos.
## Checklist
1. Mostrar diff o cambios completos y motivo.
2. Revisar imágenes fijadas, persistencia, redes external, puertos, permisos, secrets, healthchecks y dependencias.
3. Validar sintaxis con `docker compose config` si existe terminal autorizada o entregar comando para usuario.
4. Identificar cambios que recrean contenedores, alteran redes, descartan volúmenes o cambian datos.
5. Definir rollback y prueba de servicio observable.
## Entrega
Dictamen: listo / condicionado / no listo, con pruebas pendientes y comandos jamás marcados como ejecutados si no lo fueron.
