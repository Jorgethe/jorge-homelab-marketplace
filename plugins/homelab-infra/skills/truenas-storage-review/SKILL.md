---
name: truenas-storage-review
description: "Revisión de TrueNAS, ZFS, SAS/HBA, SMB y NFS. Úsala para tareas relacionadas con homelab infra, priorizando seguridad, verificación e idioma español."
---

# Revisión de TrueNAS, ZFS, SAS/HBA, SMB y NFS

**Idioma de salida:** español, conservando los identificadores técnicos originales.
**Alcance:** instrucciones y método de trabajo; esta skill no otorga acceso a API, terminal, red, MCP o archivos por sí sola.

## Objetivo
Ayudar a diagnosticar pools ZFS, estado de discos, passthrough HBA SAS, snapshots y exportaciones NFS/SMB sin riesgos innecesarios.
## Procedimiento
1. Separar almacenamiento físico, HBA, guest TrueNAS, pool ZFS, datasets y protocolos de red.
2. Reunir únicamente evidencias autorizadas: `zpool status`, `zpool list`, `zfs list`, listado de dispositivos en guest y `findmnt`/`mount` en clientes.
3. Para HBA passthrough comprobar que TrueNAS ve los discos individuales y que no se propone montar el mismo disco simultáneamente en host y VM.
4. Para NFS revisar ruta exportada, versión NFS, IP real del servidor, permisos y conectividad inter-VLAN.
5. Distinguir un backup de configuración TrueNAS de un backup completo de VM y de snapshots de datos ZFS.
## Seguridad
No ejecutar `zpool clear`, `zpool destroy`, `zfs destroy`, resilver forzado, importaciones arriesgadas ni cambios de disco sin confirmación y respaldo comprobado.
## Entrega
Mapa físico-lógico, diagnóstico, riesgos de pérdida de datos, pasos de lectura y plan seguro con rollback.
