<template>
  <div class="home">

    <div class="header">
    <h1>FlipDeck</h1>
    <h2> Welcome to FlipDeck the coolest study tool around</h2>
    <p> FlipDeck makes simple learning flash cards that let you study anything. Start learning today! Use the ever growing library of decks approved by top educators. Or create your own custom decks! — all for free!</p>
     <router-link  v-bind:to="{name:'decks'}"> Try It Now!</router-link>
    </div>
    <div class="topright">
      <router-link :to="{ name: 'register' }">Need an account?</router-link>
    </div>
    

    
    
    
  </div>
   <!-- <footer> Facebook icon, IG icon, etc... </footer> -->
</template>

<script>




export default {
  name: "Home",
  components: {
    
   
   
  }
  
  

};
</script>

<style scoped>

.home{
  margin: 0;
  padding: 0;
  min-height: 100vh;
  
  background: url(../assets/heroImage.jpg)left / cover no-repeat;
  display: flex;
  
}

 .header {
   font-family: Avenir, Helvetica, Arial, sans-serif;
  text-align: left;
  color: #ffffff;
  margin-top: 300px;
  display: flex;
  align-content:flex-end;
  flex-wrap: wrap;
}











</style>

