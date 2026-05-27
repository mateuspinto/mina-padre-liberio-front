<script setup>
import { useI18n } from '../../i18n/useI18n.js'
const { t } = useI18n()

const MAPS_EMBED = 'https://maps.google.com/maps?q=Mina+do+Padre+Lib%C3%A9rio,+S%C3%A3o+Jos%C3%A9+da+Varginha,+MG,+Brasil&output=embed&hl=pt-BR'
const MAPS_LINK  = 'https://maps.google.com/?q=Mina+do+Padre+Lib%C3%A9rio,+S%C3%A3o+Jos%C3%A9+da+Varginha,+MG,+Brasil'
</script>

<template>
  <section id="visita" class="visita-section">
    <div class="container">
      <h2 class="visita-titulo">{{ t('visita.titulo') }}</h2>

      <div class="visita-grid">

        <!-- Card de informações -->
        <div class="info-card">
          <ul class="info-list">

            <li class="info-item">
              <div class="info-icon" aria-hidden="true">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
                  <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A32 32 0 0 1 8 14.58a32 32 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10"/>
                  <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4m0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
                </svg>
              </div>
              <div class="info-content">
                <span class="info-label">{{ t('visita.endereco_label') }}</span>
                <span class="info-value">{{ t('visita.endereco') }}</span>
                <span class="info-value muted">{{ t('visita.cep') }}</span>
              </div>
            </li>

            <li class="info-item">
              <div class="info-icon" aria-hidden="true">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
                  <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71z"/>
                  <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0"/>
                </svg>
              </div>
              <div class="info-content">
                <span class="info-label">{{ t('visita.horario_label') }}</span>
                <span class="info-value">{{ t('visita.horario') }}</span>
              </div>
            </li>

            <li class="info-item">
              <div class="info-icon" aria-hidden="true">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
                  <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2"/>
                </svg>
              </div>
              <div class="info-content">
                <span class="info-label">{{ t('visita.entrada_label') }}</span>
                <span class="info-value">{{ t('visita.entrada') }}</span>
              </div>
            </li>

            <li class="info-item">
              <div class="info-icon" aria-hidden="true">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
                  <path d="M7 11.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5m-1.496-6.964a.5.5 0 0 1 .5-.5H9.5a.5.5 0 0 1 0 1H6.004a.5.5 0 0 1-.5-.5M5 8.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5"/>
                  <path d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5z"/>
                </svg>
              </div>
              <div class="info-content">
                <span class="info-label">{{ t('visita.dica_label') }}</span>
                <span class="info-value">{{ t('visita.dica') }}</span>
              </div>
            </li>

          </ul>

          <a
            :href="MAPS_LINK"
            target="_blank"
            rel="noopener noreferrer"
            class="cta-btn"
          >
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16" aria-hidden="true">
              <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A32 32 0 0 1 8 14.58a32 32 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10"/>
              <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4m0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
            </svg>
            {{ t('visita.cta') }}
          </a>
        </div>

        <!-- Mapa embed -->
        <div class="mapa-wrap">
          <iframe
            :src="MAPS_EMBED"
            class="mapa-iframe"
            :title="t('visita.titulo')"
            loading="lazy"
            referrerpolicy="no-referrer-when-downgrade"
            allowfullscreen
          ></iframe>
        </div>

      </div>
    </div>
  </section>
</template>

<style scoped>
.visita-section {
  background-color: var(--color-bg);
  padding: var(--space-3xl) 0;
}

.visita-titulo {
  color: var(--color-white);
  text-align: center;
  margin-bottom: var(--space-2xl);
}

.visita-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: var(--space-xl);
}

@media (min-width: 768px) {
  .visita-grid {
    grid-template-columns: 1fr 1fr;
    align-items: start;
  }
}

/* Info card */
.info-card {
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);
  padding: var(--space-xl);
  display: flex;
  flex-direction: column;
  gap: var(--space-lg);
}

.info-list {
  display: flex;
  flex-direction: column;
  gap: var(--space-lg);
}

.info-item {
  display: flex;
  gap: var(--space-md);
  align-items: flex-start;
}

.info-icon {
  flex-shrink: 0;
  width: 36px;
  height: 36px;
  background: rgba(126, 184, 212, 0.12);
  border-radius: var(--radius-sm);
  display: flex;
  align-items: center;
  justify-content: center;
  color: var(--color-secondary);
  margin-top: 2px;
}

.info-content {
  display: flex;
  flex-direction: column;
  gap: 2px;
}

.info-label {
  font-size: 0.72rem;
  font-weight: 700;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: var(--color-secondary);
}

.info-value {
  font-size: 0.9rem;
  color: var(--color-text-muted);
  line-height: 1.5;
}

.info-value.muted {
  font-size: 0.8rem;
  opacity: 0.6;
}

/* CTA */
.cta-btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: var(--space-sm);
  background: var(--color-secondary);
  color: var(--color-primary-dark);
  font-weight: 700;
  font-size: 0.9rem;
  padding: var(--space-md) var(--space-xl);
  border-radius: var(--radius-md);
  transition: opacity var(--transition), transform var(--transition);
}

.cta-btn:hover {
  opacity: 0.88;
  transform: translateY(-1px);
}

/* Mapa */
.mapa-wrap {
  border-radius: var(--radius-lg);
  overflow: hidden;
  border: 1px solid var(--color-border);
  aspect-ratio: 4 / 3;
}

.mapa-iframe {
  width: 100%;
  height: 100%;
  border: none;
  display: block;
}
</style>
