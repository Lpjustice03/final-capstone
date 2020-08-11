<template>

<div class= "list-of-decks">
  

   <div class="deckButton">
    
          
        <form class="listofdecks" v-on:submit="updateDeck" v-show = "updateForm">
        <div>
            <label for="deckName">Name of Deck </label>
              <input type="text" name="deckName" v-model="update.deckName" />
            <label for="description"> Description: </label>
              <input type="text" name="description" v-model="update.description"/>
            
              
              <select v-model="update.deckType">
              <option value="1"> Public </option>
                <option value="2"> Private </option>
                </select> 
             <!-- <select v-model="update.id">
                <option v-for="deck in this.$store.state.decks" v-bind:key="deck.id" v-bind:value="deck.id"> {{deck.deckName}} </option>
            </select>  -->

        </div>
        <!-- <select v-model="update.deckType">
<option value="1"> Public </option>
<option value="2"> Private </option>
</select> -->
    
   
    <div class="actions">
      <button id="save" type="submit"> Save</button>
      <input id="cancel" type="button" value="Cancel" v-on:click.prevent="resetForm" />
      
      </div>
      </form>
      </div>
<div v-for="deck in this.$store.state.decks" v-bind:key="deck.id" >
<router-link id="link" v-bind:to="{name: 'DeckCards', params: {id : deck.id}}">
<div class="deck"> {{deck.deckName}}
<p> {{deck.description}} </p>
</div>
</router-link>

 <div class="updeleteButtons"> 
        <button class="updateButton" type="submit" v-on:click="update1(deck)"  v-show = "!updateForm"> Update Deck </button>
        <button id="delete" type="submit" v-on:click="deleteDeck(deck)"> DELETE </button>
        </div>

</div>
</div>

</template>

<script>

import deckService from "@/services/DeckService.js";

export default {
name: "list-of-decks",

data() {
return{
    updateForm: false, 
update:{

        deckName: '',
        description: '',
        deckType: '',
        deckId: ''
    }
    };

},

methods:{
getDecks() {
deckService.list().then(response =>{
this.$store.commit("SET_DECKS", response.data);
});
},

update1(deck){
  this.updateForm = true;
  this.update.deckId = deck.id;
  this.update.deckName = deck.deckName;
  this.update.description = deck.description;
  this.deckType = deck.deckType
},

updateDeck(){
  const updatedDeck ={
    id: this.update.deckId,
    deckName: this.update.deckName,
    description: this.update.description,
    deckType: this.update.deckType
  };

  deckService.update(updatedDeck);
  this.$router.push(`/decks/`);

},

deleteDeck(deck){
       deckService.delete(deck.id);
        this.$router.go(`/decks/`);
},
resetForm() {
      this.updateForm = false;
      this.deck = {};
    }
},


created() {
this.getDecks();
}

}
</script>
<style scoped>




.header {
  background-color: rgb(209, 196, 129);
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
    background-image: url(../assets/computerScreen.jpeg);
    background-position: 50% 0%;
    background-color: rgb(102, 172, 117);
    background-size: cover;
    border-radius: 7px;
    margin: 15px;
    text-align: center;
    line-height: 60px;
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
    
  }

  p {
    font-size: 20px;
  }

  .list-of-decks{
    background-color: #DCC7AA;
    background-size: cover;
      display:flex;
      justify-content: center;
      flex-flow: row wrap;
      

  }
  .updeleteButtons{
      justify-content: center;
      display:flex;
  }
  button:hover{
    background-color: #F7C331;
  }

.updateButton {
  background-color: #F7882F;
  -webkit-box-shadow: 9px 10px 22px -8px rgba(33, 88, 40, 0.774);
    -moz-box-shadow: 9px 10px 22px -8px rgba(33, 88, 40, 0.774);
    box-shadow: 9px 10px 22px -8px rgba(33, 88, 40, 0.774);
}
#link{
text-decoration: none;

}
#delete:hover{
    background-color: #F7C331;
  }

#delete {
  background-color: #F7882F;
  -webkit-box-shadow: 9px 10px 22px -8px rgba(33, 88, 40, 0.774);
    -moz-box-shadow: 9px 10px 22px -8px rgba(33, 88, 40, 0.774);
    box-shadow: 9px 10px 22px -8px rgba(33, 88, 40, 0.774);
  
}
  
  
 @media screen and (max-width: width 600px)    {
     .list-of-decks{
         display:flex;
      justify-content: center;
      flex-flow: row wrap;
      
     }
 }
  
</style>