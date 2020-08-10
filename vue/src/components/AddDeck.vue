<template>
<div class="deckButton">
  <button type="submit" v-on:click="addForm = true" v-show = "!addForm"> Add A Deck </button>
   <form class="addDeck" v-on:submit="saveDeck" v-show = "addForm">
   <label for="name">Deck title: </label>
   <input type="text" name="name" v-model="deck.deckName" />
   <label for="name"> Deck Description: </label>
   <input type="text" name="name" v-model="deck.description" />
   <label for="public"> Deck type: </label>
   <select class="myList" v-model="deck.deckType">
        <option value="1"> Public </option>
        <option value="2"> Private </option>
   </select>
   <div class="actions">
    <button id="save" type="submit"> Save </button>
    <input id="cancel" type="button" value="Cancel" v-on:click.prevent="resetForm" />
   </div>
  </form>
</div>
</template>

<script>

import deckService from "@/services/DeckService.js";

export default {
    name: "add-deck",
    data() {
        return{
           addForm: false,
            
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
        },
        resetForm() {
      this.addForm = false;
     
      this.deck = {};
    }
    }

}
</script>

<style>

input[type=text] {
    border-radius: 5px;
}
.actions {
display: flex;
justify-content: center;
}

.myList {
    border-radius: 5px;
}



#save {
    margin: 5%;
    width: 30%;
}

#cancel {
    width: 30%;
    background-color: #351f33;
    border-radius: 5px;
    color: white;
    border: 1px solid #959717;
    font-size: 14px;
    font-weight: 700;
    margin:5%;
}

#cancel:hover {
    background-color: #828f12;
}

label {
    font-size: 20px;
    color: white;
}

button{
    border-radius: 5px;
    border: 1px solid #959717;
    background-color: #F7882F;
    padding: 8px 15px;
    outline: none;
    font-size: 14px;
    font-weight: 700;
    color: rgb(255, 255, 255);
    cursor: pointer;
    transition: all 0.3s ease;
     margin-right: 10px;
    margin-left: 10px;
    margin-bottom: 25px;
 
  }
  
  button:hover{
    background-color: #828f12;
    border: 1px solid #8984cb
  }
   .deckButton{
       background-color: #DCC7AA;
      justify-content: center;
      display:flex;
  }

</style>