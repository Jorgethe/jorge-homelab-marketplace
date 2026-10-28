---
name: ollama-vram-diagnostics
description: "Revisar GPU, VRAM, contexto y rendimiento de Ollama. Úsala para tareas relacionadas con ia local, priorizando seguridad, verificación e idioma español."
---

# Revisar GPU, VRAM, contexto y rendimiento de Ollama

**Idioma de salida:** español, conservando los identificadores técnicos originales.
**Alcance:** instrucciones y método de trabajo; esta skill no otorga acceso a API, terminal, red, MCP o archivos por sí sola.

## Objetivo
Diagnosticar rendimiento real de la inferencia local antes de ajustar parámetros, modelos o drivers.
## Datos
Hardware GPU y RAM, VRAM total/ocupada, cuantización, tamaño del contexto, concurrentes, `ollama ps`, `ollama list`, `nvidia-smi`, logs y métricas de duración de respuesta si se proporcionan.
## Método
1. Diferenciar limitaciones de VRAM, memoria del sistema, carga GPU, CPU, disco, red y del propio modelo.
2. Comprobar si hay offloading a CPU y si el contexto previsto cabe holgadamente junto a los pesos del modelo y KV cache.
3. Separar cambios en Modelfile de cambios del servidor y del cliente. Indicar efectos sobre calidad/velocidad.
4. Proponer una sola variante de prueba por vez, registrar tokens/s y primera respuesta; comparar con la línea base.
5. Explicitar incertidumbre cuando no haya métricas. No prometer que un modelo soporta herramientas/razonamiento sin pruebas.
## Seguridad
No descargar modelos, borrar pesos, editar servicio Ollama ni tocar passthrough/driver NVIDIA sin aprobación explícita.
