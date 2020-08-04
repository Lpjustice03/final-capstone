
<template>
  <div> </div>
</template>

<script>

import cardService from "../services/CardService.js";
export default {
    name: 'card-details',
    props: {
        cardId: Number
    },
    created(){
        cardService.get(this.cardId)
    }

}
</script>

<style>

</style>