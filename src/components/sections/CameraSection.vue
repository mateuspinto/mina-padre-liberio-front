<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
import { useI18n } from '../../i18n/useI18n.js'

const { t } = useI18n()
const iframeKey = ref(0)
const ultimaAtualizacao = ref(new Date())
const isFullscreen = ref(false)

const INTERVALO_MS = 5 * 60 * 1000
let timer = null
let ocultadoEm = null

function recarregar() {
  iframeKey.value++
  ultimaAtualizacao.value = new Date()
}

function onVisibilidade() {
  if (document.hidden) {
    ocultadoEm = Date.now()
  } else if (ocultadoEm && Date.now() - ocultadoEm > INTERVALO_MS) {
    recarregar()
  }
}

function toggleFullscreen() {
  isFullscreen.value = !isFullscreen.value
  document.body.style.overflow = isFullscreen.value ? 'hidden' : ''
}

function onKeydown(e) {
  if (e.key === 'Escape' && isFullscreen.value) toggleFullscreen()
}

onMounted(() => {
  timer = setInterval(recarregar, INTERVALO_MS)
  document.addEventListener('visibilitychange', onVisibilidade)
  document.addEventListener('keydown', onKeydown)
})

onUnmounted(() => {
  clearInterval(timer)
  document.removeEventListener('visibilitychange', onVisibilidade)
  document.removeEventListener('keydown', onKeydown)
  document.body.style.overflow = ''
})
</script>

<template>
  <section id="camera" class="camera-section">
    <div class="camera-wrapper" :class="{ 'is-fullscreen': isFullscreen }">
      <span class="badge-live" aria-label="Transmissão ao vivo">
        <span class="badge-dot" aria-hidden="true"></span>
        {{ t('camera.badge') }}
      </span>

      <!-- Botão fechar visível apenas no modo fullscreen (toque em mobile) -->
      <button v-if="isFullscreen" class="btn-close-fullscreen" @click="toggleFullscreen" aria-label="Sair da tela cheia">
        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" viewBox="0 0 16 16" aria-hidden="true">
          <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
        </svg>
      </button>

      <iframe
        :key="iframeKey"
        src="https://safecam.brsuper.com.br/#/cembed/09e18bf10772b7e977c366c9ed61ab21554a9b137421eda2f06f7f221e9fa24c7ce8552b7a7327799dbf93151b6f"
        class="camera-iframe"
        :title="t('camera.titulo')"
        allow="autoplay; encrypted-media; fullscreen"
        allowfullscreen
        loading="lazy"
      >
        <p class="camera-fallback">{{ t('camera.fallback') }}</p>
      </iframe>
    </div>

    <div class="camera-actions container">
      <span class="camera-timestamp">
        {{ ultimaAtualizacao.toLocaleTimeString('pt-BR', { hour: '2-digit', minute: '2-digit' }) }}
      </span>

      <button class="btn-recarregar" @click="recarregar" :title="t('camera.recarregar')">
        <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" viewBox="0 0 16 16" aria-hidden="true">
          <path fill-rule="evenodd" d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2z"/>
          <path d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466"/>
        </svg>
        {{ t('camera.recarregar') }}
      </button>

      <!-- Botão tela cheia — fora da câmera, na barra de ações -->
      <button class="btn-recarregar" @click="toggleFullscreen" :title="isFullscreen ? t('camera.sair_tela_cheia') : t('camera.tela_cheia')">
        <svg v-if="!isFullscreen" xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" viewBox="0 0 16 16" aria-hidden="true">
          <path d="M1.5 1h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5v-4a.5.5 0 0 1 1 0v4zM15.5 15h-4a.5.5 0 0 1 0-1h4a.5.5 0 0 1 .5.5v-4a.5.5 0 0 1 1 0v4zM1 10.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1H2.707l3.647 3.646a.5.5 0 0 1-.708.708L2 12.707V15.5a.5.5 0 0 1-1 0v-4zM15.5 1h-4a.5.5 0 0 1 0-1h4a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-1 0V2.707l-3.646 3.647a.5.5 0 0 1-.708-.708L14.293 2H11.5a.5.5 0 0 1 0-1z"/>
        </svg>
        <svg v-else xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" viewBox="0 0 16 16" aria-hidden="true">
          <path d="M5.5 0a.5.5 0 0 1 .5.5v4A1.5 1.5 0 0 1 4.5 6h-4a.5.5 0 0 1 0-1h4a.5.5 0 0 0 .5-.5v-4a.5.5 0 0 1 .5-.5zm5 0a.5.5 0 0 1 .5.5v4a.5.5 0 0 0 .5.5h4a.5.5 0 0 1 0 1h-4A1.5 1.5 0 0 1 10 4.5v-4a.5.5 0 0 1 .5-.5zM0 10.5a.5.5 0 0 1 .5-.5h4A1.5 1.5 0 0 1 6 11.5v4a.5.5 0 0 1-1 0v-4a.5.5 0 0 0-.5-.5h-4a.5.5 0 0 1-.5-.5zm10 1a1.5 1.5 0 0 1 1.5-1.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 0-.5.5v4a.5.5 0 0 1-1 0v-4z"/>
        </svg>
        {{ isFullscreen ? t('camera.sair_tela_cheia') : t('camera.tela_cheia') }}
      </button>

      <a href="https://minapadreliberio.brsuper.com.br/" target="_blank" rel="noopener noreferrer" class="camera-link-ext">
        <svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" viewBox="0 0 16 16" aria-hidden="true">
          <path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5"/>
          <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0z"/>
        </svg>
        Abrir em nova aba
      </a>
    </div>
  </section>
