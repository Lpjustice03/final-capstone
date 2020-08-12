<template>
 <div class="cardButton">
    <button type="submit" v-on:click="addForm = true" v-show = "!addForm"> Add A Card </button>  
    <div class="addCardForm">
    <form class="addCard" v-on:submit="saveCard" v-show = "addForm">
    <div>
       <label for="front">Question? </label>
         <input type="text" name="front" v-model="card.front" />
       <label for="back"> Answer: </label>
         <input type="text" name="back" v-model="card.back"/>
    </div>
    <div class="actions">
      <button id="save" type="submit"> Save</button>
      <input id="cancel" type="button" value="Cancel" v-on:click.prevent="resetForm" />
    </div>
    </form>
    </div>

</div>

</template>

<script>


import cardService from "@/services/CardService.js";
// import AuthService from "@/services/AuthService.js";

export default {
name: "add-card",
data() {
return{
    addForm: false,
    updateForm: false, 
card:{

        front: '',
        back: '',
        deckId: this.$route.params.id

        
    }
    };

},
methods: {
    saveCard() {
        const newCard = {
            front: this.card.front,
            back: this.card.back,
            deckId: this.card.deckId
            
        };
        cardService.addCard(newCard);
        // .then((response) => {
        //     if (response.status === 201) {
               this.$router.push(this.params.deckId);
        //     }

        // })
        
    },
       
    

    resetForm() {
      this.addForm = false;
      this.updateForm = false;
      this.card = {};
    }
}
}

</script>

<style scoped>

input[type=text] {
    border-radius: 5px;
    margin-top: 35px;
}

.actions {
display: flex;
justify-content: center;
}

#save {
    margin: 5%;
    width: 75%;

}

#cancel {
     width: 75%;
    background-color: #F7882F;
    border-radius: 5px;
    color: white;
    border: 1px solid #959717;
    font-size: 14px;
    font-weight: 700;
    margin:5%;
}

#cancel:hover {
    background-color: #F7C331;
}

label {
    font-size: 20px;
    color: #53224f;
}

button{
    border-radius: 5px;
    border: 2px solid  #6B7A8F;
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
    margin-top: 35px;

 
  }

  button:hover{
    background-color: #F7C331;
    border: 1px solid #8984cb
  }
.cardButton{
display:flex;
justify-content: flex-end;
background-color: rgb(214, 182, 137);
}

</style>