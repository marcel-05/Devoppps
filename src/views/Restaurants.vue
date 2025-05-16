<template>
  <div class="p-6">
    <h1 class="text-3xl font-bold text-center mb-8">Restaurants</h1>
    
    <!-- Barre de recherche -->
    <div class="mb-6">
      <input 
        v-model="searchQuery"
        type="text"
        placeholder="Rechercher un restaurant..."
        class="w-full p-2 border rounded-lg"
      >
    </div>

    <!-- Filtres -->
    <div class="flex gap-4 mb-6">
      <select v-model="priceFilter" class="p-2 border rounded-lg">
        <option value="">Prix</option>
        <option value="€">€</option>
        <option value="€€">€€</option>
        <option value="€€€">€€€</option>
      </select>
      
      <select v-model="ratingFilter" class="p-2 border rounded-lg">
        <option value="">Note</option>
        <option value="4">4+ étoiles</option>
        <option value="3">3+ étoiles</option>
      </select>
    </div>

    <!-- Liste des restaurants -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
      <div v-for="restaurant in filteredRestaurants" 
           :key="restaurant.id" 
           class="bg-white rounded-lg shadow-lg overflow-hidden">
        <img :src="restaurant.images[0]" 
             :alt="restaurant.name"
             class="w-full h-48 object-cover">
        
        <div class="p-4">
          <h3 class="text-xl font-bold mb-2">{{ restaurant.name }}</h3>
          <p class="text-gray-600 mb-2">{{ restaurant.description }}</p>
          
          <div class="flex items-center mb-2">
            <span class="text-yellow-500">★</span>
            <span class="ml-1">{{ restaurant.rating }}/5</span>
            <span class="ml-4">{{ restaurant.price_range }}</span>
          </div>

          <div class="flex flex-wrap gap-2 mb-4">
            <span v-for="feature in restaurant.features" 
                  :key="feature"
                  class="bg-blue-100 text-blue-800 text-xs px-2 py-1 rounded">
              {{ feature }}
            </span>
          </div>

          <button @click="startVirtualTour(restaurant.id)"
                  class="bg-blue-600 text-white px-4 py-2 rounded-lg w-full hover:bg-blue-700 transition">
            Démarrer la visite virtuelle
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { ref, computed } from 'vue';
import { places } from '@/data/places';
import { useRouter } from 'vue-router';

export default {
  name: "Restaurants",
  setup() {
    const searchQuery = ref('');
    const priceFilter = ref('');
    const ratingFilter = ref('');
    const router = useRouter();

    const filteredRestaurants = computed(() => {
      return places.restaurants.filter(restaurant => {
        const matchesSearch = restaurant.name.toLowerCase().includes(searchQuery.value.toLowerCase()) ||
                            restaurant.description.toLowerCase().includes(searchQuery.value.toLowerCase());
        const matchesPrice = !priceFilter.value || restaurant.price_range === priceFilter.value;
        const matchesRating = !ratingFilter.value || restaurant.rating >= parseInt(ratingFilter.value);
        
        return matchesSearch && matchesPrice && matchesRating;
      });
    });

    const startVirtualTour = (restaurantId) => {
      router.push(`/virtual-tour/restaurant-${restaurantId}`);
    };

    return {
      searchQuery,
      priceFilter,
      ratingFilter,
      filteredRestaurants,
      startVirtualTour
    };
  }
};
</script>
  