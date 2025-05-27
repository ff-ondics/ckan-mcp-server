
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

# Git-Directory erstellen, damit GIT-Agent arbeiten kann.
WORKDIR /app/git-dir
RUN echo "hallöle" > hallo.txt
RUN git init && \
    git add hallo.txt && \
    git config user.name ondics && \
    git config user.email info@ondics.de && \
    git commit -m "initial commit" -a
    

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "mcp_ckan_server.py"]
