<template>

<!-- Contenedor principal centrado -->
<div class="container mt-4">
  <div class="row justify-content-center">
    
    <!-- Card: Crear Usuario -->
    <div class="col-6 col-md-3 mb-3">
      <div class="card text-center shadow-sm p-3" data-bs-toggle="modal" data-bs-target="#modalUsuario">
        <div class="card-body">
          <i class="bi bi-person-plus fs-1 text-success"></i>
          <h6 class="mt-2">Crear Usuario</h6>
        </div>
      </div>
    </div>

    <!-- Card: Crear Equipo -->
    <div class="col-6 col-md-3 mb-3">
      <div class="card text-center shadow-sm p-3" data-bs-toggle="modal" data-bs-target="#modalEquipo">
        <div class="card-body">
          <i class="bi bi-pc-display fs-1 text-success"></i>
          <h6 class="mt-2">Crear Equipo</h6>
        </div>
      </div>
    </div>

    <!-- Card: Crear Mantenimiento -->
    <div class="col-6 col-md-3 mb-3">
      <div class="card text-center shadow-sm p-3" data-bs-toggle="modal" data-bs-target="#modalMantenimiento">
        <div class="card-body">
          <i class="bi bi-tools fs-1 text-success"></i>
          <h6 class="mt-2">Crear Mantenimiento</h6>
        </div>
      </div>
    </div>

    <!-- Card: Crear Repuesto -->
    <div class="col-6 col-md-3 mb-3">
      <div class="card text-center shadow-sm p-3" data-bs-toggle="modal" data-bs-target="#modalRepuesto">
        <div class="card-body">
          <i class="bi bi-nut fs-1 text-success"></i>
          <h6 class="mt-2">Crear Repuesto</h6>
        </div>
      </div>
    </div>

  </div>
</div>


  <!-- Modal para Crear Usuario -->
  <div class="modal fade" id="modalUsuario" tabindex="-1" aria-labelledby="modalUsuarioLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header bg-success text-white">
          <h5 class="modal-title" id="modalUsuarioLabel">Crear Usuario</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form @submit.prevent="crearUsuario">
            <div class="mb-3">
              <label class="form-label">Nombre de Usuario</label>
              <input v-model="nuevoUsuario.username" type="text" class="form-control" required>
            </div>
            <div class="mb-3">
              <label class="form-label">Correo Electrónico</label>
              <input v-model="nuevoUsuario.email" type="email" class="form-control" required>
            </div>
            <div class="mb-3">
              <label class="form-label">Contraseña</label>
              <input v-model="nuevoUsuario.password" type="password" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-success w-100">Guardar</button>
          </form>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal para Crear Equipo -->
  <div class="modal fade" id="modalEquipo" tabindex="-1" aria-labelledby="modalEquipoLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header bg-success text-white">
          <h5 class="modal-title" id="modalEquipoLabel">Crear Equipo</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form @submit.prevent="crearEquipo">
            <div class="mb-3">
              <label class="form-label">Nombre del Equipo</label>
              <input v-model="nuevoEquipo.nombre" type="text" class="form-control" required>
            </div>
            <div class="mb-3">
              <label class="form-label">Tipo</label>
              <select v-model="nuevoEquipo.tipo" class="form-select" required>
                <option value="Neumatico">Neumático</option>
                <option value="Hidraulico">Hidráulico</option>
                <option value="Mecanico">Mecánico</option>
                <option value="Electrico">Eléctrico</option>
              </select>
            </div>
            <div class="mb-3">
              <label class="form-label">Descripción</label>
              <textarea v-model="nuevoEquipo.descripcion" class="form-control" required></textarea>
            </div>
            <div class="mb-3">
              <label class="form-label">Fecha de Adquisición</label>
              <input v-model="nuevoEquipo.fecha_adquisicion" type="date" class="form-control" required>
            </div>
            <div class="mb-3">
              <label class="form-label">Ubicación</label>
              <input v-model="nuevoEquipo.ubicacion" type="text" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-success w-100">Guardar</button>
          </form>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal para Crear Mantenimiento -->
  <div class="modal fade" id="modalMantenimiento" tabindex="-1" aria-labelledby="modalMantenimientoLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header bg-success text-white">
          <h5 class="modal-title" id="modalMantenimientoLabel">Crear Mantenimiento</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form @submit.prevent="crearMantenimiento">
            <div class="mb-3">
              <label class="form-label">Equipo</label>
              <select v-model="nuevoMantenimiento.id_equipo" class="form-select" required>
                <option v-for="equipo in equipos" :value="equipo.id_equipo" :key="equipo.id_equipo">
                  {{ equipo.nombre }}
                </option>
              </select>
            </div>
            <div class="mb-3">
              <label class="form-label">Tipo de Mantenimiento</label>
              <select v-model="nuevoMantenimiento.tipo_mantenimiento" class="form-select" required>
                <option value="Correctivo">Correctivo</option>
                <option value="Preventivo">Preventivo</option>
                <option value="Predictivo">Predictivo</option>
              </select>
            </div>
            <div class="mb-3">
              <label class="form-label">Fecha de Realización</label>
              <input v-model="nuevoMantenimiento.fecha_realizacion" type="date" class="form-control" required>
            </div>
            <div class="mb-3">
              <label class="form-label">Observaciones</label>
              <textarea v-model="nuevoMantenimiento.observaciones" class="form-control" required></textarea>
            </div>
            <button type="submit" class="btn btn-success w-100">Guardar</button>
          </form>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal para Crear Repuesto -->
  <div class="modal fade" id="modalRepuesto" tabindex="-1" aria-labelledby="modalRepuestoLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header bg-success text-white">
          <h5 class="modal-title" id="modalRepuestoLabel">Crear Repuesto</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form @submit.prevent="crearRepuesto">
            <div class="mb-3">
              <label class="form-label">Equipo</label>
              <select v-model="nuevoRepuesto.id_equipo" class="form-select" required>
                <option v-for="equipo in equipos" :value="equipo.id_equipo" :key="equipo.id_equipo">
                  {{ equipo.nombre }}
                </option>
              </select>
            </div>
            <div class="mb-3">
              <label class="form-label">Nombre del Repuesto</label>
              <input v-model="nuevoRepuesto.nombre_repuesto" type="text" class="form-control" required>
            </div>
            <div class="mb-3">
              <label class="form-label">Referencia</label>
              <input v-model="nuevoRepuesto.referencia" type="text" class="form-control" required>
            </div>
            <div class="mb-3">
              <label class="form-label">Cantidad</label>
              <input v-model="nuevoRepuesto.cantidad" type="number" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-success w-100">Guardar</button>
          </form>
        </div>
      </div>
    </div>
  </div>

