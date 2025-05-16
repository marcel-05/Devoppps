import { createRouter, createWebHistory } from 'vue-router';
import Accueil from '../views/Accueil.vue';
import Restaurants from '@/views/Restaurants.vue';
import Magasins from '@/views/Magasins.vue';
import Attractions from '@/views/Attractions.vue';
import Bars from '@/views/Bars.vue';
import Evenements from '@/views/Evenements.vue';
import SallesDeJeux from '@/views/SallesDeJeux.vue';
import VirtualTour from '@/components/VirtualTour.vue';

const routes = [
  {
    path: '/',
    name: 'accueil',
    component: Accueil, // Utilisation correcte du composant
  },
  { path: '/restaurants', name: 'Restaurants', component: Restaurants },
  { path: '/magasins', name: 'Magasins', component: Magasins },
  { path: '/attractions', name: 'Attractions', component: Attractions },
  { path: '/bars', name: 'Bars', component: Bars },
  { path: '/evenements', name: 'Evenements', component: Evenements },
  { path: '/sallesdejeux', name: 'SallesDejeux', component: SallesDeJeux },
  {
    path: '/virtual-tour/:placeId',
    name: 'VirtualTour',
    component: VirtualTour,
    props: true
  }
];

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL), // Utilisation de l'environnement pour la base URL
  routes,
});

export default router;
