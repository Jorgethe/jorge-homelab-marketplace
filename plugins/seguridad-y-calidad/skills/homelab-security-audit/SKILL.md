---
name: homelab-security-audit
description: "Auditoría de exposición, acceso y autenticación. Úsala para tareas relacionadas con seguridad y calidad, priorizando seguridad, verificación e idioma español."
---

# Auditoría de exposición, acceso y autenticación

**Idioma de salida:** español, conservando los identificadores técnicos originales.
**Alcance:** instrucciones y método de trabajo; esta skill no otorga acceso a API, terminal, red, MCP o archivos por sí sola.

## Objetivo
Revisar defensivamente superficies de ataque de una infraestructura doméstica basada en virtualización, VLAN y contenedores.
## Proceso
1. Identificar activos y límites: WAN, VPN, LAN, gestión Proxmox, NAS, apps, IA local.
2. Revisar accesos remotos, DNS interno, Caddy/reverse proxy, MFA/Authelia, certificados internos y actualizaciones.
3. Comprobar segmentación por privilegio mínimo y no asumir que un dominio interno vuelve seguro un servicio.
4. Revisar secretos en Docker Compose, permisos del socket Docker, cuentas API y exposición accidental.
5. Priorizar hallazgos por riesgo, evidencia y esfuerzo; no sugerir escaneos intrusivos sin alcance autorizado.
## Entrega
Matriz activo-amenaza-evidencia-recomendación, quick wins de bajo riesgo y revisión de acceso antes de desplegar cambios.
