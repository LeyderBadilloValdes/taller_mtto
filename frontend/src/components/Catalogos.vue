<template>
    <div class="container mt-5">
      <!-- Selector para escoger la vista -->
      <div class="mb-4">
        <label for="vista" class="form-label">Selecciona una vista</label>
        <select v-model="vistaSeleccionada" class="form-select" id="vista">
          <option value="usuarios">Usuarios</option>
          <option value="equipos">Equipos</option>
          <option value="mantenimientos">Mantenimientos</option>
          <option value="repuestos">Repuestos</option>
        </select>
      </div>
      <div>    
        <!-- Botón para regresar desde Catálogos -->
        <button @click="regresarADashboard" class="btn btn-secondary">Regresar al Dashboard</button>
      </div>
      <!-- Vista de Usuarios -->
      <div v-if="vistaSeleccionada === 'usuarios'">
        <h3>Usuarios</h3>
        <table class="table table-bordered">
          <thead>
            <tr>
              <th>Nombre de Usuario</th>
              <th>Correo Electrónico</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="usuario in usuarios" :key="usuario.id">
              <td>{{ usuario.username }}</td>
              <td>{{ usuario.email }}</td>
              <td>
                <button class="btn btn-warning btn-sm">Editar</button>
                <button class="btn btn-danger btn-sm" @click="eliminarUsuario(usuario.id)">Eliminar</button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
  
      <!-- Vista de Equipos -->
      <div v-if="vistaSeleccionada === 'equipos'">
        <h3>Equipos</h3>
        <table class="table table-bordered">
          <thead>
            <tr>
              <th>Nombre del Equipo</th>
              <th>Tipo</th>
              <th>Ubicación</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="equipo in equipos" :key="equipo.id_equipo">
              <td>{{ equipo.nombre }}</td>
              <td>{{ equipo.tipo }}</td>
              <td>{{ equipo.ubicacion }}</td>
              <td>
                <button class="btn btn-warning btn-sm">Editar</button>
                <button class="btn btn-danger btn-sm" @click="eliminarEquipo(equipo.id_equipo)">Eliminar</button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
  
      <!-- Vista de Mantenimientos -->
      <div v-if="vistaSeleccionada === 'mantenimientos'">
        <h3>Mantenimientos</h3>
        <table class="table table-bordered">
          <thead>
            <tr>
              <th>Equipo</th>
              <th>Tipo de Mantenimiento</th>
              <th>Fecha de Realización</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="mantenimiento in mantenimientos" :key="mantenimiento.id_mantenimiento">
              <td>{{ mantenimiento.equipo.nombre }}</td>
              <td>{{ mantenimiento.tipo_mantenimiento }}</td>
              <td>{{ mantenimiento.fecha_realizacion }}</td>
              <td>
                <button class="btn btn-warning btn-sm">Editar</button>
                <button class="btn btn-danger btn-sm" @click="eliminarMantenimiento(mantenimiento.id_mantenimiento)">Eliminar</button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
  
      <!-- Vista de Repuestos -->
      <div v-if="vistaSeleccionada === 'repuestos'">
        <h3>Repuestos</h3>
        <table class="table table-bordered">
          <thead>
            <tr>
              <th>Equipo</th>
              <th>Nombre del Repuesto</th>
              <th>Referencia</th>
              <th>Cantidad</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="repuesto in repuestos" :key="repuesto.id_repuesto">
              <td>{{ repuesto.equipo.nombre }}</td>
              <td>{{ repuesto.nombre_repuesto }}</td>
              <td>{{ repuesto.referencia }}</td>
              <td>{{ repuesto.cantidad }}</td>
              <td>
                <button class="btn btn-warning btn-sm">Editar</button>
                <button class="btn btn-danger btn-sm" @click="eliminarRepuesto(repuesto.id_repuesto)">Eliminar</button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        vistaSeleccionada: "usuarios", // Vista inicial
        usuarios: [], // Lista de usuarios
        equipos: [], // Lista de equipos
        mantenimientos: [], // Lista de mantenimientos
        repuestos: [], // Lista de repuestos
      };
    },
    methods: {
      obtenerUsuarios() {
        // Lógica para obtener la lista de usuarios desde la base de datos
      },
      obtenerEquipos() {
        // Lógica para obtener la lista de equipos desde la base de datos
      },
      obtenerMantenimientos() {
        // Lógica para obtener la lista de mantenimientos desde la base de datos
      },
      obtenerRepuestos() {
        // Lógica para obtener la lista de repuestos desde la base de datos
      },
      eliminarUsuario(id) {
        // Lógica para eliminar un usuario
      },
      eliminarEquipo(id) {
        // Lógica para eliminar un equipo
      },
      eliminarMantenimiento(id) {
        // Lógica para eliminar un mantenimiento
      },
      eliminarRepuesto(id) {
        // Lógica para eliminar un repuesto
      }
    },
    mounted() {
      this.obtenerUsuarios();
      this.obtenerEquipos();
      this.obtenerMantenimientos();
      this.obtenerRepuestos();
    },
  
    // Método para regresar a la vista de Dashboard
    regresarADashboard() {
      this.$router.push('/dashboard');
    }
  };
  </script>
  