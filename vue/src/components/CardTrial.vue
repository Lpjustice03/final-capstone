<template>
  
<div class= "list-of-cards">
    
     
    <div class="action">
       
        
    </div>
    

    <div v-for="card in filterCards" v-bind:key="card.id" >

    <div class="card" v-on:click="toggleCard (card)"> 
        <h1 class="Pretext">  {{card.flipped ? "Answer:" : "Question:"}}  </h1>

        {{card.flipped ? card.back : card.front}} </div> 

        <div class="answerButtons" v-show="card.flipped = card.flipped">
        <button class="correct" v-on:click="addCorrect(card)" >Correct!</button>
        <button class="incorrect" v-on:click="addTotal(card)">Incorrect!</button> 
      </div>
    
    </div> 
           
</div>




</template>

<script>

import cardService from "@/services/CardService.js";

export default {
name: "card-trial",
computed: {
    filterCards() {
        return this.$store.state.cards.filter( card => {
            return card.deckId == this.$route.params.id;
        });
    }
},
methods:{
    getCards() {
        cardService.listTrialCards().then(response =>{
        this.$store.commit("SET_CARDS", response.data);
        });
},
    updateCard(){

    },
    addCard(){

    },
toggleCard: function(card) {
      card.flipped = !card.flipped;
    },
        addCorrect(card) {
        this.$store.state.counterCorrect = this.$store.state.counterCorrect + 1;
        this.$store.state.counterTotal = this.$store.state.counterTotal + 1;

        this.toggleCard(card);
    },
    
    addTotal(card) {
        this.$store.state.counterTotal = this.$store.state.counterTotal + 1;
        this.toggleCard(card);
    }
},
created() {
    this.getCards();
}


}




</script>

<style scoped>
.header {
     display:flex;
     flex-direction: column; 
  }
  .card {
  display: flex;
    margin: 15px;
    flex-direction:column;
    width: 400px;
    height: 300px;
    padding: 40px 25px;
     background-image: url(../assets/noteCard.png);
  background-size: cover;
    border-radius: 7px;
    /* margin: 25px; */
    text-align: center;
    line-height: 27px;
    cursor: pointer;
    position: relative;
    color: rgb(2, 2, 2);
   font-family: "Lucida Console", Courier, monospace;
    font-weight: 600;
    font-size: 20px;
    -webkit-box-shadow: 9px 10px 22px -8px rgba(209,193,209,.5);
    -moz-box-shadow: 9px 10px 22px -8px rgba(209,193,209,.5);
    box-shadow: 9px 10px 22px -8px rgba(209,193,209,.5);
    will-change: transform;
    border-style: outset;
  }
  .card:hover{
      transform: scale(1.1);
    
  }
  .card:active {
transform: rotateY(180deg);
transition: transform .25s;
color:white;

}
  .list-of-cards{
      display:flex;
      justify-content: center;
      flex-flow: row wrap;
  } 
  .cardButton{
      justify-content: center;
      display:flex;
  }
 @media screen and (max-width: width 600px)    {
     .list-of-cards{
         display:flex;
      justify-content: center;
      flex-flow: row wrap;

     }
     
 }
  /* button{
    border-radius: 5px;
    border: 1px solid #cb84b0;
    background-color: #8984cb;
    padding: 8px 15px;
    outline: none;
    font-size: 14px;
    font-weight: 700;
    color: #fff;
    cursor: pointer;
    transition: all 0.3s ease;
    justify-content: center;
    margin-right: 10px;
    margin-left: 10px;
    margin-bottom: 25px;
  }
  
  button:hover{
    background-color: #70a66f;
  } */
  
      .Pretext {
    color: #000000;
    opacity: .5;
    text-align: left;
   position: flex;
   left:20px;
     vertical-align: text-top;
     top: 40px;
     font-size: 24px;
    }
    button{
    border-radius: 5px;
    border: 1px solid  #8984cb;
    background-color: #F7882F;
    padding: 8px 15px;
    outline: none;
    font-size: 14px;
    font-weight: 700;
    color: #fff;
    cursor: pointer;
    transition: all 0.3s ease;
    justify-content: center;
    margin-right: 10px;
    margin-left: 10px;
    margin-bottom: 25px;
    font-family: Arial, Helvetica, sans-serif;

  }
  
  button:hover{
    background-color: #F7C331;
  }

  .correct {
      display: flex;
      justify-content: center;
      background-color: darkgreen;
      font-family: Arial, Helvetica, sans-serif;
        border-radius: 5px;
        margin-top: 10px;
  }
.beginStudy {
      display:flex;
      justify-content: center;
      position: fixed;
      font-family: Arial, Helvetica, sans-serif;
}

  .answerButtons {
      display:flex;
      justify-content: center;
      font-family: Arial, Helvetica, sans-serif;

  }

  .correct:hover{
      background-color: #70a66f;
  }
  
  .incorrect {
      margin-top: 10px;
      background-color: red;
      
  }

  .incorrect:hover{
      background-color: #f35656;
  }
  
</style>