import { createRouter, createWebHistory } from 'vue-router';
import Login from '@/components/Login.vue';
import HelloWorld from '@/components/HelloWorld.vue';

const routes = [
  { path: '/', redirect: '/login' },
  { 
    path: '/login', 
    component: Login,
    meta: { title: 'Login - Inicio' } // 🔹 Establecer título de la pestaña
  },
  { 
    path: '/dashboard', 
    component: HelloWorld, 
    meta: { requiresAuth: true, title: 'Dashboard' }  // 🔹 Cambiar el título aquí
  }
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

// 🔹 Cambiar dinámicamente el título de la pestaña según la ruta
router.beforeEach((to, from, next) => {
  document.title = to.meta.title || 'Mi Aplicación'; // Si no tiene title, usa un valor por defecto
  
  const token = localStorage.getItem('token');

  if (to.meta.requiresAuth && !token) {
    next('/login');  // 🔹 Si no está autenticado, enviarlo al login
  } else {
    next();  // 🔹 Continuar con la navegación
  }
});

export default router;
