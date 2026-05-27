# AGENTS.md — Mina do Padre Libério (contexto para LLMs)

## O que é
Site institucional/turístico da **Mina do Padre Libério** em São José da Varginha — MG. SPA mobile-first, scroll único, câmera ao vivo como destaque principal.

## Stack
- Vue 3 + Vite + Vue Router 4 — sem UI lib externa
- PNPM como gerenciador de pacotes
- CSS nativo com variáveis (`src/assets/colors.css` + `src/assets/main.css`)
- i18n manual: `src/i18n/language.json` + composable `useI18n.js` (sem vue-i18n)
- Deploy: GitHub Pages via `make publish` (força push na branch `gh-pages`) ou CI automático no push para `main`

## Publicação
```
make publish   # build + push forçado em gh-pages
```
O Makefile detecta o repo automaticamente via `git remote`. CI (`.github/workflows/deploy.yml`) também faz deploy ao fazer push em `main`.

## Estrutura de pastas relevante
```
src/
├── assets/          # main.css (reset + utilitários), colors.css (variáveis de cor)
├── components/
│   ├── layout/      # Navbar.vue
│   └── sections/    # CameraSection.vue  ← implementada
│                    # SobreSection.vue   ← PENDENTE
│                    # HistoriaSection.vue ← PENDENTE
│                    # VisitaSection.vue  ← PENDENTE
│                    # Footer.vue         ← PENDENTE
├── i18n/
│   ├── language.json   # todas as strings em "pt" (estrutura aninhada por seção)
│   └── useI18n.js      # composable: t(key), locale ref, switchLocale(lang)
├── composables/
│   └── useScrollSpy.js # detecta seção ativa por scroll
├── router/index.js     # rota única "/"
├── views/HomeView.vue  # monta as seções em sequência
└── App.vue
```

## Estado atual (o que está feito)
- [x] Setup base: router, CSS reset, variáveis, i18n
- [x] `Navbar.vue` — fixo, hamburger mobile, link ativo via scrollSpy, seletor de idioma (placeholder PT)
- [x] `CameraSection.vue` — iframe SafeCam com badge AO VIVO, recarregar, tela cheia (CSS + rotação mobile), auto-reload a cada 5 min

## O que está pendente
- [ ] `SobreSection` — 3 cards: Nascente Sagrada, Entrada Gratuita, Turismo Religioso
- [ ] `HistoriaSection` — timeline 5 marcos (Séc. XIX → Hoje)
- [ ] `VisitaSection` — endereço, horário, embed Google Maps, botão "Abrir no Google Maps"
- [ ] `Footer` — descrição, links redes sociais (placeholder), copyright dinâmico
- [ ] `HomeView.vue` — registrar as seções pendentes (atualmente só renderiza `CameraSection`)
- [ ] SEO: meta tags, og:image, favicon
- [ ] Animações de entrada via `IntersectionObserver`

## Padrões obrigatórios
- **Zero strings hardcoded** nos templates — tudo via `t('chave')` (dot-notation)
- Para adicionar texto novo: inserir a chave em `language.json` em `"pt"`, depois usar `t()`
- Para adicionar idioma: inserir chave irmã de `"pt"` (ex: `"en"`) no mesmo JSON
- Componentes de seção ficam em `src/components/sections/`
- Estilos com `<style scoped>`, usando variáveis CSS do projeto (`--color-primary`, `--space-*`, etc.)

## Design tokens principais
| Token | Valor |
|---|---|
| `--color-primary` | `#2D5016` (verde pedra) |
| `--color-secondary` | `#8B6914` (terra) |
| `--color-bg` | `#F5F0E8` (neutro claro) |
| `--color-text` | `#1A1A1A` |
| Fonte | Inter (Google Fonts), fallback system-ui |
| Breakpoints | sm 480px · md 768px · lg 1024px |

## Informações de conteúdo
- **Endereço:** Av. Dona Neném, s/n — Centro, São José da Varginha — MG (CEP 35.694-000)
- **Acesso:** gratuito, sem agendamento, sem guia obrigatório
- **Câmera:** `https://safecam.brsuper.com.br/#/cembed/09e18bf10772b7e977c366c9ed61ab21554a9b137421eda2f06f7f221e9fa24c7ce8552b7a7327799dbf93151b6f`
- **Padre Libério:** abençoou a nascente para nunca secar; missas e terços regulares
- Todas as strings de conteúdo já estão em `src/i18n/language.json`
