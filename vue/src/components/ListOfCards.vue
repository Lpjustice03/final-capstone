<template>
  
  
<div class= "list-of-cards">   
     <div class="cardButton">
        <button type="submit" v-on:click="updateForm = true" v-show = "!updateForm"> Update Card </button>  
        <form class="listofcards" v-on:submit="updateCard" v-show = "updateForm">
        <div>
            <label for="front">Question? </label>
            <input type="text" name="front" v-model="update.front" />
            <label for="back"> Answer: </label>
            <input type="text" name="back" v-model="update.back"/>

            <select v-model="update.id">
                <option v-for="card in filterCards" v-bind:value="card.id" v-bind:key="card.id"> {{card.front}} </option>
            </select>


    </div>
    <div class="actions">
      <button id="save" type="submit"> Save</button>
      <input id="cancel" type="button" value="Cancel" v-on:click.prevent="resetForm" />
    </div>
    </form>
    </div>    
    <div class="action">    
    </div>
    <div v-for="card in filterCards" v-bind:key="card.id" >
    <div class="card" v-on:click="toggleCard (card)"> {{card.flipped ? card.back : card.front}} </div> 
      <!-- <button class="correct">Correct!</button>
      <button class="incorrect">Incorrect!</button> -->
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
    updateCard(){
        const updatedCard = {
                id: this.update.id,
                front: this.update.front,
                back: this.update.back,
                deckId: this.update.deckId
            
            };
            cardService.update(updatedCard);

    },
    addCard(){

    },
toggleCard: function(card) {
      card.flipped = !card.flipped;
    },

    resetForm() {
      this.updateForm = false;
      this.card = {};
    }
},
created() {
    this.getCards();
},



}




</script>

<style scoped>
.header {
     display:flex;
     flex-direction: column; 
  }

  .card {
    display: flex;
    justify-content: center;
    flex-direction:column;
    width: 250px;
    height: 245px;
    padding: 40px 25px;
    background-color: #5895bb;
    border-radius: 7px;
    margin: 25px;
    text-align: center;
    line-height: 27px;
    cursor: pointer;
    position: relative;
    color: #fff;
    font-weight: 600;
    font-size: 20px;
    -webkit-box-shadow: 9px 10px 22px -8px rgba(209,193,209,.5);
    -moz-box-shadow: 9px 10px 22px -8px rgba(209,193,209,.5);
    box-shadow: 9px 10px 22px -8px rgba(209,193,209,.5);
    will-change: transform;
    border-style: outset;
  }

  .card:hover{
      transform: scale(1.2);
    
  }

  .card:active {
transform: rotateY(180deg);
transition: transform .5s;
color:#51aae5;

}

  .list-of-cards{
      display:flex;
      justify-content: center;
      flex-flow: row wrap;
      background-color: rgb(209, 196, 129);
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

  button{
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
  }

  .correct {
      background-color: darkgreen;
      border-radius: 20px;
      margin-top: 5%;
      margin-left: 21%;
  }

  .correct:hover{
      background-color: #70a66f;
  }
  
  .incorrect {
      margin-top: 5%;
      background-color: red;
      border-radius: 20px;
  }

  .incorrect:hover{
      background-color: #f35656;
  }
    
</style>