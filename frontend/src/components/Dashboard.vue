<template>
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
      crearUsuario() {
        // Lógica para crear un usuario
      },
      crearEquipo() {
        // Lógica para crear un equipo
      },
      crearMantenimiento() {
        // Lógica para crear un mantenimiento
      },
      crearRepuesto() {
        // Lógica para crear un repuesto
      },
      obtenerEquipos() {
        // Método para obtener los equipos de la base de datos
      }
    },
    mounted() {
      this.obtenerEquipos();
    }
  };
  </script>
  