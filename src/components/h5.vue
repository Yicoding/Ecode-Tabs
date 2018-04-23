<template>
  <div>
      <pinch-image :src="src" :min-zoom="1" :max-zoom="2.5"></pinch-image>
  </div>
</template>

<script>
    import pinchImage from 'components/pinchZoom.vue'
    export default {
        data() {
            return {
                src: 'static/logo.png'
            }
        },
        components: {
            pinchImage
        }
    }
</script>

 <style scoped>
    #container {
        position: fixed;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.8);  
        z-index: 10;
    }
 </style>
 
