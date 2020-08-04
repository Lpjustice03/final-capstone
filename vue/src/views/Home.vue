<template>
  <div class="home">
    <h1>Home</h1>
    <list-of-decks />
    <list-of-cards />
    
  </div>
</template>

<script>

import ListOfCards from '@/components/ListOfCards.vue';
import ListOfDecks from '@/components/ListOfDecks.vue';


export default {
  name: "Home",
  components: {
    ListOfCards,
    ListOfDecks
  }
  
  

};
</script>
