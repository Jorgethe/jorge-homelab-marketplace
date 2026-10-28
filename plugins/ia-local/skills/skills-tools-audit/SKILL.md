---
name: skills-tools-audit
description: "Distinguir skills cargadas de herramientas ejecutadas. Úsala para tareas relacionadas con ia local, priorizando seguridad, verificación e idioma español."
---

# Distinguir skills cargadas de herramientas ejecutadas

**Idioma de salida:** español, conservando los identificadores técnicos originales.
**Alcance:** instrucciones y método de trabajo; esta skill no otorga acceso a API, terminal, red, MCP o archivos por sí sola.

## Objetivo
Determinar si el agente REALMENTE ejecutó una herramienta, o si únicamente afirmó haberla usado.
## Protocolo
1. Pedir el nombre exacto de la herramienta invocada, entrada, resultado y dónde lo muestra la interfaz o el log.
2. Revisar si existe un registro de llamada real. Una respuesta escrita del modelo nunca es evidencia suficiente.
3. Diferenciar skill (instrucciones) de plugin (paquete), comando slash (disparador), MCP (herramientas) y modelo Ollama (inferencia).
4. Si un buscador como `find-skills` devuelve vacío, no concluir que no existe ninguna skill en Internet: indicar alcance del índice y fallos de integración.
5. Para idiomas extraños: comprobar contexto enviado, prompt interno de la skill y comportamiento del modelo con prueba controlada.
6. Si no se puede verificar la llamada, marcarla «no verificada», nunca «ejecutada».
## Idioma
Presentar el informe final en español. Los nombres originales de métodos y campos técnicos se conservan.
## Entrega
Hechos / afirmaciones no verificadas / pruebas pendientes, con resultados observables.
