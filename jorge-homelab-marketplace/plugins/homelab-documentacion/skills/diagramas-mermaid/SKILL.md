---
name: diagramas-mermaid
description: "Diagramar arquitectura Proxmox, VLAN y dependencias. Úsala para tareas relacionadas con homelab documentacion, priorizando seguridad, verificación e idioma español."
---

# Diagramar arquitectura Proxmox, VLAN y dependencias

**Idioma de salida:** español, conservando los identificadores técnicos originales.
**Alcance:** instrucciones y método de trabajo; esta skill no otorga acceso a API, terminal, red, MCP o archivos por sí sola.

## Objetivo
Generar diagramas Mermaid legibles, separados por objetivo, a partir de hechos confirmados.
## Vistas
1. Física: hosts, switch, interfaces y almacenamiento.
2. Lógica: VLAN, gateway, DNS, VPN y flujos permitidos.
3. Virtualización: nodos -> VMs/LXC -> servicios.
4. IA: cliente -> gateway -> enrutador -> modelo, diferenciando flujo de herramientas.
## Reglas
- No inventar direcciones, métricas, puertos ni conexiones. Usar etiquetas «por validar» para incertidumbres.
- Evitar diagramas gigantes: máximo ~15-20 nodos por vista; dividir en subgráficos.
- Acompañar cada diagrama con leyenda, alcance y fuente.
- Mantener sintaxis Mermaid estándar, identificadores sin espacios, etiquetas citadas.
## Entrega
Bloques `mermaid` y tabla nodo-función-dependencias, con pendientes.
