---
name: mcp-agent-design
description: "Diseñar agentes MCP de solo lectura para el homelab. Úsala para tareas relacionadas con ia local, priorizando seguridad, verificación e idioma español."
---

# Diseñar agentes MCP de solo lectura para el homelab

**Idioma de salida:** español, conservando los identificadores técnicos originales.
**Alcance:** instrucciones y método de trabajo; esta skill no otorga acceso a API, terminal, red, MCP o archivos por sí sola.

## Objetivo
Definir integración segura de la IA con servicios del homelab mediante APIs y MCP, sin prometer control inexistente.
## Diseño
1. Identificar fuente (Proxmox API, Docker socket/proxy, OPNsense API, TrueNAS API, Ollama, Supabase) y mecanismo de autenticación.
2. Preferir cuentas específicas de solo lectura, tokens limitados y segregación por VLAN; evitar permisos de administrador.
3. Proponer herramientas con descripciones estrechas y respuestas estructuradas (inventario de VMs, estado de containers, redes, almacenamiento).
4. Especificar secretos fuera de repositorios/skills, TLS y CA local, allowlist de orígenes, logging, rate-limits y revocación.
5. Diseñar fases: inventario solo lectura, diagnóstico asistido, cambios con aprobación explícita, automatización supervisada.
6. Enumerar qué cliente ejecuta los MCP (Claude Desktop Chat, Cowork, Claude Code u otro) y qué conectividad real posee.
## Entrega
Arquitectura lógica, matriz permisos, contratos de herramientas, riesgos y pruebas de aceptación.
