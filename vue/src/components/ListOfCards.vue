<template>
  
  
<div>
         <div class="cardButton">
         
         
        <form class="listofcards" v-on:submit="updateCard" v-show = "updateForm">
        <div>
            <label for="front">Question? </label>
            <input type="text" name="front" v-model="update.front" />
            <label for="back"> Answer: </label>
            <input type="text" name="back" v-model="update.back"/>
            <!-- <select v-model="update.id">
                <option v-for="card in filterCards" v-bind:value="card.id" v-bind:key="card.id"> {{card.front}} </option>
            </select> -->
        </div>
    <div class="actions" >
      <button id="save" type="submit"> Save</button>
      <input id="cancel" type="button" value="Cancel" v-on:click.prevent="resetForm" />
    </div>
    </form>
    </div>   
<div class= "list-of-cards"> 
    
       
    <div class="action">         
    
    </div>

    <div v-for="card in filterCards" v-bind:key="card.id" >
    <div class="card" v-on:click="toggleCard (card)" > 
        <h1 class="Pretext">  {{card.flipped ? "Answer:" : "Question:"}}  </h1>
        {{card.flipped ? card.back : card.front}}
        <!-- <footer v-show="card.flipped" id="tick-mark" class="x">
            <span class="x"> X </span> </footer> -->
        </div> 
        <div class="updeleteButtons" v-show="!card.flipped">
        <button id="updateButton" type="submit" v-on:click="update1(card)" v-show = "!updateForm"> Update Card </button> 
        <button id="delete" type="submit" v-on:click="deleteCard(card)"> DELETE </button>
        </div> 
        <div class="answerButtons" v-show="card.flipped = card.flipped">
        <button class="correct" v-on:click="addCorrect(card)" >Correct!</button>
        <button class="incorrect" v-on:click="addTotal(card)">Incorrect!</button> 
      </div>

      
    </div>       
</div>
</div>

</template>

<script>

import cardService from "@/services/CardService.js";

export default {
name: "list-of-cards",
    
 data() {
return{
    updateForm: false, 
    deckTitle: '',
update:{

        front: '',
        back: '',
        deckId: this.$route.params.id,
        id: ''
        
    }
    };

},

computed: {
    filterCards() {
        return this.$store.state.cards.filter( card => {
            return card.deckId == this.$route.params.id;
        });
    }
},
methods:{
    getCards() {
        cardService.list().then(response =>{
        this.$store.commit("SET_CARDS", response.data);
        });
},

update1(card){
  this.updateForm = true;
  this.update.id = card.id;
  this.update.front = card.front;
  this.update.back = card.back;
  this.this.$route.params.id
},
    updateCard(){
        const updatedCard = {
                id: this.update.id,
                front: this.update.front,
                back: this.update.back,
                deckId: this.update.deckId
            
            };
            cardService.update(updatedCard);
            this.$router.push(`/decks/${updatedCard.deckId}/cards`);

    },
    deleteCard(card){
        
        cardService.delete(card.id);
        this.$router.go(`/decks/deckId/cards`);
         

    },
toggleCard: function(card) {
      card.flipped = !card.flipped;
    },

    resetForm() {
      this.updateForm = false;
      this.card = {};
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
},



}




</script>

<style scoped>
.buttonRow {
    display: flex;
    flex-direction: row;
    margin-top: 5%;
    justify-content: center;
}

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
    will-change: transform;
    border-style: outset;
    -webkit-box-shadow: 9px 10px 22px -8px rgba(33, 88, 40, 0.774);
    -moz-box-shadow: 9px 10px 22px -8px rgba(33, 88, 40, 0.774);
    box-shadow: 9px 10px 22px -8px rgba(33, 88, 40, 0.774);

  }

  .card:hover{
      transform: scale(1.1);
    
  }

  .card:active {
transform: rotateY(180deg);
transition: transform .25s;
color:white;

}
.updeleteButtons {
    margin-top: 5%;
    display:flex;
    justify-content: center;
    
}

  .list-of-cards{
      display:flex;
      justify-content: center;
      flex-flow: row wrap;
      background-color: #DCC7AA ;
      
  } 



  .cardButton{
        justify-content: center;
        display:flex;
        font-family: Arial, Helvetica, sans-serif;

  }


 @media screen and (max-width: width 600px)    {
     .list-of-cards{
      display:flex;
      justify-content: center;
      flex-flow: row wrap;

     }  
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
    -webkit-box-shadow: 9px 10px 22px -8px rgba(33, 88, 40, 0.774);
    -moz-box-shadow: 9px 10px 22px -8px rgba(33, 88, 40, 0.774);
    box-shadow: 9px 10px 22px -8px rgba(33, 88, 40, 0.774);

  }

  .cardButton{
      background-color: #DCC7AA;
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


/* #tick-mark {
    position: relative;
    display: inline-block;
    width: 50px;
    height: 50px;
}

#tick-mark::before {
    position: absolute;
    left: 0;
    top: 50%;
    height: 50%;
    width: 3px;
    background-color: green;
    content: "";
    transform: translateX(10px) rotate(-45deg);
    transform-origin: left bottom;
}

#tick-mark::after {
    position: absolute;
    left: 0;
    bottom: 0;
    height: 3px;
    width: 100%;
    background-color: green;
    content: "";
    transform: translateX(10px) rotate(-45deg);
    transform-origin: left bottom;
}
    
.x {
  color: red;
  font-family: 'Helvetica', 'Arial', sans-serif;
  font-size: 2em;
  font-weight: bold;
  text-align: right;
  width: 30px;
  height: 30px;
  border-radius: 5px;
}
    
    
 */

</style>