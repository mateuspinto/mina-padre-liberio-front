<script setup>
import { ref } from 'vue'
import { useI18n } from '../../i18n/useI18n.js'
import { useScrollSpy } from '../../composables/useScrollSpy.js'

const { t } = useI18n()
const { activeSection } = useScrollSpy(['camera', 'velario', 'sobre', 'historia', 'visita'])

const menuOpen = ref(false)

const links = [
  { id: 'camera' },
  { id: 'velario' },
  { id: 'sobre' },
  { id: 'historia' },
  { id: 'visita' },
]

function toggleMenu() {
  menuOpen.value = !menuOpen.value
}

function closeMenu() {
  menuOpen.value = false
}
</script>

<template>
  <nav class="navbar" role="navigation" aria-label="Navegação principal">
    <div class="navbar-inner">
      <a class="navbar-brand" href="#camera" @click="closeMenu">
        {{ t('nav.title') }}
      </a>

      <button
        class="hamburger"
        :class="{ open: menuOpen }"
        @click="toggleMenu"
        :aria-expanded="menuOpen.toString()"
        :aria-label="menuOpen ? t('nav.menu_fechar') : t('nav.menu_abrir')"
      >
        <span></span>
        <span></span>
        <span></span>
      </button>

      <div class="navbar-menu" :class="{ open: menuOpen }">
        <ul class="navbar-links">
          <li v-for="link in links" :key="link.id">
            <a
              :href="`#${link.id}`"
              class="navbar-link"
              :class="{ active: activeSection === link.id }"
              @click="closeMenu"
            >
              {{ t(`nav.${link.id}`) }}
            </a>
          </li>
        </ul>

        <div class="lang-selector" aria-label="Seletor de idioma">
          <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" viewBox="0 0 16 16" aria-hidden="true">
            <path d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm7.5-6.923c-.67.204-1.335.82-1.887 1.855A7.97 7.97 0 0 0 5.145 4H7.5V1.077zM4.09 4a9.267 9.267 0 0 1 .64-1.539 6.7 6.7 0 0 1 .597-.933A7.025 7.025 0 0 0 2.255 4H4.09zm-.582 3.5c.03-.877.138-1.718.312-2.5H1.674a6.958 6.958 0 0 0-.656 2.5h2.49zM4.847 5a12.5 12.5 0 0 0-.338 2.5H7.5V5H4.847zM8.5 5v2.5h2.99a12.495 12.495 0 0 0-.337-2.5H8.5zM4.51 8.5a12.5 12.5 0 0 0 .337 2.5H7.5V8.5H4.51zm3.99 0V11h2.653c.187-.765.306-1.608.338-2.5H8.5zM5.145 12c.138.386.295.744.468 1.068.552 1.035 1.218 1.65 1.887 1.855V12H5.145zm.182 2.472a6.696 6.696 0 0 1-.597-.933A9.268 9.268 0 0 1 4.09 12H2.255a7.024 7.024 0 0 0 3.072 2.472zM3.82 11a13.652 13.652 0 0 1-.312-2.5h-2.49c.062.89.291 1.733.656 2.5H3.82zm6.853 3.472A7.024 7.024 0 0 0 13.745 12H11.91a9.27 9.27 0 0 1-.64 1.539 6.688 6.688 0 0 1-.597.933zM8.5 12v2.923c.67-.204 1.335-.82 1.887-1.855.173-.324.33-.682.468-1.068H8.5zm3.68-1h2.146c.365-.767.594-1.61.656-2.5h-2.49a13.65 13.65 0 0 1-.312 2.5zm2.802-3.5a6.959 6.959 0 0 0-.656-2.5H12.18c.174.782.282 1.623.312 2.5h2.49zM11.27 2.461c.247.464.462.98.64 1.539h1.835a7.024 7.024 0 0 0-3.072-2.472c.218.284.418.598.597.933zM10.855 4a7.966 7.966 0 0 0-.468-1.068C9.835 1.897 9.17 1.282 8.5 1.077V4h2.355z"/>
          </svg>
          <span>{{ t('nav.lang') }}</span>
        </div>
      </div>
    </div>
  </nav>
