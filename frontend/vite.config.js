import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue';
import path from 'path';  // ✅ Importar path

export default defineConfig({
  plugins: [vue()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),  // Definir alias '@' como 'src/'
    }
  }
});
