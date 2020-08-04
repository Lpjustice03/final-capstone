<template>

<div class= "list-of-decks">

    <div v-for="deck in this.$store.state.decks" v-bind:key="deck.id" class="deck">
      {{deck.deckName}}
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

</style>