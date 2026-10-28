---
name: opnsense-vlan-troubleshooting
description: "Diagnóstico de OPNsense, VLAN, firewall y DNS. Úsala para tareas relacionadas con homelab infra, priorizando seguridad, verificación e idioma español."
---

# Diagnóstico de OPNsense, VLAN, firewall y DNS

**Idioma de salida:** español, conservando los identificadores técnicos originales.
**Alcance:** instrucciones y método de trabajo; esta skill no otorga acceso a API, terminal, red, MCP o archivos por sí sola.

## Objetivo
Diagnosticar conectividad entre segmentos sin abrir acceso excesivo ni recomendar reglas a ciegas.
## Método por capas
1. Identificar origen, destino, IP, puerta de enlace, interfaz y VLAN, puerto/protocolo, sentido del tráfico y resultado esperado.
2. Comprobar direccionamiento y etiquetado: trunk/access/PVID, subinterfaces, rutas, ARP/NDP, DHCP y estado físico.
3. Diferenciar fallo DNS de fallo TCP/IP: resolución interna, IP de destino y conexión al puerto indicado.
4. Examinar, si el usuario facilita datos, reglas aplicables en interfaz de entrada, aliases, estados existentes, NAT y logs de firewall. OPNsense es stateful; no duplicar reglas de retorno sin evidencia.
5. Preparar **una sola prueba por vez**; comparar resultado esperado y observado.
6. Si participan Caddy, Authelia o WireGuard, comprobar capa TLS, cabeceras, certificados CA interna y MTU por separado.
## Seguridad
Favorecer reglas mínimas origen-destino-puerto, nunca `any->any` por comodidad. No exponer paneles a Internet ni desactivar firewall para diagnosticar.
## Resultado
Hipótesis ordenadas, salida concreta necesaria, regla propuesta **sin aplicar**, impacto, rollback y validación.
