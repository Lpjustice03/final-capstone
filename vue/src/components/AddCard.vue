<template> 


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
            userId: '',
            deckId: ''
            
        }
        };

    },
    methods: {
        saveCard() {
            const newCard ={
                front: this.card.front,
                back: this.card.back,
                userId: this.card.userId,
                deckId: this.card.deckId,
                cardCreatorId: this.card.userId

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

</style>