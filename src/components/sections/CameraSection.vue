<script setup>
import { ref } from 'vue'
import { useI18n } from '../../i18n/useI18n.js'

const { t } = useI18n()
const iframeKey = ref(0)

function recarregar() {
  iframeKey.value++
}
</script>

<template>
  <section id="camera" class="camera-section">
    <div class="camera-wrapper">
      <span class="badge-live" aria-label="Transmissão ao vivo">
        <span class="badge-dot" aria-hidden="true"></span>
        {{ t('camera.badge') }}
      </span>

      <iframe
        :key="iframeKey"
        src="https://minapadreliberio.brsuper.com.br/"
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
      <button class="btn-recarregar" @click="recarregar" :title="t('camera.recarregar')">
        <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" viewBox="0 0 16 16" aria-hidden="true">
          <path fill-rule="evenodd" d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2z"/>
          <path d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466"/>
        </svg>
        {{ t('camera.recarregar') }}
      </button>

      <a
        href="https://minapadreliberio.brsuper.com.br/"
        target="_blank"
        rel="noopener noreferrer"
        class="camera-link-ext"
      >
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
  background: linear-gradient(160deg, #1e3510 0%, #0d1a08 100%);
}

.camera-wrapper {
  position: relative;
  width: 100%;
  aspect-ratio: 16 / 9;
  background-color: #000;
}

.camera-iframe {
  width: 100%;
  height: 100%;
  border: none;
  display: block;
}

.camera-fallback {
  color: rgba(255, 255, 255, 0.5);
  font-size: 0.9rem;
  padding: var(--space-xl);
  text-align: center;
}

/* Badge sobreposto no canto superior esquerdo */
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

/* Barra de ações abaixo da câmera */
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
</style>
