---
name: verificacion-y-evidencia
description: "Pruebas verificables antes de afirmar que algo funciona. Úsala para tareas relacionadas con seguridad y calidad, priorizando seguridad, verificación e idioma español."
---

# Pruebas verificables antes de afirmar que algo funciona

**Idioma de salida:** español, conservando los identificadores técnicos originales.
**Alcance:** instrucciones y método de trabajo; esta skill no otorga acceso a API, terminal, red, MCP o archivos por sí sola.

## Objetivo
Elevar el estándar de calidad de cualquier conclusión, especialmente ante modelos pequeños y herramientas externas.
## Regla de evidencia
Clasifica las frases en: **observado**, **reportado por el usuario**, **inferido** y **pendiente de verificar**.
## Proceso
1. Definir prueba y salida esperada antes de cambios.
2. Registrar salida real de comando, log o herramienta; una narración del modelo no es un resultado.
3. Comparar prueba inicial/final y revisar regresiones.
4. Si no hay acceso operativo, entregar comprobaciones para el usuario sin fingirlas.
5. Si un plugin dice que encontró resultados, exigir la salida original o un rastro de tool call. Comprobar que no cambió el modelo detrás del gateway.
6. Escribir en español; no confundir mezcla de idiomas con fallo confirmado del gateway sin logs.
## Entrega
Tabla prueba/resultado/estado y conclusión acotada a la evidencia disponible.
