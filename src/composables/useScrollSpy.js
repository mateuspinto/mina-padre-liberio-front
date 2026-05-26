import { ref, onMounted, onUnmounted } from 'vue'

export function useScrollSpy(sectionIds) {
  const activeSection = ref(sectionIds[0])

  function update() {
    const navHeight = parseInt(
      getComputedStyle(document.documentElement).getPropertyValue('--navbar-height'),
    )
    for (const id of [...sectionIds].reverse()) {
      const el = document.getElementById(id)
      if (el && el.getBoundingClientRect().top <= navHeight + 16) {
        activeSection.value = id
        return
      }
    }
    activeSection.value = sectionIds[0]
  }

  onMounted(() => {
    window.addEventListener('scroll', update, { passive: true })
  })

  onUnmounted(() => {
    window.removeEventListener('scroll', update)
  })

  return { activeSection }
}
