<template>
<div class="trialCards">
<card-trial v-bind:deck-id="parseInt($route.params.id)" />

</div>
  
</template>

<script>

import CardTrial from '@/components/CardTrial.vue';

export default {
    name: "TrialCards",
    components: {
    CardTrial

    }

}
</script>

<style>

</style>