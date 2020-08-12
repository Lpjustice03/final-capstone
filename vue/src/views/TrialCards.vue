<template>
<div class="trialCards">
    <h1 class="title"> {{this.$store.state.deckTitle}}</h1>
    <timer />
    <div class="cardsBackground">
        <div id="backbutton" >
      <h2> GO BACK</h2>
     <router-link to="/decks/trial">  

     <img src='@/assets/black-arrow.png' />
     </router-link>
    </div>
<card-trial v-bind:deck-id="parseInt($route.params.id)" />
</div>
<div class="button">
<router-link class="moreDecks" id="decks" tag="button" v-bind:to="{name:'TrialPage'}"> Try another deck! </router-link> 
</div>
</div>
  
</template>

<script>

import CardTrial from '@/components/CardTrial.vue';
import Timer from '@/components/Timer.vue';

export default {
    name: "TrialCards",
    components: {
    CardTrial,
    Timer

    }

}
</script>

<style>

img{
  background-size: cover;
  height: 50px;
  margin:0px; 
}
h2{
  color: black;
  font-family: "Permanent Marker";
  text-shadow: 2px 2px #6e6e6e;
}



.trialCards {
  background-color: rgb(214, 182, 137);
  margin-top: -34px;

}

.title {
  font-size: 50px;
  text-align: center;
  color: white;
  background-color: rgb(214, 182, 137);
}

.cardsBackground{
    background-color: #DCC7AA;
}

.button{
    background-color: #DCC7AA;
    display: flex;
    justify-content: flex-end;
}

.moreDecks{
    background-color: #F7882F;
    color: #F7C331;
    height: 50px;
}

.moreDecks:hover{
    background-color: #F7C331;
    color: #F7882F;
}

</style>