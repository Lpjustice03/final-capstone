<template>
<div class="header">
    <div class="deckButton">
 
 <button type="submit" v-on:click="updateDeck()"> Update Deck </button>
  <button type="submit" v-on:click="addDeck()"> Add A Deck </button>
  </div>
<div class= "list-of-decks">

    <div v-for="deck in this.$store.state.decks" v-bind:key="deck.id" >
   
    
     <router-link v-bind:to="{name: 'DeckCards', params: {id : deck.id}}">
       <div class="deck"> {{deck.deckName}} </div>
      </router-link>

    </div>

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
updateDeck(){

},
addDeck(){

},
created() {
    this.getDecks();
}

}
</script>
<style scoped>
.header {
     display:flex;
     flex-direction: column; 
  }
.submit{
  display: flex;
  justify-content: center;
  
}
.deck:hover{
  transform: scale(1.2);
}
  .deck {
    display: flex;
    flex-direction:column;
    width: 250px;
    height: 300px;
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
    font-size: 30px;
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
  button{
    border-radius: 5px;
    border: 1px solid #cb84b0;
    background-color: #8984cb;
    padding: 8px 15px;
    outline: none;
    font-size: 14px;
    font-weight: 700;
    color: #fff;
    cursor: pointer;
    transition: all 0.3s ease;
     margin-right: 10px;
    margin-left: 10px;
    margin-bottom: 25px;
 
  }
  
  button:hover{
    background-color: #70a66f;
  }
   .deckButton{
      justify-content: center;
      display:flex;
  }
 @media screen and (max-width: width 600px)    {
     .list-of-decks{
         display:flex;
      justify-content: center;
      flex-flow: row wrap;

     }
 }
  
</style>