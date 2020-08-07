<template>
<div class="header">
<div class="cardButton">
<button type="submit" v-on:click="updateCard()"> Update Card </button>

    <button type="submit" v-on:click="addCard()"> Add A Card </button>
   </div>
<form class="addCard" v-on:submit="saveCard">
<div>
<label for="front">Question? </label>

<input type="text" name="front" v-model="card.front" />
<label for="back"> Answer: </label>
<input type="text" name="back" v-model="card.back"/>
</div>
<div class="actions">
<button type="submit"> Save
</button>
</div>

</form>
</div>
</template>

<script>

import cardService from "@/services/CardService.js";


export default {
name: "add-card",
data() {
return{
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
        cardService.addCard(newCard)
        // .then((response) => {
        //     if (response.status === 201) {
        //         this.$router.push(this.params.deckId);
        //     }

        // })
        
    }
}
}

</script>

<style scoped>
.cardButton{
justify-content: center;
display:flex;
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

</style>