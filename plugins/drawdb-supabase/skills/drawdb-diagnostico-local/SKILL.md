---
name: drawdb-diagnostico-local
description: Diagnosticar DrawDB autoalojado en Docker y distinguir editor web, almacenamiento del navegador y API/MCP
---

# Diagnostico de DrawDB autoalojado

**Idioma:** Español. **Reglas:** priorizar lectura, no inventar herramientas ni endpoints, no exponer datos ni servicios a Internet.

## Alcance
El usuario tiene DrawDB en un contenedor Docker de su homelab. **No usar DrawDB Pro Cloud ni el MCP oficial `@drawdb/mcp` por defecto.** El proyecto OSS funciona como editor web y no ofrece automáticamente una API/MCP de escritura sobre los diagramas del navegador. El Docker no implica que los diagramas se guarden en un volumen del contenedor: en el editor libre normalmente se guardan en IndexedDB del navegador.

## Comprobaciones
1. Confirmar la imagen Docker y versión real, puerto publicado, nombre de contenedor, configuración de volúmenes y si hay backend opcional, sin asumir los valores.
2. Confirmar desde qué navegador/perfil se trabaja y cómo se guardan/exportan los diagramas.
3. Distinguir acceso a la interfaz web del acceso programático a un diagrama. No llamar 'conexión MCP' a importar archivos SQL/DBML/JSON.
4. Para leer el esquema de PostgreSQL/Supabase, preferir herramientas en modo lectura y exportar solo DDL o metadatos: tablas, columnas, índices y PK/FK, sin registros personales.
5. Si se pide MCP con edición bidireccional, explicar que requeriría un proyecto distinto/adaptación y verificar su compatibilidad y seguridad antes de sugerir reemplazar el contenedor.

## Evidencias
Especificar resultados comprobados frente a hipótesis. No ejecutar cambios en DrawDB, redes, bases o Docker sin autorización.
