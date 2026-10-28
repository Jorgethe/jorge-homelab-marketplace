---
name: memoria-de-proyecto
description: "Registrar contexto y decisiones persistentes de proyectos en archivos Markdown de forma controlada"
---

# Registrar contexto y decisiones persistentes de proyectos en archivos Markdown de forma controlada

**Idioma:** Responder en español, conservando nombres técnicos, comandos y códigos originales.
**Política:** No inventar disponibilidad de herramientas ni resultados; pedir aprobación antes de escribir.

## Objetivo
Mantener conocimiento útil y recuperable mediante ficheros versionados, sin suponer que existe memoria automática en el cliente ni en Ollama.
## Procedimiento
1. Confirmar acceso real a un directorio de trabajo. Si no existe, entregar el Markdown listo para copiar; no afirmar que ha sido guardado.
2. Proponer `HOMELAB_CONTEXT.md` (inventario resumido), `DECISIONES.md` (fecha, decisión, motivo, estado), `PENDIENTES.md` (tarea, origen, siguiente paso) y `CAMBIOS.md` (ejecución y evidencia).
3. Registrar hechos observados, fuente, fecha, entornos y grado de confianza. No propagar hipótesis como hechos.
4. Antes de modificar archivos, mostrar un diff o propuesta, indicar qué información se añadirá y solicitar autorización.
5. En nueva sesión, recuperar el contexto desde archivos solo si están disponibles para esa sesión y se leen realmente.
## Privacidad
Nunca guardar contraseñas, claves API, tokens de acceso, contenidos sensibles de logs o configuraciones completas sin necesidad. Evitar publicar IP o hostnames internos en GitHub público.
## Resultado
Entrada de memoria reutilizable, archivos afectados y límites de persistencia efectivamente verificados.
