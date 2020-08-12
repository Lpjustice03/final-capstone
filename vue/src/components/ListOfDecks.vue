<template>
<div class="decksPage">
  <form class="listofdecks" v-on:submit="updateDeck" v-show = "updateForm">
        <div class="updoot">
            <label  for="deckName">Name of Deck    </label>
              <input  type="text" name="deckName" v-model="update.deckName" />
            <label  for="description"> Description:    </label>
              <input   type="text" name="description" v-model="update.description"/>
            
              
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
<div class= "list-of-decks">
  

   <div class="deckButton">
    
          
        
      </div>
<div v-for="deck in this.$store.state.decks" v-bind:key="deck.id" >
<router-link id="link" v-bind:to="{name: 'cards', params: {id : deck.id}}">
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
    padding: 45px 25px;
    background-color: rgb(102, 172, 117);
    background-image: url(../assets/computerScreen.jpeg);
    background-position: 50% 0%;
    background-size: cover;
    border-radius: 7px;
    margin-top: 15px;
    text-align: center;
    line-height: 30px;
    cursor: pointer;
    position: relative;
    color: #fff;
    font-weight: 400;
    font-size: 30px;
    -webkit-box-shadow: 9px 10px 22px -8px rgba(33, 88, 40, 0.774);
    -moz-box-shadow: 9px 10px 22px -8px rgba(33, 88, 40, 0.774);
    box-shadow: 9px 10px 22px -8px rgba(33, 88, 40, 0.774);
    will-change: transform;
    border-style: outset;
    text-decoration: none;
    font-family: Arial, Helvetica, sans-serif;
  }

  p {
    font-size: 20px;
    align-content: center;
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
    border: 1px solid  #6B7A8F;
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
      border: 1px solid  #6B7A8F;

}
  
  
 @media screen and (max-width: width 600px)    {
     .list-of-decks{
         display:flex;
      justify-content: center;
      flex-flow: row wrap;
      
     }
 }
  
  .decksPage{
    display: flex;
    flex-direction: column;
  }

 .listofdecks{
   display: flex;
   justify-content: center;
   flex-direction: column;
 }

 .updoot{
   display:flex;
   flex-direction: row;
   justify-content: center;
 }

 #save{
  width: 20%
 }

 #cancel{
  width: 20%

 }


</style>