# SPECS — Site Mina do Padre Libério

## Visão Geral
Site institucional/turístico para a **Mina do Padre Libério**, em São José da Varginha - MG.
SPA mobile-first em Vue 3 + Vite, com câmera ao vivo, informações históricas e turísticas.

---

## Stack
| Item | Versão |
|---|---|
| Vue 3 | ^3.5 |
| Vite | ^8 |
| Vue Router | ^4 |
| PNPM | instalado |
| CSS | nativo + variáveis (sem UI lib) |
| i18n | `language.json` manual (sem vue-i18n) |

---

## Arquitetura de Pastas

```
src/
├── assets/          # imagens, ícones, fonte
├── components/
│   ├── layout/      # Navbar, Footer
│   └── sections/    # HeroSection, CameraSection, SobreSection, HistoriaSection, VisitaSection
├── i18n/
│   ├── language.json    # todas as strings do site por idioma
│   └── useI18n.js       # composable: t(key), locale ref, switchLocale()
├── router/
│   └── index.js
├── views/
│   └── HomeView.vue # página única — todas as seções em scroll
├── composables/     # useScrollSpy (navbar ativo por seção)
└── App.vue
```

---

## Paleta & Design
- **Primária:** verde pedra `#2D5016` (referência à natureza/mineração)
- **Secundária:** terra `#8B6914`
- **Neutro claro:** `#F5F0E8`
- **Texto:** `#1A1A1A`
- Fonte: `Inter` (Google Fonts) — fallback system-ui
- Breakpoints: `sm 480px`, `md 768px`, `lg 1024px`
- Mobile-first: tudo começa em 1 coluna, expande em `md+`

---

## Seções (scroll único, SPA)

| # | ID | Componente | Conteúdo |
|---|---|---|---|
| 1 | `#camera` | `CameraSection` | Câmera ao vivo (iframe SafeCam) — primeira coisa após a navbar |
| 2 | `#sobre` | `SobreSection` | Cards: nascente, acesso gratuito, missa/rosário |
| 3 | `#historia` | `HistoriaSection` | Timeline: Padre Libério, bênção, emancipação |
| 4 | `#visita` | `VisitaSection` | Endereço, horário, mapa embed, como chegar |
| 5 | — | `Footer` | Links, redes sociais placeholder |

> Sem HeroSection separada. A câmera é o destaque principal logo abaixo da navbar.

---

## Informações da Mina (conteúdo pesquisado)

**Local:** Av. Dona Neném, s/n — Centro, São José da Varginha — MG (CEP 35.694-000)
**Acesso:** Gratuito, sem guia obrigatório
**Visitação:** Turismo doméstico e regional; infraestrutura de fácil acesso
**Religiosidade:** Padre Libério abençoou a nascente para "nunca secar"; missas, terços e encontros religiosos regulares
**Paisagem:** Entorno natural propício à contemplação e introspecção
**Câmera ao vivo:** `https://minapadreliberio.brsuper.com.br/` (serviço SafeCam)

---

## Internacionalização (i18n)

**Estratégia:** sem dependência externa — `language.json` + composable leve.

```json
// src/i18n/language.json (estrutura esperada)
{
  "pt": {
    "nav": { "sobre": "Sobre", "historia": "História", "camera": "Câmera ao Vivo", "visita": "Visitar" },
    "hero": { "titulo": "Mina do Padre Libério", "subtitulo": "...", "cta": "Ver Câmera ao Vivo" },
    "sobre": { "titulo": "Sobre a Mina", "card1": { "titulo": "Nascente Sagrada", "texto": "..." }, ... },
    "historia": { "titulo": "História", "marcos": [ { "ano": "Séc. XIX", "texto": "..." }, ... ] },
    "visita": { "titulo": "Como Visitar", "endereco": "...", "horario": "...", "entrada": "...", "cta": "Como Chegar" },
    "footer": { "creditos": "...", "copyright": "..." }
  }
}
```

**Adicionar novos idiomas:** basta inserir uma chave irmã de `"pt"` (ex: `"en"`, `"es"`) com as mesmas chaves.
**Seletor de idioma:** placeholder na Navbar (ícone globo + sigla), funcional assim que um segundo idioma for adicionado.

---

## Steps de Desenvolvimento

