<template>
  <div class="cards">
    <h1 class="title"> {{this.$store.state.deckTitle}}</h1>


<div class="headingRow">
    <div class="timer">
      <timer />
    </div>
    <div class="add">
      <add-card />
      </div>
</div>
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
  background-color: rgb(214, 182, 137);
  margin-top: -34px;
}

.title {
  font-size: 50px;
  text-align: center;
  color: white;
  background-color: rgb(214, 182, 137);
}

/* .headingRow{
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}

.timer {
  width: 170%;
}

.add {
  width: 15%;
} */


</style>
