<template>
  <div class="p-6">
    <h1 class="text-3xl font-bold text-center mb-8">Magasins</h1>
    
    <!-- Barre de recherche -->
    <div class="mb-6">
      <input 
        v-model="searchQuery"
        type="text"
        placeholder="Rechercher un magasin..."
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

    <!-- Liste des magasins -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
      <div v-for="magasin in filteredMagasins" 
           :key="magasin.id" 
           class="bg-white rounded-lg shadow-lg overflow-hidden">
        <img :src="magasin.images[0]" 
             :alt="magasin.name"
             class="w-full h-48 object-cover">
        
        <div class="p-4">
          <h3 class="text-xl font-bold mb-2">{{ magasin.name }}</h3>
          <p class="text-gray-600 mb-2">{{ magasin.description }}</p>
          
          <div class="flex items-center mb-2">
            <span class="text-yellow-500">★</span>
            <span class="ml-1">{{ magasin.rating }}/5</span>
            <span class="ml-4">{{ magasin.price_range }}</span>
          </div>

          <div class="flex flex-wrap gap-2 mb-4">
            <span v-for="feature in magasin.features" 
                  :key="feature"
                  class="bg-blue-100 text-blue-800 text-xs px-2 py-1 rounded">
              {{ feature }}
            </span>
          </div>

          <button @click="startVirtualTour(magasin.id)"
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
  name: "Magasins",
  setup() {
    const router = useRouter();
    const searchQuery = ref('');
    const priceFilter = ref('');
    const ratingFilter = ref('');

    const filteredMagasins = computed(() => {
      return places.magasins.filter(magasin => {
        const matchesSearch = magasin.name.toLowerCase().includes(searchQuery.value.toLowerCase()) ||
                            magasin.description.toLowerCase().includes(searchQuery.value.toLowerCase());
        const matchesPrice = !priceFilter.value || magasin.price_range === priceFilter.value;
        const matchesRating = !ratingFilter.value || magasin.rating >= parseInt(ratingFilter.value);
        
        return matchesSearch && matchesPrice && matchesRating;
      });
    });

    const startVirtualTour = (magasinId) => {
      router.push(`/virtual-tour/magasin-${magasinId}`);
    };

    return {
      searchQuery,
      priceFilter,
      ratingFilter,
      filteredMagasins,
      startVirtualTour
    };
  }
};
</script>
  