<template>

<div class="hero">

    <nav class="navBar"> 
       <router-link> About us </router-link> ||
       <router-link v-bind:to="{name:'decks'}"> Decks/Try It Now </router-link> ||
        <router-link :to="{ name: 'register' }">Register/Log In</router-link> ||
    </nav>
</div>


</template>

<script>




export default {
  name: "the-header",
  components: {
      
   
   
  }
  
  

};
</script>


<style>

.hero{
    border: 2px;
    border-color: blue;
    
}
</style>
