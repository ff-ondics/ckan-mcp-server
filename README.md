
# CKAN MCP Server

A Model Context Protocol (MCP) server for the CKAN API that enables browsing and managing CKAN data portals through MCP-compatible clients.

## Installation

1. Install Python dependencies:
```bash
pip install -r requirements.txt
```

## Configuration

Set the following environment variables:

- `CKAN_URL`: The base URL of your CKAN portal (e.g. `https://demo.ckan.org`)
- `CKAN_API_KEY`: (Optional) Your CKAN API key for write operations

Example:
```bash
export CKAN_URL="https://demo.ckan.org"
export CKAN_API_KEY="your-api-key-here"
```

## Usage

Start the server:
```bash
python mcp_ckan_server.py
```

## Available Tools

The MCP server provides the following tools:

### Packages/Datasets
- `ckan_package_list`: List all packages
- `ckan_package_show`: Show details of a specific package
- `ckan_package_search`: Search for packages

### Organizations
- `ckan_organization_list`: List all organizations
- `ckan_organization_show`: Show organization details

### Groups and Tags
- `ckan_group_list`: List all groups
- `ckan_tag_list`: List all tags

### Resources
- `ckan_resource_show`: Show resource details

### System
- `ckan_site_read`: Site information
- `ckan_status_show`: Status and version information

## Examples

### Search packages
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

### Show organization
```json
{
  "tool": "ckan_organization_show",
  "arguments": {
    "id": "sample-organization",
    "include_datasets": true
  }
}
```

### List all tags
```json
{
  "tool": "ckan_tag_list",
  "arguments": {}
}
```

## Resources

The server also provides the following resources:
- `ckan://api/docs`: API documentation
- `ckan://config`: Server configuration

## CKAN API Reference

This MCP server implements the main endpoints of the CKAN API v3. 
Complete documentation: https://docs.ckan.org/en/latest/api/

## License

MIT License
