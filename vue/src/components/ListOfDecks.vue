<template>
<div class="header">
    
 
 
<div class= "list-of-decks">

    <div v-for="deck in this.$store.state.decks" v-bind:key="deck.id" >
   
    
     <router-link v-bind:to="{name: 'DeckCards', params: {id : deck.id}}">
       <div class="deck"> {{deck.deckName}} 
          <p> {{deck.description}} </p>
       </div>
      
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
  transform: scale(1.1);
}
  .deck {
    display: flex;
    flex-direction:column;
    width: 250px;
    height: 300px;
    padding: 40px 25px;
    background-color: rgb(102, 172, 117);
    border-radius: 7px;
    margin: 15px;
    text-align: center;
    line-height: 27px;
    cursor: pointer;
    position: relative;
    color: #fff;
    font-weight: 300;
    font-size: 35px;
    -webkit-box-shadow: 9px 10px 22px -8px rgba(33, 88, 40, 0.774);
    -moz-box-shadow: 9px 10px 22px -8px rgba(33, 88, 40, 0.774);
    box-shadow: 9px 10px 22px -8px rgba(33, 88, 40, 0.774);
    will-change: transform;
    border-style: outset;
    text-decoration: none;
  }

  p {
    font-size: 20px;
  }

  .list-of-decks{
      display:flex;
      justify-content: center;
      flex-flow: row wrap;

  }
  
 @media screen and (max-width: width 600px)    {
     .list-of-decks{
         display:flex;
      justify-content: center;
      flex-flow: row wrap;

     }
 }
  
</style>