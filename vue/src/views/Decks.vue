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
  background-color: rgb(209, 196, 129);
}
.heroBanner {
  font-size: 50px;
  text-align: center;
  color: #53224f;
  background-color: rgb(209, 196, 129);
}
</style>