---
name: inventario-homelab
description: "Reconstruir inventario y dependencias a partir de evidencias. Úsala para tareas relacionadas con homelab documentacion, priorizando seguridad, verificación e idioma español."
---

# Reconstruir inventario y dependencias a partir de evidencias

**Idioma de salida:** español, conservando los identificadores técnicos originales.
**Alcance:** instrucciones y método de trabajo; esta skill no otorga acceso a API, terminal, red, MCP o archivos por sí sola.

## Objetivo
Transformar salidas verificadas y configuraciones facilitadas en un inventario consistente y actualizable.
## Estructura sugerida
`00-RESUMEN/`, `01-HARDWARE/`, `02-REDES/`, `03-VIRTUALIZACION/`, `04-STORAGE/`, `05-SERVICIOS/`, `06-IA-LOCAL/`, `07-SEGURIDAD/`, `08-RUNBOOKS/`.
## Normas
1. No presentar como actual ningún dato histórico sin validarlo.
2. Cada registro indica nombre, función, host, segmentación, dependencias, dueño, backup, fecha de verificación y fuente de evidencia.
3. No conservar contraseñas, claves API ni secretos en el inventario.
4. Definir identificadores estables para máquinas/servicios y enlaces internos entre sus fichas.
5. Mantener sección «pendiente de comprobar» separada del inventario confirmado.
## Entrega
Árbol de archivos propuesto, páginas Markdown listas para guardar y listado de vacíos de información.
