---
name: auditoria-memoria-agente
description: "Distinguir memoria automática, notas persistentes y contexto inyectado en Chat, Cowork y Claude Code"
---

# Distinguir memoria automática, notas persistentes y contexto inyectado en Chat, Cowork y Claude Code

**Idioma:** Responder en español, conservando nombres técnicos, comandos y códigos originales.
**Política:** No inventar disponibilidad de herramientas ni resultados; pedir aprobación antes de escribir.

## Objetivo
Comprobar, con evidencias, si una memoria funciona en la sesión y dónde residen los datos.
## Diagnóstico
1. Determinar cliente exacto (Claude Desktop Chat, Cowork, Claude Code CLI, OpenCode), modelo y ruta de inferencia FCC/OmniRoute/Ollama.
2. Comprobar si el plugin `claude-mem` o `claude-mem-cowork` está instalado y habilitado; revisar sus dependencias y registros si el usuario los comparte.
3. Distinguir memoria automática de Claude Code mediante hooks, memoria Cowork sincronizada al servicio externo, consultas manuales con una skill y ficheros Markdown.
4. Hacer prueba controlada: registrar dato ficticio no sensible, abrir una sesión nueva y exigir la fuente concreta de recuperación.
5. No declarar memoria persistente operativa sin evidencia de captura, almacenamiento y recuperación.
## Privacidad
Alertar antes de enviar fragmentos de conversaciones o herramientas a servicios externos. No revelar credenciales ni usar datos personales en pruebas.