</template>

<style scoped>
.navbar {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 100;
  background-color: var(--color-primary);
  box-shadow: var(--shadow-md);
  height: var(--navbar-height);
}

.navbar-inner {
  max-width: var(--container-max);
  margin: 0 auto;
  padding: 0 var(--container-pad);
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: space-between;
  position: relative;
}

.navbar-brand {
  color: var(--color-white);
  font-size: clamp(0.8rem, 4vw, 1rem);
  font-weight: 700;
  letter-spacing: 0.01em;
  line-height: 1.2;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  flex-shrink: 1;
  min-width: 0;
  padding-right: var(--space-md);
}

/* Hamburger */
.hamburger {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  width: 28px;
  height: 20px;
  padding: 0;
  flex-shrink: 0;
}

.hamburger span {
  display: block;
  height: 2px;
  background-color: var(--color-white);
  border-radius: 2px;
  transition: transform var(--transition), opacity var(--transition);
  transform-origin: center;
}

.hamburger.open span:nth-child(1) {
  transform: translateY(9px) rotate(45deg);
}
.hamburger.open span:nth-child(2) {
  opacity: 0;
  transform: scaleX(0);
}
.hamburger.open span:nth-child(3) {
  transform: translateY(-9px) rotate(-45deg);
}

/* Menu mobile */
.navbar-menu {
  display: none;
  flex-direction: column;
  position: absolute;
  top: var(--navbar-height);
  left: 0;
  right: 0;
  background-color: var(--color-primary-dark);
  padding: var(--space-sm) 0 var(--space-md);
  box-shadow: var(--shadow-md);
}

.navbar-menu.open {
  display: flex;
}

.navbar-links {
  display: flex;
  flex-direction: column;
}

.navbar-link {
  display: block;
  padding: var(--space-md) var(--space-xl);
  color: rgba(255, 255, 255, 0.8);
  font-size: 0.95rem;
  font-weight: 500;
  border-left: 3px solid transparent;
  transition: background-color var(--transition), color var(--transition), border-color var(--transition);
}

.navbar-link:hover,
.navbar-link:focus-visible {
  background-color: rgba(255, 255, 255, 0.08);
  color: var(--color-white);
  outline: none;
}

.navbar-link.active {
  color: var(--color-white);
  border-left-color: var(--color-secondary);
  background-color: rgba(255, 255, 255, 0.1);
}

.lang-selector {
  display: flex;
  align-items: center;
  gap: var(--space-xs);
  padding: var(--space-md) var(--space-xl);
  color: rgba(255, 255, 255, 0.5);
  font-size: 0.8rem;
  font-weight: 600;
  letter-spacing: 0.06em;
  cursor: default;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  margin-top: var(--space-sm);
}

/* Desktop */
@media (min-width: 768px) {
  .hamburger {
    display: none;
  }

  .navbar-menu {
    display: flex;
    flex-direction: row;
    align-items: center;
    position: static;
    background: none;
    padding: 0;
    box-shadow: none;
    gap: var(--space-xs);
    flex-shrink: 0;
  }

  .navbar-links {
    flex-direction: row;
    gap: 2px;
  }

  .navbar-link {
    padding: var(--space-sm) var(--space-md);
    border-left: none;
    border-bottom: 2px solid transparent;
    border-radius: var(--radius-sm) var(--radius-sm) 0 0;
    font-size: 0.9rem;
  }

  .navbar-link:hover,
  .navbar-link:focus-visible {
    background-color: rgba(255, 255, 255, 0.1);
  }

  .navbar-link.active {
    border-left: none;
    border-bottom-color: var(--color-secondary);
    background-color: rgba(255, 255, 255, 0.12);
    padding-bottom: calc(var(--space-sm) - 2px);
  }

  .lang-selector {
    padding: var(--space-sm) var(--space-md);
    border-top: none;
    margin-top: 0;
    padding-left: var(--space-md);
    border-left: 1px solid rgba(255, 255, 255, 0.2);
    margin-left: var(--space-sm);
  }
}
</style>
