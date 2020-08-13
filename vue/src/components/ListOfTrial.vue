<template>
<div class="fullPage">
    <div class="Story">
      Create a free account today to get access to dozens of cards: plus the ability to add, update, and delete your own decks!
    </div>
<div class= "list-of-trial">
 

   <div v-for="deck in this.$store.state.decks" v-bind:key="deck.id" >
   
    <div v-on:click="setTitle(deck)">
     <router-link id="link" v-bind:to="{name: 'TrialCards', params: {id : deck.id}}">
       <div class="deck"> {{deck.deckName}} 
          <p> {{deck.description}} </p>
       </div>
      
      </router-link>
      </div>

    </div>
</div >
<div class="test">
 <router-link class="menuLink" id="login" tag="button" :to="{ name: 'register' }">
  <div class="signUp"> 
      Sign up and see other decks. It's free! Boost your grades with unlimited access to dozens of flashcards!
  </div>
  </router-link>
  </div>
</div>
</template>

<script>
import deckService from "@/services/DeckService.js";
export default {
    name: "list-of-trial",
methods:{
   setTitle(deck)
  {
    this.$store.state.deckTitle = deck.deckName;
  },
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
    height: 300px;
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
    margin-bottom: 30%;
    margin-top: 30%;
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
      background-color: #DCC7AA;
     

  }
  .fullPage{
    display:flex;
    justify-content: center;
    flex-direction: column;    
    background-color: #DCC7AA;
    align-content: space-between;
    min-height: 100vh;


  }
  
  .Story{
    display: flex;
    justify-content: center;
    font-family: Arial, Helvetica, sans-serif;
    font-size: 30px;
    margin-left: 20%;
    margin-right: 20%;
    margin-top: 20px;
    color: white;
    border-radius: 10px;
      text-shadow: 2px 2px #6e6e6e;


  }

  .signUp{
    display: flex;
    justify-content: center;
    font-family: Arial, Helvetica, sans-serif;
    font-size: 30px;
    margin-left: 20%;
    margin-right: 20%;
    margin-top: 20px;
    color: white;
    border-radius: 10px;
      text-shadow: 2px 2px #6e6e6e;


   }




  

  #link{
text-decoration: none;
background-color: #F7882F;
}

#link:hover{
  background-color:#F7C331;
}

.test{
  display:flex;
  justify-content: center;
  margin-left: 20%;
  margin-right: 20%;
 
}

</style>