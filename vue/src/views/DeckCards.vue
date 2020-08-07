<template>
  <div class="cards">
    <add-card />
    <list-of-cards v-bind:deck-id="parseInt($route.params.id)" />
    
  </div>
</template>

<script>

import ListOfCards from '@/components/ListOfCards.vue';
import AddCard from '@/components/AddCard.vue';

export default {
  name: "DeckCards",
  components: {
    ListOfCards,
    AddCard
  }
  
  

};
</script>

