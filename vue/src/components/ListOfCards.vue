<template>

<div class= "list-of-cards">

    <div v-for="card in this.$store.state.cards" v-bind:key="card.id">
     {{}}              {{card.front}} /////// {{card.back}}
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
}

},
created() {
    this.getCards();
}

}


</script>

<style>
.topic-list {
  margin: 0 auto;
  max-width: 800px;
}

</style>