<template>
  <div class="cards">
    <h1>Cards</h1>
  
    <list-of-cards v-bind:deck-id="parseInt($route.params.id)" />
    <add-card />
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
