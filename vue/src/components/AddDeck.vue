<template>

<form class="addDeck" v-on:submit="saveDeck">

<label for="name">Deck title </label>
<input type="text" name="name" v-model="deck.deckName" />
<label for="name"> Deck Description </label>
<input type="text" name="name" v-model="deck.description" />

<label for="public"> Deck type </label>
<select class="myList" v-model="deck.deckType">
        <option value="1"> Public </option>
        <option value="2"> Private </option>
</select>

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
                description: '',
                deckType: ''
                
            }
        };
    },
    methods:{
        saveDeck(){
            const newDeck ={
                deckName: this.deck.deckName,
                description: this.deck.description,
                deckType: this.deck.deckType
               
            };
            deckService.addDeck(newDeck)
        }
    }

}
</script>

<style>

</style>