#
# Makefile-Tools
# Ondics, 2025
# Idea: https://github.com/runekaagaard/mcp-alchemy/blob/main/Makefile
#

# SHELL := /bin/bash
# .SHELLFLAGS := -ec

# Use env-File for PYPI_API_TOKEN
include .env

PROJECT := $(shell grep '^name = ' pyproject.toml | cut -d '"' -f2)
PACKAGE := $(shell echo $(PROJECT) | tr '-' '_')
VERSION := $(shell grep '^version = ' pyproject.toml | cut -d '"' -f2)

# help-systematik
# build muss phony sein (forcierter build), weil es 
# als verzeichnis existiert und sonst nie gebaut werden würde
.PHONY: help build

help:
	@echo "# Docker-Helferlein"
	@echo "# Ondics, 2025"
	@echo Befehle: make ...
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

build: ## Build image with Publisher
	docker compose build

bash: ## Start bash in container
	docker compose run --rm pypipublisher bash

publish-pypi: ## Publish to PyPi
	${MAKE} build
	docker compose run --rm pypipublisher bash -c "\
		uv build && \
		uv lock && \
		uv publish --token ${PYPI_API_TOKEN} "
	

debug-constants: ## Debug constants
	@echo "PROJECT='$(PROJECT)'"
	@echo "PACKAGE='$(PACKAGE)'"
	@echo "VERSION='$(VERSION)'"
