<template>
  <div class="decks">
    <h1 class="heroBanner">Decks</h1>
  
    <add-deck/>
    <list-of-decks />
    
  </div>
</template>

<script>

import ListOfDecks from '@/components/ListOfDecks.vue';
import AddDeck from '@/components/AddDeck.vue';

export default {
  name: "Decks",
  components: {
    ListOfDecks,
    AddDeck
    
  }
  
  

};
</script>
<style scoped>
.heroBanner {
  text-align: center;
}
</style>