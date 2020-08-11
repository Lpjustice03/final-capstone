<template>
  <div class="cards">
    <h1 class="title">Cards</h1>
    <timer />
    <add-card />
    <list-of-cards />
    

    

  </div>
</template>

<script>

import ListOfCards from '@/components/ListOfCards.vue';
import AddCard from '@/components/AddCard.vue';
 import Timer from '@/components/Timer.vue';

export default {
  name: "Cards",

  components: {
    ListOfCards,
      AddCard,
       Timer
    
  }



  
  

};
</script>
<style scoped>
.cards {
  background-color: #DCC7AA; 
  margin-top: -34px;
}

.title {
  font-size: 50px;
  text-align: center;
  color: #53224f;
  background-color: #DCC7AA ;
}


</style>