### Step 1 — Setup do projeto base + i18n ✅
- [x] Instalar `vue-router@4`: `pnpm add vue-router@4`
- [x] Criar `src/router/index.js` com rota `{ path: '/', component: HomeView }`
- [x] Configurar `main.js` com `app.use(router)`
- [x] Criar `src/assets/main.css`: CSS reset + variáveis de cor/fonte + utilitários mobile-first
- [x] Cores extraídas para `src/assets/colors.css`, importado em `main.css`
- [x] Limpar boilerplate Vue (HelloWorld, logo padrão)
- [x] Criar `src/i18n/language.json` com todas as strings em `pt` (estrutura aninhada por seção)
- [x] Criar `src/i18n/useI18n.js`: composable com `locale` (ref, default `'pt'`), `t(key)` (dot-notation), `switchLocale(lang)`
- [x] Todos os componentes consomem texto via `t('chave')` — zero strings hardcoded nos templates

### Step 2 — Navbar ✅
- [x] Componente `Navbar.vue` com: logo text "Mina do Padre Libério", links âncora para cada seção
- [x] Menu hamburger para mobile (toggle puro em Vue sem lib)
- [x] Navbar sempre com fundo sólido (sem efeito transparente — câmera começa logo abaixo)
- [x] Link ativo via `useScrollSpy` (scroll + `getBoundingClientRect`)
- [x] Seletor de idioma placeholder (ícone globo + sigla `PT`)
- [x] Acessibilidade: `aria-label`, `role="navigation"`, `aria-expanded`, foco visível

### Step 3 — CameraSection ✅
- [x] `<iframe>` apontando para `https://minapadreliberio.brsuper.com.br/`
- [x] Aspect ratio `16:9` responsivo via `aspect-ratio: 16/9`
- [x] Fallback text se iframe bloqueado (`allow="autoplay"`, sem sandbox restritivo)
- [x] Badge "AO VIVO" animado (pulse vermelho)
- [x] Botão recarregar (força remount do iframe via `:key`)
- [x] Link "Abrir em nova aba" como escape caso iframe seja bloqueado

### Step 4 — SobreSection ✅
- [x] 3 cards horizontais (mobile: coluna, tablet+: linha):
  - **Nascente Sagrada** — água que nunca seca, bênção do Padre Libério
  - **Entrada Gratuita** — acesso livre, sem agendamento
  - **Turismo Religioso** — missas, terços, referência regional
- [x] Ícones SVG inline por card

### Step 5 — HistoriaSection ✅
- [x] Timeline vertical (mobile) → horizontal (desktop)
- [x] Marcos:
  - **Séc. XIX** — Padre Antônio Moreira Barbosa funda o povoado de São José da Varginha
  - **1881** — Elevação a distrito de Pará de Minas
  - **Indeterminado** — Padre Libério abençoa a nascente
  - **01/03/1963** — Emancipação municipal de São José da Varginha
  - **Hoje** — Mina como ponto de turismo religioso e natural
- [ ] Foto placeholder em cada marco (substituível por real)

### Step 6 — VisitaSection ✅
- [x] Card de informações: endereço, horário (livre), entrada (gratuita), dicas de acesso
- [x] Embed Google Maps com pino em São José da Varginha (iframe público)
- [x] Botão "Como Chegar" → abre Google Maps app/web

### Step 7 — Footer
- [ ] Nome do município, créditos
- [ ] Links placeholder: Instagram, Facebook, WhatsApp
- [ ] Copyright year dinâmico (`new Date().getFullYear()`)

### Step 8 — Polimento & QA
- [ ] Testar todos os breakpoints: 375px, 480px, 768px, 1024px, 1440px
- [ ] Verificar contraste de cor (WCAG AA mínimo)
- [ ] Meta tags SEO: `title`, `description`, `og:image`, `og:title`
- [ ] Favicon (pode ser SVG simples com inicial "M")
- [ ] Smooth scroll nativo (`scroll-behavior: smooth` no `:root`)
- [ ] Animações de entrada nas seções via `IntersectionObserver` (fade-in-up)
- [ ] Testar câmera em mobile (iframe scroll/touch)
- [ ] `pnpm build` sem erros

---

## Critérios de Aceite
- Site abre em 375px sem scroll horizontal
- Câmera carrega (ou exibe fallback claro)
- Navbar colapsa corretamente no mobile
- Todas as 5 seções acessíveis via menu
- Build de produção sem warnings críticos
- Nenhuma string hardcoded nos templates — tudo via `t()`
- Adicionar chave `"en"` no `language.json` muda o site sem tocar em componentes
