<template>
  <nav class="navbar navbar-expand-lg" style="background-color: #28a745;">
    <div class="container-fluid">
      <a class="navbar-brand text-white" href="#">APP</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active text-white" aria-current="page" href="#" @click="irADashboard">Inicio</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-white" href="#" @click="irACatalogos">Catalogos</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Dropdown
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item"></a></li>
              <li><a class="dropdown-item" href="#">Another action</a></li>
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item" href="#">Something else here</a></li>
            </ul>
          </li>
          <li class="nav-item">
            <a class="nav-link text-white" href="#" @click="logout">Cerrar sesión</a>
          </li>
        </ul>
        <form class="d-flex" role="search">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-light" type="submit">Search</button>
        </form>
      </div>
    </div>
  </nav>
</template>

<script>
import { useRouter } from 'vue-router';

export default {
  name: 'Navbar',
  methods: {
    logout() {
      // Eliminar el token
      localStorage.removeItem('token');
      // Redirigir al login
      this.$router.push('/login');
    },
      // Método para ir a la vista de Catálogos
      irACatalogos() {
      console.log('Navegando a la vista Catalogos');
      this.$router.push('/catalogos');
     },
      irADashboard() {
      this.$router.push('/dashboard');
    } 
  }
};
</script>
