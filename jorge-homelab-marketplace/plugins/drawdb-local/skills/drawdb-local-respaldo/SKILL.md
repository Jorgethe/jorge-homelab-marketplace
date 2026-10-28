---
name: drawdb-local-respaldo
description: Verificar persistencia y copias de diagramas de DrawDB autoalojado
---

# Respaldo y persistencia de diagramas en DrawDB Docker

**Idioma:** Español. Nada de acciones destructivas.

- En el editor OSS estándar, los diagramas suelen quedar en **IndexedDB del navegador**; arrancar DrawDB en Docker no garantiza un respaldo de esos archivos mediante copias del contenedor.
- Comprobar versión, navegador/perfil, opciones de exportación y si existe backend de colaboración expresamente configurado.
- Guiar al usuario para exportar JSON/DDB desde la interfaz y conservarlo en una ubicación bajo su control (por ejemplo, almacenamiento NAS); verificar posibilidad de reimportar una **copia de prueba**.
- Si se usa PostgreSQL como fuente, guardar por separado los DDL/migraciones. Esos archivos describen el esquema real, mientras el JSON describe el diseño visual.
- No proponer eliminar volúmenes, borrar IndexedDB, cambiar proxy o sustituir la imagen Docker como primer paso.
- No declarar una copia verificada sin comprobar su existencia y una prueba de restauración apropiada.
