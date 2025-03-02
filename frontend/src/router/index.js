import { createRouter, createWebHistory } from 'vue-router';
import Login from '@/components/Login.vue';
import Dashboard from '@/components/Dashboard.vue';
import Catalogos from '@/components/Catalogos.vue';

const routes = [
  { path: '/', redirect: '/login' },  // Redirige a login al entrar en la raíz
  { 
    path: '/login', 
    component: Login,
    name: 'login',  // Asegúrate de darle un nombre a la ruta
    meta: { title: 'Login - Inicio' } // Establecer título de la pestaña
  },
  { 
    path: '/dashboard', 
    component: Dashboard, 
    meta: { requiresAuth: true, title: 'Dashboard' }  // Cambiar el título aquí
  },
  { 
    path: '/catalogos', 
    component: Catalogos, 
    meta: { requiresAuth: true, title: 'Catalogos' }  // Cambiar el título aquí
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

// Cambiar dinámicamente el título de la pestaña según la ruta
router.beforeEach((to, from, next) => {
  document.title = to.meta.title || 'Mi Aplicación'; // Si no tiene title, usa un valor por defecto
  
  const token = localStorage.getItem('token');  // Obtener el token

  // Si la ruta requiere autenticación y no tenemos token, redirigir al login
  if (to.meta.requiresAuth && !token) {
    next('/login');
  } else {
    next();  // Si tiene token o no requiere autenticación, continua con la navegación
  }
});

export default router;
