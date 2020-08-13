<template>

<div class="trial">
  <div class="header">
   <h1 class="heroBanner">Trial Decks</h1>
  <div id="backbutton" >
      <h2> GO BACK</h2>
     <router-link to="/">  

     <img src='@/assets/black-arrow.png' />
     </router-link>
    </div>
    </div>
  <list-of-trial/>
</div>
</template>

<script>
import ListOfTrial from '@/components/ListOfTrial.vue'
export default {
    name: "TrialPage",
    components:{
        ListOfTrial
    }

}
</script>

<style scoped>
img{
  background-size: cover;
  height: 50px;
  margin:0px; 
}
h2{
  color: black;
  font-family: "Permanent Marker";
}

h1{
  font-family: Arial, Helvetica, sans-serif;
  font-size: 50px;
  color: #ffffff;
  text-align: center;
  text-shadow: 2px 2px #6e6e6e;
}

.trial{
  background-color: #DCC7AA;
  margin-top: -34px;
}

.header{
  background-color: rgb(214, 182, 137);
}

</style>
