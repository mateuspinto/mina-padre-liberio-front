#!/usr/bin/env bash
set -e

REMOTE=$(git remote get-url origin)
GITHUB_REPO=$(echo "$REMOTE" | sed -E 's|.*github\.com[:/]([^/]+/[^/.]+)(\.git)?.*|\1|')
REPO_NAME=$(echo "$GITHUB_REPO" | cut -d'/' -f2)

echo "→ Build (base=/${REPO_NAME}/)"
GITHUB_REPOSITORY="$GITHUB_REPO" pnpm build

echo "→ Publicando dist/ na branch gh-pages..."
TMPDIR=$(mktemp -d)
cp -r dist/. "$TMPDIR/"

cd "$TMPDIR"
git init -q
git checkout -b gh-pages
git add -A
git commit -q -m "deploy: $(date '+%Y-%m-%d %H:%M')"
git push -f "$REMOTE" gh-pages

cd -
rm -rf "$TMPDIR"

echo "✓ Publicado em gh-pages — configure GitHub Pages para servir essa branch"
