<template>

<div class= "list-of-cards">

    <div v-for="card in this.$store.state.cards" v-bind:key="card.id" >
          
        
               <div class="card" v-on:click="toggleCard (card)"> {{card.flipped ? card.back : card.front}} </div> 
               
         
           </div> 
           

   
</div>



</template>

<script>

import cardService from "@/services/CardService.js";

export default {
name: "list-of-cards",
methods:{
    getCards() {
    cardService.list().then(response =>{
        this.$store.commit("SET_CARDS", response.data);
    });
},
toggleCard: function(card) {
      card.flipped = !card.flipped;
    },
},
created() {
    this.getCards();
}

}




</script>

<style>
  .card {
    display: flex;
    flex-direction:column;
    width: 250px;
    height: 195px;
    padding: 40px 25px;
    background-color: #51aae5;
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
  .list-of-cards{
      display:flex;
      justify-content: center;
      flex-flow: row wrap;
  }
  
</style>