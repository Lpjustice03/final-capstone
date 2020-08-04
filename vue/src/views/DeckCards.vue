<template>
  <div class="cards">
    <h1>Cards</h1>
  
    <list-of-cards v-bind:deck-id="parseInt($route.params.id)" />
    
  </div>
</template>

<script>

import ListOfCards from '@/components/ListOfCards.vue';

export default {
  name: "DeckCards",
  components: {
    ListOfCards
  }
  
  

};
</script>