</template>

<script>
export default {
  data() {
    return {
      // Datos para los modales
      nuevoUsuario: {
        username: '',
        email: '',
        password: ''
      },
      nuevoEquipo: {
        nombre: '',
        tipo: '',
        descripcion: '',
        fecha_adquisicion: '',
        ubicacion: ''
      },
      nuevoMantenimiento: {
        id_equipo: '',
        tipo_mantenimiento: '',
        fecha_realizacion: '',
        observaciones: ''
      },
      nuevoRepuesto: {
        id_equipo: '',
        nombre_repuesto: '',
        referencia: '',
        cantidad: 1
      },
      equipos: [], // Equipos para los select
    };
  },
  methods: {
    // Crear Usuario
    async crearUsuario() {
      try {
        // Aquí puedes llamar a tu API para crear el usuario
        console.log(this.nuevoUsuario);
        // Limpiar el formulario después de la creación
        this.nuevoUsuario = { username: '', email: '', password: '' };
        // Cerrar el modal manualmente
        const modal = new bootstrap.Modal(document.getElementById('modalUsuario'));
        modal.hide();
      } catch (error) {
        console.error("Error al crear usuario:", error);
      }
    },

    // Crear Equipo
    async crearEquipo() {
      try {
        // Aquí puedes llamar a tu API para crear el equipo
        console.log(this.nuevoEquipo);
        // Limpiar el formulario después de la creación
        this.nuevoEquipo = { nombre: '', tipo: '', descripcion: '', fecha_adquisicion: '', ubicacion: '' };
        // Cerrar el modal manualmente
        const modal = new bootstrap.Modal(document.getElementById('modalEquipo'));
        modal.hide();
      } catch (error) {
        console.error("Error al crear equipo:", error);
      }
    },

    // Crear Mantenimiento
    async crearMantenimiento() {
      try {
        // Aquí puedes llamar a tu API para crear el mantenimiento
        console.log(this.nuevoMantenimiento);
        // Limpiar el formulario después de la creación
        this.nuevoMantenimiento = { id_equipo: '', tipo_mantenimiento: '', fecha_realizacion: '', observaciones: '' };
        // Cerrar el modal manualmente
        const modal = new bootstrap.Modal(document.getElementById('modalMantenimiento'));
        modal.hide();
      } catch (error) {
        console.error("Error al crear mantenimiento:", error);
      }
    },

    // Crear Repuesto
    async crearRepuesto() {
      try {
        // Aquí puedes llamar a tu API para crear el repuesto
        console.log(this.nuevoRepuesto);
        // Limpiar el formulario después de la creación
        this.nuevoRepuesto = { id_equipo: '', nombre_repuesto: '', referencia: '', cantidad: 1 };
        // Cerrar el modal manualmente
        const modal = new bootstrap.Modal(document.getElementById('modalRepuesto'));
        modal.hide();
      } catch (error) {
        console.error("Error al crear repuesto:", error);
      }
    },

    // Obtener Equipos (simulación)
    obtenerEquipos() {
      // Simulamos la obtención de los equipos desde una base de datos
      this.equipos = [
        { id_equipo: 1, nombre: 'Equipo A' },
        { id_equipo: 2, nombre: 'Equipo B' },
        { id_equipo: 3, nombre: 'Equipo C' }
      ];
    }
  },
  mounted() {
    // Llamar a obtenerEquipos al montar el componente
    this.obtenerEquipos();

  },
    // Método para ir a la vista de Catálogos
    irACatalogos() {
      console.log('Navegando a la vista Catalogos');
      this.$router.push('/catalogos');

  },
  
};
</script>

<style scoped>
/* Estilos adicionales si son necesarios */
</style>
