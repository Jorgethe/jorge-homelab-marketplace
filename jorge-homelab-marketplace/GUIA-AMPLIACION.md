# Ampliar este marketplace sin complicaciones

## A. Añadir una skill a un plugin tuyo (lo más sencillo)

En Windows: abre PowerShell en la raíz del repositorio Git y ejecuta:

```powershell
.\AGREGAR_SKILL.ps1
```

Elige el plugin local, escribe un nombre en minúsculas, y deja vacío el origen para generar una plantilla `SKILL.md`; si tienes una skill externa descargada, proporciona la carpeta que contiene `SKILL.md` para copiar todos sus archivos, tras auditarlos. **No necesitas editar `marketplace.json`** para añadir skills a un plugin existente. Revisa las instrucciones y elimina referencias a datos internos antes de publicar.

Publica al mismo repositorio con:

```powershell
.\ACTUALIZAR_MARKETPLACE.ps1
```

Si lo publicaste desde GitHub web, lo ideal es clonar el repositorio una vez con `git clone https://github.com/TU_USUARIO/jorge-homelab-marketplace.git` y usar esa copia como carpeta de trabajo; un ZIP descargado no tiene enlace Git y el script no puede hacer `push` desde él. El directorio al que apunta Claude Desktop sigue siendo `TU_USUARIO/jorge-homelab-marketplace`. Actualiza el catálogo en Claude; puede requerir actualizar o reiniciar el plugin o sesión para cargar skills nuevas.

## B. Añadir un plugin externo de terceros al MISMO catálogo

```powershell
.\AGREGAR_PLUGIN_REMOTO.ps1
```

Introduce el `name` exacto de su `.claude-plugin/plugin.json`, el GitHub `owner/repo`, y la carpeta interna si es un monorepo. No funciona si el origen solo es una skill sin `plugin.json`: en ese caso usa el método A para copiar la skill a un plugin local. El script **no descarga ni ejecuta el código**: solo registra el plugin como opción. Antes de activarlo en Claude revisa licencias, permisos, hooks y MCP. Publica con `ACTUALIZAR_MARKETPLACE.ps1`.

## C. Añadir una skill nueva sin tocar scripts

Crea `plugins/PLUGIN_EXISTENTE/skills/nueva-skill/SKILL.md` con el frontmatter `name` y `description`, edita su contenido y haz `git add`, `git commit`, `git push` al repositorio existente. **No modifiques el nombre del marketplace**, porque los plugins instalados lo referencian.

## Seguridad

Las skills no proporcionan acceso automático a tu red. Nunca subas `.env`, tokens, contraseñas, SQL con datos de clientes, exports privados ni configuraciones internas a un repositorio público. No habilites hooks externos sin conocer las acciones que ejecutan.