</template>

<style scoped>
.camera-section {
  background: linear-gradient(160deg, var(--color-primary) 0%, var(--color-primary-dark) 100%);
}

/* === Estado normal === */
.camera-wrapper {
  position: relative;
  width: 100%;
  aspect-ratio: 16 / 9;
  background-color: #000;
  border-radius: 10px;
  overflow: hidden;
}

.camera-iframe {
  width: 100%;
  height: 100%;
  border: none;
  display: block;
}

/* === Fullscreen CSS puro — portrait: rotaciona 90deg para forçar paisagem === */
.camera-wrapper.is-fullscreen {
  position: fixed;
  z-index: 9999;
  top: 50%;
  left: 50%;
  aspect-ratio: unset;
  border-radius: 0;
  background: #000;
  display: flex;
  align-items: center;
  justify-content: center;

  /* Troca dimensões e rotaciona: portrait vira landscape */
  width: 100dvh;
  height: 100dvw;
  transform: translate(-50%, -50%) rotate(90deg);
}

/* Em landscape (celular já virado ou desktop), sem rotação */
@media (orientation: landscape) {
  .camera-wrapper.is-fullscreen {
    width: 100dvw;
    height: 100dvh;
    transform: translate(-50%, -50%);
  }
}

/* Iframe dentro do fullscreen: mantém 16:9 centralizado */
.camera-wrapper.is-fullscreen .camera-iframe {
  width: min(100dvh, calc(100dvw * 16 / 9));
  height: min(100dvw, calc(100dvh * 9 / 16));
  flex-shrink: 0;
}

@media (orientation: landscape) {
  .camera-wrapper.is-fullscreen .camera-iframe {
    width: min(100dvw, calc(100dvh * 16 / 9));
    height: min(100dvh, calc(100dvw * 9 / 16));
  }
}

/* Botão fechar no fullscreen */
.btn-close-fullscreen {
  position: absolute;
  top: var(--space-md);
  right: var(--space-md);
  z-index: 10;
  display: flex;
  align-items: center;
  justify-content: center;
  width: 36px;
  height: 36px;
  background-color: rgba(0, 0, 0, 0.6);
  backdrop-filter: blur(4px);
  border: 1px solid rgba(255, 255, 255, 0.2);
  border-radius: var(--radius-sm);
  color: rgba(255, 255, 255, 0.85);
  transition: background-color var(--transition);
}

.btn-close-fullscreen:hover {
  background-color: rgba(0, 0, 0, 0.85);
  color: var(--color-white);
}

/* Badge AO VIVO */
.badge-live {
  position: absolute;
  top: var(--space-md);
  left: var(--space-md);
  z-index: 10;
  display: inline-flex;
  align-items: center;
  gap: var(--space-xs);
  background-color: rgba(0, 0, 0, 0.55);
  backdrop-filter: blur(4px);
  border: 1px solid rgba(229, 62, 62, 0.5);
  color: #fc8181;
  font-size: 0.65rem;
  font-weight: 700;
  letter-spacing: 0.12em;
  padding: 3px 10px;
  border-radius: var(--radius-full);
}

.badge-dot {
  width: 6px;
  height: 6px;
  background-color: #e53e3e;
  border-radius: 50%;
  animation: pulse-dot 1.6s ease-in-out infinite;
}

@keyframes pulse-dot {
  0%, 100% { opacity: 1; transform: scale(1); }
  50%       { opacity: 0.4; transform: scale(0.7); }
}

.camera-fallback {
  color: rgba(255, 255, 255, 0.5);
  font-size: 0.9rem;
  padding: var(--space-xl);
  text-align: center;
}

/* Barra de ações */
.camera-actions {
  display: flex;
  align-items: center;
  justify-content: flex-end;
  gap: var(--space-md);
  padding-top: var(--space-sm);
  padding-bottom: var(--space-sm);
  flex-wrap: wrap;
}

.btn-recarregar {
  display: inline-flex;
  align-items: center;
  gap: var(--space-sm);
  background-color: rgba(255, 255, 255, 0.08);
  color: rgba(255, 255, 255, 0.7);
  border: 1px solid rgba(255, 255, 255, 0.12);
  border-radius: var(--radius-sm);
  padding: var(--space-sm) var(--space-md);
  font-size: 0.8rem;
  font-weight: 500;
  transition: background-color var(--transition), color var(--transition);
}

.btn-recarregar:hover {
  background-color: rgba(255, 255, 255, 0.15);
  color: var(--color-white);
}

.camera-link-ext {
  display: inline-flex;
  align-items: center;
  gap: var(--space-xs);
  color: rgba(255, 255, 255, 0.3);
  font-size: 0.78rem;
  transition: color var(--transition);
}

.camera-link-ext:hover {
  color: rgba(255, 255, 255, 0.6);
}

.camera-timestamp {
  color: rgba(255, 255, 255, 0.25);
  font-size: 0.75rem;
  margin-right: auto;
}
</style>
