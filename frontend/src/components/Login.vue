<template>
  <div class="d-flex min-vh-100 align-items-center justify-content-center bg-light">
    <div class="card shadow-lg border border-success" style="max-width: 400px; width: 100%;">
      <div class="card-body">
        <h2 class="text-center text-success mb-4">Iniciar Sesión</h2>

        <form @submit.prevent="login">
          <div class="mb-3">
            <label class="form-label text-success">Nombre de Usuario</label>
            <input v-model="username" type="text" class="form-control border-success" required>
          </div>

          <div class="mb-3">
            <label class="form-label text-success">Contraseña</label>
            <input v-model="password" type="password" class="form-control border-success" required>
          </div>

          <button type="submit" class="btn btn-success w-100 shadow-sm">Ingresar</button>
        </form>

        <p v-if="error" class="mt-3 text-danger text-center fw-bold">{{ error }}</p>
      </div>
    </div>
  </div>
</template>


<script>
import { useRouter } from 'vue-router';
import { ref, onMounted } from 'vue';
import axios from 'axios';
import api from '@/api'; // Ajusta la ruta según tu estructura
export default {
  setup() {
    const username = ref('');
    const password = ref('');
    const error = ref('');
    const router = useRouter();

    onMounted(() => {
      if (localStorage.getItem('token')) {
        router.push('/dashboard');
      }
    });

    const login = async () => {
      error.value = '';

      if (!username.value || !password.value) {
        error.value = '⚠️ Todos los campos son obligatorios';
        return;
      }

      try {
        const response = await api.post('/auth/token/login', {
          username: username.value,
          password: password.value
        });
        if (response.data && response.data.auth_token) {
          localStorage.setItem('token', response.data.auth_token);
          router.push('/dashboard');
        } else {
          error.value = '⚠️ No se recibió un token de autenticación';
        }
      } catch (err) {
        if (!err.response) {
          error.value = '❌ Error de conexión con el servidor';
        } else if (err.response.status === 401) {
          error.value = '⚠️ Credenciales incorrectas';
        } else {
          error.value = '⚠️ Ocurrió un error inesperado';
        }
      }
    };

    return { username, password, error, login };
  }
};
</script>
