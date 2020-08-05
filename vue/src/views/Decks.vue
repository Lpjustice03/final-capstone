<template>
  <div class="decks">
    <h1 class="heroBanner">Decks</h1>
  
    <list-of-decks />
    
  </div>
</template>

<script>

import ListOfDecks from '@/components/ListOfDecks.vue';

export default {
  name: "Decks",
  components: {
    ListOfDecks
    
  }
  
  

};
</script>
<style scoped>
.heroBanner {
  text-align: center;
}
</style>