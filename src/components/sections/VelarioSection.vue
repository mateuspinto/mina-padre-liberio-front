<script setup>
import { useI18n } from '../../i18n/useI18n.js'

const { t } = useI18n()
</script>

<template>
  <section id="velario" class="velario-section">
    <iframe
      src="https://peliberio.com.br/vela/"
      class="velario-iframe"
      :title="t('velario.titulo')"
      loading="lazy"
      scrolling="yes"
      referrerpolicy="no-referrer-when-downgrade"
    />
  </section>
</template>

<style scoped>
.velario-section {
  width: 100%;
  line-height: 0;
  font-size: 0;
  overflow: hidden;
}

.velario-iframe {
  width: 100%;
  height: 100vh;
  border: none;
  display: block;
  vertical-align: top;
}

.velario-fallback {
  color: #666;
  font-size: 0.9rem;
  padding: 2rem;
  text-align: center;
}
</style>
