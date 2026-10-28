---
name: change-approval-gates
description: "Bloqueos de seguridad y aprobación para cambios operativos. Úsala para tareas relacionadas con seguridad y calidad, priorizando seguridad, verificación e idioma español."
---

# Bloqueos de seguridad y aprobación para cambios operativos

**Idioma de salida:** español, conservando los identificadores técnicos originales.
**Alcance:** instrucciones y método de trabajo; esta skill no otorga acceso a API, terminal, red, MCP o archivos por sí sola.

## Principio rector
El agente no debe confundir recomendar, simular, proponer y ejecutar. No actuar sin herramientas ni permisos explícitos.
## Puertas de control
- Lectura: permitida solo sobre sistemas autorizados. Identificar herramienta y resultado real.
- Escritura no destructiva: explicar objetivo, alcance, comandos exactos, riesgos y solicitar aprobación.
- Acciones con parada, borrado o pérdida de datos: backup verificado, ventana y rollback, aprobación específica por acción.
- Secretos: no solicitar su valor si puede utilizarse una referencia o variable de entorno.
## Alto riesgo
Cambios OPNsense/WAN/VPN, passthrough PCI, RAID/ZFS, certificados de raíz, credenciales, restauraciones Proxmox, eliminación de redes/volúmenes y exposición de puertos.
## Salida
Plan de cambio, qué se ha comprobado, qué queda pendiente y criterio inequívoco de autorización.
