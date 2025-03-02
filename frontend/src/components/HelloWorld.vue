<template>
  <div class="container text-center mt-5">
    <h1 class="text-primary">Bienvenido a la aplicación</h1>
    <p>Esto es la vista de HelloWorld</p>
    <button @click="logout" class="btn btn-danger mt-3">Cerrar sesión</button>
  </div>
</template>

<script>
import { useRouter } from 'vue-router';

export default {
  setup() {
    const router = useRouter();

    const logout = () => {
      localStorage.removeItem('token'); // Eliminar el token
      router.push('/login'); // Redirigir a la página de login
    };

    return { logout };
  }
};
</script>

