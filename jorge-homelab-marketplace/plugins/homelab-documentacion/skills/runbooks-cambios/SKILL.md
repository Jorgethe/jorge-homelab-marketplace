---
name: runbooks-cambios
description: "Procedimientos y registro de cambios reproducible. Úsala para tareas relacionadas con homelab documentacion, priorizando seguridad, verificación e idioma español."
---

# Procedimientos y registro de cambios reproducible

**Idioma de salida:** español, conservando los identificadores técnicos originales.
**Alcance:** instrucciones y método de trabajo; esta skill no otorga acceso a API, terminal, red, MCP o archivos por sí sola.

## Objetivo
Documentar operaciones para repetirlas sin depender de memoria informal.
## Plantilla
- Identificador, fecha, servicio, objetivo y alcance.
- Requisitos, estado inicial y comprobaciones de lectura.
- Riesgo, respaldo, impacto, ventana y decisión aprobatoria.
- Pasos exactos con salida esperada para cada uno.
- Comprobaciones posteriores y criterios de éxito.
- Procedimiento de reversión probado, evidencias, resultado y observaciones.
## Reglas
Separar comandos orientativos de comandos ejecutados. Nunca escribir que «ya funciona» sin pruebas. Marcar pasos destructivos con confirmación expresa. Evitar almacenar secretos y tokens.
