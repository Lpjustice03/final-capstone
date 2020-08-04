<template>

<div class= "list-of-decks">

    <div v-for="deck in this.$store.state.decks" v-bind:key="deck.id" >
    
     <router-link v-bind:to="{name: 'DeckCards', params: {id : deck.id}}">
       <div class="deck"> {{deck.deckName}} </div>
      </router-link>

    </div>

    </div>
 
</template>

<script>

import deckService from "@/services/DeckService.js";

export default {
name: "list-of-decks",
methods:{
    getDecks() {
   deckService.list().then(response =>{
        this.$store.commit("SET_DECKS", response.data);
    });
}

},
created() {
    this.getDecks();
}

}
</script>
<style scoped>

  .deck {
    display: flex;
    flex-direction:column;
    width: 250px;
    height: 195px;
    padding: 40px 25px;
    background-color: #1fbd41;
    border-radius: 7px;
    margin: 15px;
    text-align: center;
    line-height: 27px;
    cursor: pointer;
    position: relative;
    color: #fff;
    font-weight: 600;
    font-size: 20px;
    -webkit-box-shadow: 9px 10px 22px -8px rgba(209,193,209,.5);
    -moz-box-shadow: 9px 10px 22px -8px rgba(209,193,209,.5);
    box-shadow: 9px 10px 22px -8px rgba(209,193,209,.5);
    will-change: transform;
  }

  .list-of-decks{
      display:flex;
      justify-content: center;
      flex-flow: row wrap;
  }
  
</style>