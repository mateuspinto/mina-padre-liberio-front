import { fileURLToPath, URL } from 'node:url'
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import vueDevTools from 'vite-plugin-vue-devtools'

// Em GitHub Actions, GITHUB_REPOSITORY = "usuario/repo"
// GitHub Pages serve de /<repo>/, então o base precisa ser /<repo>/
// Se usar domínio customizado, mude base para '/'
const base = process.env.GITHUB_REPOSITORY
  ? `/${process.env.GITHUB_REPOSITORY.split('/')[1]}/`
  : '/'

export default defineConfig(({ command }) => ({
  base,
  plugins: [
    vue(),
    // DevTools só em desenvolvimento
    command === 'serve' && vueDevTools(),
  ].filter(Boolean),
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url)),
    },
  },
  build: {
    sourcemap: false,
  },
}))
