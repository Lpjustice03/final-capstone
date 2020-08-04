<template>
  <div class="home">
    <h1>Home</h1>
    <list-of-cards />
    <h2> hey </h2>
  </div>
</template>

<script>

import ListOfCards from '@/components/ListOfCards.vue';


export default {
  name: "Home",
  components: {
    ListOfCards
  }
};
</script>
