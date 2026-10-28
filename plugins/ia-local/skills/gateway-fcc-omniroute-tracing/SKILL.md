---
name: gateway-fcc-omniroute-tracing
description: "Seguir peticiones Claude Desktop → FCC → OmniRoute → Ollama. Úsala para tareas relacionadas con ia local, priorizando seguridad, verificación e idioma español."
---

# Seguir peticiones Claude Desktop → FCC → OmniRoute → Ollama

**Idioma de salida:** español, conservando los identificadores técnicos originales.
**Alcance:** instrucciones y método de trabajo; esta skill no otorga acceso a API, terminal, red, MCP o archivos por sí sola.

## Objetivo
Diagnosticar dónde cambia el modelo, el idioma, el contexto o el uso de herramientas en una cadena con API Anthropic-compatible.
## Pasos
1. Establecer una prueba reproducible (prompt exacto, modelo, cliente, fecha, si se activó comando `/` o skill).
2. Buscar evidencia en cada frontera: petición Claude Desktop -> FCC, FCC -> OmniRoute y OmniRoute -> Ollama. Los logs pueden no mostrar contenido; no suponer que lo muestran.
3. Comparar identificador de modelo, roles `system/user/assistant/tool`, disponibilidad de herramientas, `tool_choice`, llamadas reales, respuesta de herramientas y límites de contexto.
4. Revisar si la skill añade instrucciones en otro idioma y si el modelo cambia de idioma al procesarlas.
5. Separar fallo de UI/cliente, formato de gateway, enrutamiento, selección de modelo y seguimiento de instrucciones por el modelo.
6. Diseñar experimentos A/B con una variable: chat normal vs slash, mismo modelo con/ sin skill y mismo prompt.
## Precauciones
Pedir que se oculten tokens y cabeceras Authorization. No asumir que Cowork hereda la misma configuración de Chat o que sus herramientas usan la ruta local.
## Entrega
Tabla evidencia por salto, causa probable y siguiente prueba verificable.
