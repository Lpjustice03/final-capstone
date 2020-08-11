<template>
  <div class="decks">
    <h1 class="heroBanner">Decks</h1>
  
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
 
}


</style>