<template>
  <div class="cards">
    <h1 class="title">Cards</h1>
    <add-card />
    <list-of-cards />
    

    
  </div>
</template>

<script>

import ListOfCards from '@/components/ListOfCards.vue';
import AddCard from '@/components/AddDeck.vue';

export default {
  name: "Cards",
  components: {
    ListOfCards,
      AddCard
    
  }

  
  

};
</script>
<style scoped>
.cards {
  background-color: rgb(209, 196, 129);
}

.title {
  font-size: 50px;
  text-align: center;
  color: #53224f;
  background-color: rgb(209, 196, 129);
}
</style>
