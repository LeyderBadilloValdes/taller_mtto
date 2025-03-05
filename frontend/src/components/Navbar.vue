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
            <a class="nav-link active text-white" href="#" @click="irADashboard">Inicio</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-white" href="#" @click="irACatalogos">Catálogos</a>
          </li>

          <!-- Menú desplegable -->
          <li class="nav-item dropdown">
            <a 
              class="nav-link dropdown-toggle text-white" 
              href="#" 
              id="opcionesDropdown"
              role="button" 
              data-bs-toggle="dropdown" 
              aria-expanded="false"
              @click="toggleDropdown">
              Opciones
            </a>
            <ul class="dropdown-menu" :class="{ show: isDropdownOpen }" aria-labelledby="opcionesDropdown">
              <li><a class="dropdown-item" href="#">Opción 1</a></li>
              <li><a class="dropdown-item" href="#">Opción 2</a></li>
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item" href="#">Opción 3</a></li>
            </ul>
          </li>
        </ul>

        <!-- Botón de Cerrar Sesión -->
        <button class="btn btn-outline-light ms-auto" data-bs-toggle="modal" data-bs-target="#logoutModal">
          Cerrar sesión
        </button>
      </div>
    </div>
  </nav>

  <!-- Modal de Cerrar Sesión -->
  <div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="logoutModalLabel">Confirmar salida</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          ¿Estás seguro de que deseas cerrar sesión?
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
          <button type="button" class="btn btn-danger" @click="confirmLogout">Salir</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { useRouter } from 'vue-router';
import { Modal } from 'bootstrap';

export default {
  name: 'Navbar',
  data() {
    return {
      isDropdownOpen: false, // Estado para controlar el menú desplegable
    };
  },
  methods: {
    logout() {
      localStorage.removeItem('token');
      this.$router.push('/login');
    },
    irACatalogos() {
      this.$router.push('/catalogos');
    },
    irADashboard() {
      this.$router.push('/dashboard');
    },
    confirmLogout() {
      // Cerrar modal manualmente
      const modalElement = document.getElementById('logoutModal');
      const modalInstance = Modal.getInstance(modalElement);
      if (modalInstance) modalInstance.hide();

      // Eliminar backdrop si queda pegado
      document.querySelectorAll('.modal-backdrop').forEach(el => el.remove());

      setTimeout(() => {
        localStorage.removeItem('token');
        this.$router.push('/login');
      }, 200);
    },
    toggleDropdown(event) {
      event.preventDefault(); // Evita redireccionamiento por defecto
      this.isDropdownOpen = !this.isDropdownOpen;
    },
  },
};
</script>

<style scoped>
/* Evita que la pantalla quede opaca al cerrar el modal */
.modal-backdrop {
  display: none !important;
}
</style>
