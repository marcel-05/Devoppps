<template>
  <div>
    <!-- Hero Section -->
    <div class="relative bg-gray-900 text-white py-24">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
        <h1 class="text-4xl md:text-6xl font-bold mb-6">Explorez le Monde Virtuellement</h1>
        <p class="text-xl md:text-2xl mb-8">Découvrez des lieux uniques depuis chez vous grâce à nos visites virtuelles immersives</p>
        <div class="flex justify-center gap-4">
          <a href="#categories" class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-6 rounded-lg transition">
            Commencer l'exploration
          </a>
        </div>
      </div>
    </div>

    <!-- Comment ça marche -->
    <div class="py-16 bg-gray-50">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <h2 class="text-3xl font-bold text-center mb-12">Comment ça marche ?</h2>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
          <div class="text-center p-6">
            <div class="bg-blue-100 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">
              <span class="text-2xl">1</span>
            </div>
            <h3 class="text-xl font-semibold mb-2">Choisissez une catégorie</h3>
            <p class="text-gray-600">Sélectionnez le type de lieu que vous souhaitez visiter</p>
          </div>
          <div class="text-center p-6">
            <div class="bg-blue-100 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">
              <span class="text-2xl">2</span>
            </div>
            <h3 class="text-xl font-semibold mb-2">Explorez les détails</h3>
            <p class="text-gray-600">Découvrez les informations et photos de chaque lieu</p>
          </div>
          <div class="text-center p-6">
            <div class="bg-blue-100 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">
              <span class="text-2xl">3</span>
            </div>
            <h3 class="text-xl font-semibold mb-2">Visite virtuelle</h3>
            <p class="text-gray-600">Lancez la visite 3D interactive et explorez l'espace</p>
          </div>
        </div>
      </div>
    </div>

    <!-- Catégories -->
    <div id="categories" class="p-8">
      <h2 class="text-2xl font-bold text-center mb-6">Catégories</h2>
      <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-6">
        <div class="bg-white shadow-md rounded-lg overflow-hidden transform transition duration-300 hover:shadow-lg hover:scale-105">
          <a href="/restaurants" class="block">
            <img src="https://toohotel.com/wp-content/uploads/2022/09/TOO_restaurant_Panoramique_vue_Paris_Seine_Tour_Eiffel_2.jpg" alt="Restaurants" class="w-full h-32 object-cover transition-transform duration-300 hover:scale-110">
            <div class="p-4 text-center">
              <span class="text-blue-600 font-semibold hover:underline">Restaurants</span>
            </div>
          </a>
        </div>
        <div class="bg-white shadow-md rounded-lg overflow-hidden transform transition duration-300 hover:shadow-lg hover:scale-105">
          <a href="bars" class="block">
            <img src="https://i.pinimg.com/originals/ac/4e/28/ac4e28af117cfc201c65fcc1d3851b83.jpg" alt="Bars" class="w-full h-32 object-cover transition-transform duration-300 hover:scale-110">
            <div class="p-4 text-center">
              <span class="text-blue-600 font-semibold hover:underline">Bars</span>
            </div>
          </a>
        </div>
        <div class="bg-white shadow-md rounded-lg overflow-hidden transform transition duration-300 hover:shadow-lg hover:scale-105">
          <a href="sallesdejeux" class="block">
            <img src="https://www.sybelles.ski/wp-content/uploads/2023/09/Hero-Salle-de-jeux.webp" alt="Salles de jeux" class="w-full h-32 object-cover transition-transform duration-300 hover:scale-110">
            <div class="p-4 text-center">
              <span class="text-blue-600 font-semibold hover:underline">Salles de jeux</span>
            </div>
          </a>
        </div>
        <div class="bg-white shadow-md rounded-lg overflow-hidden transform transition duration-300 hover:shadow-lg hover:scale-105">
          <a href="attractions" class="block">
            <img src="https://expatexperiment.com/wp-content/uploads/2016/09/CALG6427-1024x683.jpg" alt="Attractions touristiques" class="w-full h-32 object-cover transition-transform duration-300 hover:scale-110">
            <div class="p-4 text-center">
              <span class="text-blue-600 font-semibold hover:underline">Attractions touristiques</span>
            </div>
          </a>
        </div>
        <div class="bg-white shadow-md rounded-lg overflow-hidden transform transition duration-300 hover:shadow-lg hover:scale-105">
          <a href="evenement" class="block">
            <img src="https://les-seminaires.eu/wp-content/uploads/2019/04/organisation-evenement-entreprise-735x400.png" alt="Événements" class="w-full h-32 object-cover transition-transform duration-300 hover:scale-110">
            <div class="p-4 text-center">
              <span class="text-blue-600 font-semibold hover:underline">Événements</span>
            </div>
          </a>
        </div>
        <div class="bg-white shadow-md rounded-lg overflow-hidden transform transition duration-300 hover:shadow-lg hover:scale-105">
          <a href="magasins" class="block">
            <img src="https://media.lesechos.com/api/v1/images/view/5c0693628fe56f5a7d327c6b/1280x720/ech22287092-1.jpg" alt="Magasins" class="w-full h-32 object-cover transition-transform duration-300 hover:scale-110">
            <div class="p-4 text-center">
              <span class="text-blue-600 font-semibold hover:underline">Magasins</span>
            </div>
          </a>
        </div>
      </div>
    </div>

    <!-- Section Avantages -->
    <div class="bg-white py-16">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <h2 class="text-3xl font-bold text-center mb-12">Pourquoi choisir Virtual-Tour ?</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
          <div class="text-center">
            <div class="mb-4">
              <span class="text-4xl">🎯</span>
            </div>
            <h3 class="text-xl font-semibold mb-2">Précision</h3>
            <p class="text-gray-600">Visites détaillées et fidèles à la réalité</p>
          </div>
          <div class="text-center">
            <div class="mb-4">
              <span class="text-4xl">🚀</span>
            </div>
            <h3 class="text-xl font-semibold mb-2">Rapidité</h3>
            <p class="text-gray-600">Accès instantané à tous les lieux</p>
          </div>
          <div class="text-center">
            <div class="mb-4">
              <span class="text-4xl">🎮</span>
            </div>
            <h3 class="text-xl font-semibold mb-2">Interactivité</h3>
            <p class="text-gray-600">Navigation intuitive en 3D</p>
          </div>
          <div class="text-center">
            <div class="mb-4">
              <span class="text-4xl">📱</span>
            </div>
            <h3 class="text-xl font-semibold mb-2">Multi-support</h3>
            <p class="text-gray-600">Accessible sur tous vos appareils</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Accueil"
};
</script>

<style scoped>
.hero-pattern {
  background-color: #1a365d;
  background-image: radial-gradient(circle at 1px 1px, rgba(255, 255, 255, 0.15) 1px, transparent 0);
  background-size: 40px 40px;
}
</style>
