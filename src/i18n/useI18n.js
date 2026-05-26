import { ref } from 'vue'
import translations from './language.json'

const locale = ref('pt')

function t(key) {
  const keys = key.split('.')
  let value = translations[locale.value]
  for (const k of keys) {
    if (value == null) return key
    value = value[k]
  }
  return value ?? key
}

function switchLocale(lang) {
  if (translations[lang]) locale.value = lang
}

export function useI18n() {
  return { locale, t, switchLocale }
}
