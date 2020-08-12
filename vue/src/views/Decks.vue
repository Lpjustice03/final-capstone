<template>

  <div class="decks">
    
    
    <h1 class="heroBanner">Decks</h1>
    <div id="backbutton" >
      <h2> GO BACK</h2>
     <router-link to="/">  

     <img src='@/assets/black-arrow.png' />
     </router-link>
    </div>
  
    <add-deck/>
    <!-- <update-deck /> -->
    <list-of-decks />
    
  </div>
</template>

<script>

import ListOfDecks from '@/components/ListOfDecks.vue';
import AddDeck from '@/components/AddDeck.vue';
// import UpdateDeck from '@/components/UpdateDeck.vue';

export default {
  name: "Decks",
  components: {
    ListOfDecks,
    AddDeck,
    // UpdateDeck
    
  }
  
  

};
</script>
<style scoped>

img{
  background-size: cover;
  height: 50px;
  margin:0px; 
}
h2{
  color: black;
  font-family: "Permanent Marker";
  text-shadow: 2px 2px #6e6e6e;
}


.decks{
  background-color: #DCC7AA;
  margin-top: -34px;
  color: #F7C331

}
  
h1{
  font-family: Arial, Helvetica, sans-serif;
  font-size: 50px;
  color: #ffffff;
  text-align: center;
  text-shadow: 2px 2px #6e6e6e;
 
}


</style>