
<template>
   <div class="container">
<div class="card">
<h1 id="frontQuestion">{{this.$store.state.activeCard.front}}</h1>
<p>Click below for answer:</p>
<button id="answerButton" >Answer</button>
</div>
</div>
</template>

<script>

import cardService from "../services/CardService.js";

export default {
    name: "card-details",
    props: {
        cardId: Number
    },
    created(){
        cardService.get(this.cardId)
    }

}
</script>

<style>



</style>