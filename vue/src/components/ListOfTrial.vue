<template>
<div class="fullPage">
 <div class="Story">
   <div>
Create a free account today to get access to dozens of cards: plus the ability to add, update, and delete your own decks!
</div>
    </div>
<div class= "list-of-trial">
 

   <div v-for="deck in this.$store.state.decks" v-bind:key="deck.id" >
   
    
     <router-link id="link" v-bind:to="{name: 'TrialCards', params: {id : deck.id}}">
       <div class="deck"> {{deck.deckName}} 
          <p> {{deck.description}} </p>
       </div>
      
      </router-link>

    </div>
    <div class="Para">
  <div> Sign up and see other decks. It's free! Boost your grades with unlimited access to dozens of flashcards!
  </div>
</div>
</div>

</div>
</template>

<script>
import deckService from "@/services/DeckService.js";
export default {
    name: "list-of-trial",
methods:{
    getTrial() {
   deckService.listTrial().then(response =>{
        this.$store.commit("SET_DECKS", response.data);
    });
}
},
created() {
    this.getTrial();
}

}
</script>

<style>

.Story {
  display:flex;
  font-family:  Arial, Helvetica, sans-serif;
  flex-flow: row wrap;
  margin-top: 50px;
}
.Para{
 font-family:  Arial, Helvetica, sans-serif;
  
}
.deck:hover{
  transform: scale(1.1);
}
  .deck {
    display: flex;
    flex-direction:column;
    width: 250px;
    height: 400px;
    padding: 40px 25px;
    background-color: rgb(102, 172, 117);
    background-image: url(../assets/computerScreen.jpeg);
    background-position: 50% 0%;
    background-color: rgb(102, 172, 117);
    background-size: cover;
    border-radius: 7px;
    margin: 15px;
    text-align: center;
    line-height: 27px;
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
    text-decoration: none;
    font-family: Arial, Helvetica, sans-serif;
  }

  p {
    font-size: 20px;
    align-content: center;
  }
.deck.list-of-trial{

  margin-top: 300px;
}
  .list-of-trial{
      display:flex;
      justify-content: center;
      flex-flow: row wrap;
      min-height: 100vh;
      background-color: #DCC7AA;
     

  }
  .fullPage{
    display:flex;
      justify-content: center;
      flex-flow: row wrap;
    
      background-color: #DCC7AA;

  }
  



  

  #link{
text-decoration: none;
}

</style>