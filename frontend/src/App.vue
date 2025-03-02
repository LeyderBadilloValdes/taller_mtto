<template>
  <div id="app">
    <Navbar v-if="showNavbar" /> <!-- Solo muestra el Navbar si no estamos en login -->
    <router-view></router-view> <!-- Aquí se cargan las rutas -->
  </div>
</template>

<script>
import { useRouter } from 'vue-router';
import Navbar from './components/Navbar.vue';

export default {
  name: 'App',
  components: {
    Navbar
  },
  computed: {
    showNavbar() {
      // Mostrar el Navbar solo si no estamos en la página de login
      return this.$route.name !== 'login';
    }
  },
  created() {
    // Verificar si el token está en el localStorage al cargar la aplicación
    if (localStorage.getItem('token')) {
      this.$router.push('/dashboard');
    }
  }
}
</script>
