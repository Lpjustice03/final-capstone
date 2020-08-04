<template>
  <div class="home">
    <h1>Home</h1>
   <router-link v-bind:to="{name:'cards'}"> Cards
   </router-link>
   <div>
    <router-link :to="{ name: 'register' }">Register/Log In</router-link>
     </div>
  <div>
<router-link v-bind:to="{name:'decks'}"> Decks
</router-link>
  </div>

    
    
    
  </div>
</template>

<script>




export default {
  name: "Home",
  components: {

   
   
  }
  
  

};
</script>
