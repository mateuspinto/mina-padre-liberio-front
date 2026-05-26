SHELL := /bin/bash

REMOTE := $(shell git remote get-url origin)
# Extrai "usuario/repo" de URLs SSH ou HTTPS do GitHub
GITHUB_REPO := $(shell echo "$(REMOTE)" | sed -E 's|.*github\.com[:/]([^/]+/[^/.]+)(\.git)?.*|\1|')

.PHONY: publish

publish:
	@echo "→ Build (base=/$(word 2,$(subst /, ,$(GITHUB_REPO)))/)"
	@GITHUB_REPOSITORY=$(GITHUB_REPO) pnpm build
	@echo "→ Publicando dist/ na branch gh-pages..."
	@rm -rf /tmp/mpl-deploy
	@mkdir /tmp/mpl-deploy
	@cp -r dist/. /tmp/mpl-deploy/
	@cd /tmp/mpl-deploy && \
		git init -q && \
		git add -A && \
		git commit -q -m "deploy: $$(date '+%Y-%m-%d %H:%M')" && \
		git push -f $(REMOTE) HEAD:gh-pages
	@rm -rf /tmp/mpl-deploy
	@echo "✓ Publicado em gh-pages"
