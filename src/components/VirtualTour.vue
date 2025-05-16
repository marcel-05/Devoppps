<template>
  <div class="virtual-tour-container" ref="container">
    <div v-if="loading" class="loading-overlay">
      <span class="loading-text">Chargement de la visite virtuelle...</span>
    </div>
    <div class="location-info">
      <h2>{{ locationName }}</h2>
      <p>{{ locationDescription }}</p>
    </div>
    <button @click="goBack" class="back-button">
      Retour
    </button>
  </div>
</template>

<script>
import { onMounted, onUnmounted, ref, computed } from 'vue';
import * as THREE from 'three';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls';
import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader';
import { useRouter } from 'vue-router';
import { places } from '@/data/places';

export default {
  name: 'VirtualTour',
  props: {
    placeId: {
      type: String,
      required: true
    }
  },
  setup(props) {
    const container = ref(null);
    const loading = ref(true);
    const router = useRouter();
    let scene, camera, renderer, controls;

    // Extraire les informations du lieu à partir de l'ID
    const locationInfo = computed(() => {
      const [type, id] = props.placeId.split('-');
      const category = type.replace('restaurant', 'restaurants'); // Gérer le pluriel
      return places[category]?.find(place => place.id === parseInt(id)) || null;
    });

    const locationName = computed(() => locationInfo.value?.name || 'Visite Virtuelle');
    const locationDescription = computed(() => locationInfo.value?.description || '');

    const loadModel = () => {
      const loader = new GLTFLoader();
      
      loader.load(
        '/images/beach_restaurant.glb',
        (gltf) => {
          scene.add(gltf.scene);
          
          // Ajuster la caméra pour voir tout le modèle
          const box = new THREE.Box3().setFromObject(gltf.scene);
          const center = box.getCenter(new THREE.Vector3());
          const size = box.getSize(new THREE.Vector3());
          
          const maxDim = Math.max(size.x, size.y, size.z);
          const fov = camera.fov * (Math.PI / 180);
          let cameraZ = Math.abs(maxDim / 2 / Math.tan(fov / 2));
          
          camera.position.set(center.x, center.y + 2, center.z + cameraZ * 1.5);
          camera.lookAt(center);
          
          controls.target.copy(center);
          controls.minDistance = maxDim / 4;
          controls.maxDistance = maxDim * 2;
          controls.update();
          
          loading.value = false;
        },
        (progress) => {
          console.log('Chargement:', (progress.loaded / progress.total * 100) + '%');
        },
        (error) => {
          console.error('Erreur lors du chargement du modèle:', error);
          loading.value = false;
        }
      );
    };

    const init = () => {
      scene = new THREE.Scene();
      scene.background = new THREE.Color(0xf0f0f0);
      
      // Ajout de lumières
      const ambientLight = new THREE.AmbientLight(0xffffff, 0.5);
      scene.add(ambientLight);
      
      const directionalLight = new THREE.DirectionalLight(0xffffff, 1);
      directionalLight.position.set(5, 5, 5);
      scene.add(directionalLight);

      camera = new THREE.PerspectiveCamera(
        75,
        window.innerWidth / window.innerHeight,
        0.1,
        1000
      );

      renderer = new THREE.WebGLRenderer({ antialias: true });
      renderer.setPixelRatio(window.devicePixelRatio);
      renderer.setSize(window.innerWidth, window.innerHeight);
      renderer.shadowMap.enabled = true;
      container.value.appendChild(renderer.domElement);

      controls = new OrbitControls(camera, renderer.domElement);
      controls.enableDamping = true;
      controls.dampingFactor = 0.05;

      loadModel();

      const handleResize = () => {
        camera.aspect = window.innerWidth / window.innerHeight;
        camera.updateProjectionMatrix();
        renderer.setSize(window.innerWidth, window.innerHeight);
      };
      window.addEventListener('resize', handleResize);

      const animate = () => {
        requestAnimationFrame(animate);
        controls.update();
        renderer.render(scene, camera);
      };
      animate();
    };

    const goBack = () => {
      router.back();
    };

    onMounted(() => {
      init();
    });

    onUnmounted(() => {
      if (renderer) {
        renderer.dispose();
      }
      if (scene) {
        scene.traverse((object) => {
          if (object.material) {
            object.material.dispose();
          }
          if (object.geometry) {
            object.geometry.dispose();
          }
        });
      }
      window.removeEventListener('resize', handleResize);
    });

    return {
      container,
      loading,
      goBack,
      locationName,
      locationDescription
    };
  }
};
</script>

<style scoped>
.virtual-tour-container {
  width: 100vw;
  height: 100vh;
  position: fixed;
  top: 0;
  left: 0;
  background: #000;
}

.loading-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  background: rgba(0, 0, 0, 0.8);
  color: white;
  font-size: 1.2rem;
  z-index: 10;
}

.loading-text {
  padding: 1rem 2rem;
  background: rgba(0, 0, 0, 0.5);
  border-radius: 0.5rem;
}

.back-button {
  position: absolute;
  top: 20px;
  left: 20px;
  padding: 0.5rem 1rem;
  background: rgba(255, 255, 255, 0.9);
  border: none;
  border-radius: 0.5rem;
  cursor: pointer;
  z-index: 10;
  transition: background-color 0.3s;
}

.back-button:hover {
  background: white;
}

.location-info {
  position: absolute;
  top: 20px;
  right: 20px;
  background: rgba(255, 255, 255, 0.9);
  padding: 1rem;
  border-radius: 0.5rem;
  max-width: 300px;
  z-index: 10;
}

.location-info h2 {
  font-size: 1.2rem;
  font-weight: bold;
  margin-bottom: 0.5rem;
}

.location-info p {
  font-size: 0.9rem;
  color: #666;
}
</style> 