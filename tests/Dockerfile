
# Dockerfile for CKAN-MCP tests
#
# (C) Ondics GmbH
#

FROM python:3.13.3-slim-bookworm

ENV TZ="Europe/Berlin"

RUN apt-get update && apt-get install -y \
    vim \
    jq \
    git \
    procps \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "mcp_ckan_server.py"]
