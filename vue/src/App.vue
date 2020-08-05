<template>
  <div id="app">
    <div id="nav">
      <!-- <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link> -->
      <!-- <the-header></the-header> -->
    </div>
    <router-view />
  </div>
</template>

<script>


// import TheHeader from "@/components/TheHeader.vue"

export default {
  name: "App",
  components: {
    // TheHeader
   
   
  }
  
  

};
</script>