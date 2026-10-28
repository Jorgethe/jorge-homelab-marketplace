# Guía DrawDB MCP local — v4

## Qué cambia

El plugin `drawdb-mcp-local` (nuevo) añade instrucciones para **usar el fork con MCP real**. Se conserva `drawdb-local` (DrawDB original autoalojado) y `drawdb-supabase` (diseño e importaciones). El plugin NO instala ni enciende Docker, NO incluye claves, NO fuerza conexiones remotas, NO publica tu homelab.

Fuente: https://github.com/anatoly-lab/drawdb-mcp

## Diferencia fundamental

`anatoly-lab/drawdb-mcp` es un fork con su propio **frontend** y **backend MCP**, no un plugin instalable sobre el contenedor oficial DrawDB. El autor indica que ha divergido del original. **Levántalo de prueba en paralelo**; no sustituyas ni borres tu DrawDB actual.

El backend del fork usa un almacén **en memoria**, por lo que el estado puede perderse al reiniciar: exporta JSON (`export_diagram`) antes de parar, recrear o actualizar. No confundas el volumen de un contenedor con persistencia: no está documentado un volumen de datos que garantice persistencia del estado MCP.

## 1. Probar el contenedor separado (Portainer/Compose)

Ejemplo seguro: `plugins/drawdb-mcp-local/ejemplos/docker-compose.drawdb-mcp.yml` (puertos 8088 GUI y 3100 MCP, ambos por defecto en `127.0.0.1` del host Docker). No arranca por instalar el plugin.

- Antes de desplegar, revisa ocupación de puertos, imagen, tags y conectividad.
- Si Windows Claude Desktop está en **otro equipo**, cambia `DRAWDB_MCP_BIND_IP` por **la IP PRIVADA concreta del host Docker** en un fichero `.env` local; filtra con OPNsense/firewall de host para permitir solo tu PC. No uses WAN/publicación por Caddy sin autenticación apropiada.
- La GUI de prueba estará en `http://IP_PRIVADA_DEL_HOST_DOCKER:8088` y el MCP en `http://IP_PRIVADA_DEL_HOST_DOCKER:3100` si los puertos se publican hacia esa IP. Nunca uses `localhost` desde Windows si el contenedor está en otro equipo.
- La interfaz del fork sincroniza el frontend con el estado del backend; no sincroniza con tu otro contenedor DrawDB.

## 2. Conectar el MCP real a Claude

### Claude Code (si lo tienes instalado y operativo en tu Windows)

```powershell
claude mcp add --transport http drawdb-mcp-local http://IP_PRIVADA_DEL_HOST_DOCKER:3100
```

Sustituye la IP por la del equipo Docker. El comando está documentado en el repositorio del autor. `claude mcp add` es del **CLI Claude Code**, NO un mensaje para el chat de Claude Desktop.

### Claude Desktop (conector local en Windows)

Hay un script opcional en la raíz `CONFIGURAR_DRAWDB_MCP_DESKTOP.ps1`. **Solo ejecútalo una vez desplegado y accesible el fork**, después de revisar su contenido. Pregunta la URL, conserva servidores existentes y hace copia de seguridad del archivo `%APPDATA%\Claude\claude_desktop_config.json` antes de añadir una entrada `mcp-remote` (`npx` requiere Node.js). Reinicia Claude Desktop y verifica que la herramienta aparezca y se invoque de verdad.

También tienes el fragmento editable `plugins/drawdb-mcp-local/ejemplos/claude-desktop-config.fragment.json`. Sustituye la IP de ejemplo y **fusiona** `mcpServers` con la configuración existente; no la reemplaces entera. La URL MCP del fork, según el autor, es la **raíz** del puerto 3000 (en nuestro ejemplo 3100), sin añadir automáticamente `/mcp`.

### Muy importante sobre Chat y Cowork

- Los **conectores MCP remotos del panel Personalizar → Conectores** se conectan desde la nube de Anthropic. No pueden llegar a una IP privada del homelab; **no abras tu MCP a Internet solo para forzar esta modalidad**.
- Los MCP locales y la ejecución de plugins **no se comportan igual** en Chat y Cowork. Anthropic documenta que los MCP locales de plugins son para Cowork y Claude Code, mientras que las extensiones de escritorio y la configuración local de Claude Desktop constituyen otro mecanismo. Comprueba cada superficie por separado.
- Si Claude Desktop usa un gateway FCC/OmniRoute/Ollama, no se garantiza que el modelo local vaya a invocar correctamente las herramientas: verifica en la interfaz la llamada MCP real y en los registros de gateway qué llega al modelo.

## 3. Primera prueba no destructiva

1. Verifica que el MCP está conectado y lista herramientas realmente disponibles.
2. En el fork **de prueba**, pide crear dos tablas `equipos` y `fabricantes` con una relación 1:N (sin datos ni claves de producción).
3. Abre la GUI del fork para comprobar que existen y están relacionadas.
4. Pide exportación DBML y JSON y **guárdalos fuera del contenedor**.
5. Haz una prueba de restauración únicamente con un diagrama de ensayo; no reinicies sin guardar el diseño.

## Fuentes

- https://github.com/anatoly-lab/drawdb-mcp
- https://github.com/anatoly-lab/drawdb-mcp/blob/main/CLAUDE.md
- https://github.com/anatoly-lab/drawdb-mcp/blob/main/docs/GHCR_DEPLOYMENT.md
- https://support.claude.com/es/articles/11175166-comienza-con-conectores-personalizados-usando-mcp-remoto
- https://support.claude.com/es/articles/11725091-cuando-usar-conectores-de-escritorio-y-web
