<template>
  <div class="cards">
    <h1 class="title"> {{$store.state.user.username}}'s Cards </h1>


<div class="headingRow">
    <div class="timer">
      <timer />
    </div>
    <div class="add">
      <add-card />
      </div>
      
</div>
 <div id="backbutton" >
      <h2> GO BACK</h2>
     <router-link to="/decks">  

     <img src='@/assets/black-arrow.png' />
     </router-link>
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

  data(){
    return{
      cardsName: this.$route.params.id,
      deckName: this.$store.state.deckTitle
    }
  },

  components: {
    ListOfCards,
      AddCard,
       Timer    
  },




  
  

};
</script>
<style scoped>

img{
  background-size: cover;
  height: 50px;
  margin:0px; 
}
h2{
  color: black;
 font-family: Arial, Helvetica, sans-serif;
  text-shadow: 1px 1px #6e6e6e;
}

#backbutton{
 background-color: #DCC7AA;
}


.cards {
  background-color: rgb(214, 182, 137);
  margin-top: -34px;
}

.title {
  font-size: 50px;
  text-align: center;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 50px;
  color: #ffffff;
  text-align: center;
  text-shadow: 2px 2px #6e6e6e;
}

.headingRow{
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}

.timer {
  width: 170%;
}

.add {
  width: 15%;
}


</style>
