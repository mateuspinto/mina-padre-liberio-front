<script setup>
import { useI18n } from '../../i18n/useI18n.js'
const { t } = useI18n()
</script>

<template>
  <section id="sobre" class="sobre-section">
    <div class="container">
      <h2 class="sobre-titulo">{{ t('sobre.titulo') }}</h2>
      <div class="cards">

        <article class="card">
          <div class="card-icon">
            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" viewBox="0 0 16 16" aria-hidden="true">
              <path fill-rule="evenodd" d="M7.21.8C7.69.295 8 0 8 0q.164.544.371 1.038c.812 1.946 2.073 3.35 3.197 4.6C12.878 7.096 14 8.345 14 10a6 6 0 0 1-12 0C2 6.668 5.58 2.517 7.21.8m.413 1.021A31 31 0 0 0 5.794 3.99c-.726.95-1.436 2.008-1.96 3.07C3.304 8.133 3 9.138 3 10a5 5 0 0 0 10 0c0-1.201-.796-2.157-2.181-3.7l-.03-.032C9.75 5.11 8.5 3.72 7.623 1.82z"/>
              <path fill-rule="evenodd" d="M4.553 7.776c.82-1.641 1.717-2.753 2.093-3.13l.708.708c-.29.29-1.128 1.311-1.907 2.87z"/>
            </svg>
          </div>
          <h3 class="card-titulo">{{ t('sobre.card1.titulo') }}</h3>
          <p class="card-texto">{{ t('sobre.card1.texto') }}</p>
        </article>

        <article class="card">
          <div class="card-icon">
            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" viewBox="0 0 16 16" aria-hidden="true">
              <path d="M8.5 10c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1"/>
              <path d="M10.828.122A.5.5 0 0 1 11 .5V1h.5A1.5 1.5 0 0 1 13 2.5V15h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V1.5a.5.5 0 0 1 .43-.495l7-1a.5.5 0 0 1 .398.117M11.5 2H11v13h1V2.5a.5.5 0 0 0-.5-.5M4 1.934V15h6V1.077z"/>
            </svg>
          </div>
          <h3 class="card-titulo">{{ t('sobre.card2.titulo') }}</h3>
          <p class="card-texto">{{ t('sobre.card2.texto') }}</p>
        </article>

        <article class="card">
          <div class="card-icon">
            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" viewBox="0 0 16 16" aria-hidden="true">
              <path d="M8 3a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3"/>
              <path d="m5.93 6.704-.846 8.451a.768.768 0 0 0 1.523.203l.81-4.865a.59.59 0 0 1 1.165 0l.81 4.865a.768.768 0 0 0 1.523-.203l-.845-8.451A1.5 1.5 0 0 1 10.5 5.5L13 2.284a.796.796 0 0 0-1.239-.998L9.634 3.84a.7.7 0 0 1-.33.235c-.23.074-.665.176-1.304.176-.64 0-1.074-.102-1.305-.176a.7.7 0 0 1-.329-.235L4.239 1.286a.796.796 0 0 0-1.24.998l2.5 3.216c.317.316.475.758.43 1.204Z"/>
            </svg>
          </div>
          <h3 class="card-titulo">{{ t('sobre.card3.titulo') }}</h3>
          <p class="card-texto">{{ t('sobre.card3.texto') }}</p>
        </article>

      </div>
    </div>
  </section>
</template>

<style scoped>
.sobre-section {
  background-color: var(--color-bg);
  padding: var(--space-3xl) 0;
}

.sobre-titulo {
  color: var(--color-white);
  text-align: center;
  margin-bottom: var(--space-2xl);
  font-weight: 700;
  letter-spacing: 0.01em;
}

.cards {
  display: grid;
  grid-template-columns: 1fr;
  gap: var(--space-lg);
}

@media (min-width: 768px) {
  .cards {
    grid-template-columns: repeat(3, 1fr);
  }
}

.card {
  background-color: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);
  padding: var(--space-xl);
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
  gap: var(--space-md);
  transition: transform var(--transition), box-shadow var(--transition);
}

.card:hover {
  transform: translateY(-4px);
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.25);
}

.card-icon {
  color: var(--color-secondary);
  display: flex;
  align-items: center;
  justify-content: center;
  width: 72px;
  height: 72px;
  background-color: rgba(126, 184, 212, 0.12);
  border-radius: var(--radius-full);
  flex-shrink: 0;
}

.card-titulo {
  color: var(--color-white);
  font-size: 1.1rem;
  font-weight: 600;
}

.card-texto {
  color: var(--color-text-muted);
  font-size: 0.95rem;
  line-height: 1.7;
}
</style>
