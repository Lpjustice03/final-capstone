<template>
<div>
 <timer/>
<button @click="counter++" :disabled="counter >= cardArray.length - 1">+</button>
  <button @click="counter--" :disabled="counter <= 0">-</button>
  <p>{{cardArray[counter]}}</p>

   
</div>
</template>

<script>

import Timer from "@/components/Timer.vue";
import cardService from "@/services/CardService.js";

export default {
    components:{
        Timer
    },
   data(){
       return{
           counter: 0,
        cardArray: this.getCards
       }
   },
   computed: {
    filterCards() {
        return this.$store.state.cards.filter( card => {
            return card.deckId == this.$route.params.id;
        });
    }
},
methods:{
    getCards() {
        cardService.list().then(response =>{
        this.$store.commit("SET_CARDS", response.data);
        });
}
}
}
</script>

<style>



</style>