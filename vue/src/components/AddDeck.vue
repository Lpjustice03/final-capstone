<template>

<form class="addDeck" v-on:submit="saveDeck">

<label for="name">Deck title </label>
<input type="text" name="name" v-model="deck.deckName" />

<div class="actions">
    <button type="submit"> Save 
    </button>
</div>
</form>
</template>

<script>

import deckService from "@/services/DeckService.js";

export default {
    name: "add-deck",
    data() {
        return{
            deck:{
                deckName: '',
                description: 'the',
                
            }
        };
    },
    methods:{
        saveDeck(){
            const newDeck ={
                deckName: this.deck.deckName,
                description: this.deck.description,
               
            };
            deckService.addDeck(newDeck)
        }
    }

}
</script>

<style>

</style>