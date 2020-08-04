<template>

<div class= "list-of-cards">

    <div v-for="card in this.$store.state.cards" v-bind:key="card.id" class="card">
       <router-link v-bind:to="{name:'card-details', params:{id:card.id}}">          {{card.front}} {{card.back}}
        </router-link> 
    </div>


    </div>
 
</template>

<script>

import cardService from "@/services/CardService.js";

export default {
name: "list-of-cards",
methods:{
    getCards() {
    cardService.list().then(response =>{
        this.$store.commit("SET_CARDS", response.data);
    });
}

},
created() {
    this.getCards();
}

}


</script>

<style>
.topic-list {
  margin: 0 auto;
  max-width: 800px;
}
.card {
background-color: white;
display:block;
text-align: center;
width: 50px;
border: 5px solid rgb(10, 103, 156);
padding: 10%;
margin: auto;
border-radius: 20px;

}

#frontQuestion {
text-align: center;
color: rgb(37, 196, 22);
font-size: 25px;
}

#answerButton {
background-color: rgb(122, 241, 122);
color: black;
width: 500px;
height: 50px;
border-radius: 12px;

}
#answerButton:hover {
background-color: green;
color: white;
width: 30px;
height: 50px;
border-radius: 12px;
}

</style>