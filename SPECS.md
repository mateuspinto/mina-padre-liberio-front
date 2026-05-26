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
| 1 | `#hero` | `HeroSection` | Logo/nome, tagline, CTA para câmera |
| 2 | `#camera` | `CameraSection` | Câmera ao vivo (iframe SafeCam) |
| 3 | `#sobre` | `SobreSection` | Cards: nascente, acesso gratuito, missa/rosário |
| 4 | `#historia` | `HistoriaSection` | Timeline: Padre Libério, bênção, emancipação |
| 5 | `#visita` | `VisitaSection` | Endereço, horário, mapa embed, como chegar |
| 6 | — | `Footer` | Links, redes sociais placeholder |

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

### Step 1 — Setup do projeto base + i18n
- [ ] Instalar `vue-router@4`: `pnpm add vue-router@4`
- [ ] Criar `src/router/index.js` com rota `{ path: '/', component: HomeView }`
- [ ] Configurar `main.js` com `app.use(router)`
- [ ] Criar `src/assets/main.css`: CSS reset + variáveis de cor/fonte + utilitários mobile-first
- [ ] Limpar boilerplate Vue (HelloWorld, logo padrão)
- [ ] Criar `src/i18n/language.json` com todas as strings em `pt` (estrutura aninhada por seção)
- [ ] Criar `src/i18n/useI18n.js`: composable com `locale` (ref, default `'pt'`), `t(key)` (dot-notation), `switchLocale(lang)`
- [ ] Todos os componentes consomem texto via `t('chave')` — zero strings hardcoded nos templates

### Step 2 — Navbar
- [ ] Componente `Navbar.vue` com: logo text "Mina do Padre Libério", links âncora para cada seção
- [ ] Menu hamburger para mobile (toggle puro em Vue sem lib)
- [ ] Comportamento: fundo transparente no topo → sólido ao rolar (`scroll event`)
- [ ] Link ativo via `useScrollSpy` (IntersectionObserver nas seções)
- [ ] Acessibilidade: `aria-label`, `role="navigation"`, foco visível

### Step 3 — HeroSection
- [ ] Fundo: gradiente verde escuro ou imagem de placeholder da mina
- [ ] Título: "Mina do Padre Libério", subtítulo: "Uma nascente abençoada no coração de São José da Varginha"
- [ ] CTA button: "Ver Câmera ao Vivo" → scroll para `#camera`
- [ ] Chevron animado scroll-down

### Step 4 — CameraSection
- [ ] `<iframe>` apontando para `https://minapadreliberio.brsuper.com.br/`
- [ ] Aspect ratio `16:9` responsivo via `padding-bottom: 56.25%` + `position: absolute`
- [ ] Fallback text se iframe bloqueado (`allow="autoplay"`, `sandbox` mínimo necessário)
- [ ] Badge "AO VIVO" animado (pulse vermelho)
- [ ] Aviso de recarregar se stream parar

### Step 5 — SobreSection
- [ ] 3 cards horizontais (mobile: coluna, tablet+: linha):
  - **Nascente Sagrada** — água que nunca seca, bênção do Padre Libério
  - **Entrada Gratuita** — acesso livre, sem agendamento
  - **Turismo Religioso** — missas, terços, referência regional
- [ ] Ícones SVG inline por card

### Step 6 — HistoriaSection
- [ ] Timeline vertical (mobile) → horizontal (desktop)
- [ ] Marcos:
  - **Séc. XIX** — Padre Antônio Moreira Barbosa funda o povoado de São José da Varginha
  - **1881** — Elevação a distrito de Pará de Minas
  - **Indeterminado** — Padre Libério abençoa a nascente
  - **01/03/1963** — Emancipação municipal de São José da Varginha
  - **Hoje** — Mina como ponto de turismo religioso e natural
- [ ] Foto placeholder em cada marco (substituível por real)

### Step 7 — VisitaSection
- [ ] Card de informações: endereço, horário (livre), entrada (gratuita), dicas de acesso
- [ ] Embed Google Maps com pino em São José da Varginha (iframe público)
- [ ] Botão "Como Chegar" → abre Google Maps app/web

### Step 8 — Footer
- [ ] Nome do município, créditos
- [ ] Links placeholder: Instagram, Facebook, WhatsApp
- [ ] Copyright year dinâmico (`new Date().getFullYear()`)

### Step 9 — Polimento & QA
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
