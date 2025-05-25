
# CKAN MCP Server

Ein Model Context Protocol (MCP) Server für die CKAN API, der es ermöglicht, CKAN-Datenportale über MCP-kompatible Clients zu durchsuchen und zu verwalten.

## Installation

1. Python-Abhängigkeiten installieren:
```bash
pip install -r requirements.txt
```

## Konfiguration

Setzen Sie die folgenden Umgebungsvariablen:

- `CKAN_URL`: Die Basis-URL Ihres CKAN-Portals (z.B. `https://demo.ckan.org`)
- `CKAN_API_KEY`: (Optional) Ihr CKAN API-Schlüssel für Schreiboperationen

Beispiel:
```bash
export CKAN_URL="https://demo.ckan.org"
export CKAN_API_KEY="your-api-key-here"
```

## Verwendung

Server starten:
```bash
python mcp_ckan_server.py
```

## Verfügbare Tools

Der MCP-Server stellt folgende Tools zur Verfügung:

### Packages/Datasets
- `ckan_package_list`: Liste aller Packages
- `ckan_package_show`: Details eines spezifischen Packages
- `ckan_package_search`: Suche nach Packages

### Organisationen
- `ckan_organization_list`: Liste aller Organisationen
- `ckan_organization_show`: Details einer Organisation

### Gruppen und Tags
- `ckan_group_list`: Liste aller Gruppen
- `ckan_tag_list`: Liste aller Tags

### Ressourcen
- `ckan_resource_show`: Details einer Ressource

### System
- `ckan_site_read`: Site-Informationen
- `ckan_status_show`: Status und Versionsinformationen

## Beispiele

### Package suchen
```json
{
  "tool": "ckan_package_search",
  "arguments": {
    "q": "climate data",
    "rows": 5,
    "sort": "score desc"
  }
}
```

### Organisation anzeigen
```json
{
  "tool": "ckan_organization_show",
  "arguments": {
    "id": "sample-organization",
    "include_datasets": true
  }
}
```

### Alle Tags auflisten
```json
{
  "tool": "ckan_tag_list",
  "arguments": {}
}
```

## Ressourcen

Der Server stellt auch folgende Ressourcen zur Verfügung:
- `ckan://api/docs`: API-Dokumentation
- `ckan://config`: Server-Konfiguration

## CKAN API Referenz

Dieser MCP-Server implementiert die wichtigsten Endpoints der CKAN API v3. 
Vollständige Dokumentation: https://docs.ckan.org/en/latest/api/

## Lizenz

MIT License
