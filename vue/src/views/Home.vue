<template>
  <div class="home">
    <h1>Home</h1>
    <list-of-cards/>
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
