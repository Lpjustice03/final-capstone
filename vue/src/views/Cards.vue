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
      cardsName: this.$route.params.id
    }
  },

  components: {
    ListOfCards,
      AddCard,
       Timer    
  }




  
  

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
  font-family: "Permanent Marker";
}

.backbutton{
 display: flex;
 
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
