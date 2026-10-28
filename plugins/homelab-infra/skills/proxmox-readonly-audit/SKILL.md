---
name: proxmox-readonly-audit
description: "Inventariar y diagnosticar Proxmox de forma segura. Úsala para tareas relacionadas con homelab infra, priorizando seguridad, verificación e idioma español."
---

# Inventariar y diagnosticar Proxmox de forma segura

**Idioma de salida:** español, conservando los identificadores técnicos originales.
**Alcance:** instrucciones y método de trabajo; esta skill no otorga acceso a API, terminal, red, MCP o archivos por sí sola.

## Objetivo
Construir inventario verificable de nodos, VMs, LXCs, bridges, VLAN, almacenamiento, pasarela y copias de seguridad. Nunca suponer que se dispone de SSH, CLI o API.
## Procedimiento
1. Pregunta si el acceso disponible es API, MCP, shell o archivos facilitados. Si no hay herramienta, solicita salidas textuales y trabaja sin ejecutar nada.
2. Para un entorno autorizado propone consultas de solo lectura: `pveversion -v`, `pvesh get /nodes`, `pvesh get /cluster/resources`, `qm list`, `pct list`, `pvesm status`, `ip -br a`, `bridge vlan show`. No afirmes haberlas ejecutado.
3. Para cada máquina registra nodo, VMID, tipo, estado, CPU/RAM, discos, red, VLAN, dependencias y backups sin guardar secretos.
4. Si hay passthrough PCI, revisa IOMMU, grupo, bridge, controlador, orden de arranque y efecto sobre la consola del host **antes** de sugerir cambios.
5. Diferencia hechos verificados, hipótesis y datos pendientes. Documenta fecha y fuente de cada dato.
## Límites
No ejecutar `qm set`, `pct set`, reinicios, cambios de passthrough, migraciones, restauraciones ni comandos que escriban sin aprobación expresa y plan de reversión. No acceder a sistemas no autorizados.
## Entrega
Tabla de inventario, dependencias, inconsistencias, comprobaciones siguientes y riesgos priorizados.
