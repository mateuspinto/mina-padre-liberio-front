<script setup>
import { useI18n } from '../../i18n/useI18n.js'
const { t } = useI18n()
</script>

<template>
  <section id="historia" class="historia-section">
    <div class="container">
      <h2 class="historia-titulo">{{ t('historia.titulo') }}</h2>
      <ol class="timeline">
        <li
          v-for="(marco, i) in t('historia.marcos')"
          :key="i"
          class="marco"
        >
          <div class="marco-dot-wrap">
            <span class="marco-dot"></span>
          </div>
          <div class="marco-card">
            <div class="marco-header">
              <span class="marco-ano">{{ marco.ano }}</span>
            </div>
            <p class="marco-texto">{{ marco.texto }}</p>
          </div>
        </li>
      </ol>
    </div>
  </section>
</template>

<style scoped>
.historia-section {
  background-color: var(--color-primary-dark);
  padding: var(--space-3xl) 0;
}

.historia-titulo {
  color: var(--color-white);
  text-align: center;
  margin-bottom: var(--space-2xl);
}

/* ===== Mobile: vertical ===== */

.timeline {
  list-style: none;
  position: relative;
  padding-left: 32px;
}

.timeline::before {
  content: '';
  position: absolute;
  left: 6px;
  top: 8px;
  bottom: 8px;
  width: 2px;
  background: linear-gradient(
    to bottom,
    transparent,
    var(--color-secondary) 8%,
    var(--color-secondary) 92%,
    transparent
  );
}

.marco {
  display: flex;
  flex-direction: row;
  gap: var(--space-md);
  margin-bottom: var(--space-xl);
  position: relative;
}

.marco:last-child {
  margin-bottom: 0;
}

.marco-dot-wrap {
  position: absolute;
  left: -32px;
  top: 6px;
  z-index: 1;
}

.marco-dot {
  display: block;
  width: 14px;
  height: 14px;
  border-radius: 50%;
  background: var(--color-secondary);
  border: 2px solid var(--color-primary-dark);
  box-shadow: 0 0 0 2px var(--color-secondary);
}

.marco-card {
  flex: 1;
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-md);
  overflow: hidden;
}

.marco-header {
  background: linear-gradient(135deg, var(--color-primary) 0%, var(--color-primary-light) 100%);
  padding: var(--space-sm) var(--space-md);
}

.marco-ano {
  font-size: 0.8rem;
  font-weight: 700;
  letter-spacing: 0.12em;
  text-transform: uppercase;
  color: var(--color-secondary);
}

.marco-texto {
  padding: var(--space-md);
  color: var(--color-text-muted);
  font-size: 0.9rem;
  line-height: 1.7;
}

/* ===== Desktop: horizontal ===== */

@media (min-width: 1024px) {
  .timeline {
    display: flex;
    flex-direction: row;
    padding-left: 0;
    gap: var(--space-sm);
    overflow: visible;
  }

  .timeline::before {
    display: none;
  }

  .marco {
    flex: 1;
    flex-direction: column;
    align-items: center;
    margin-bottom: 0;
    text-align: center;
    gap: var(--space-md);
  }

  /* Linha horizontal passando pelos dots */
  .marco::before {
    content: '';
    position: absolute;
    top: 6px;
    left: 0;
    right: 0;
    height: 2px;
    background: var(--color-secondary);
    opacity: 0.5;
    z-index: 0;
  }

  .marco:first-child::before { left: 50%; }
  .marco:last-child::before  { right: 50%; }

  .marco-dot-wrap {
    position: relative;
    left: auto;
    top: auto;
    width: 14px;
    height: 14px;
    flex-shrink: 0;
    z-index: 1;
  }

  .marco-card {
    width: 100%;
    text-align: left;
  }
}
</style>
