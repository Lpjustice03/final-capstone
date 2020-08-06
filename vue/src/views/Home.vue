<template>
  <div class="home">
    <div class="header">
    <h1>FLIPDECK</h1>
    <h2> Welcome to FlipDeck the coolest study tool around</h2>
    <p> FlipDeck makes simpe learning flash cards that let you study anything.  Start learning today!  Use the ever growing library of decks approved by top educators or create your own custom decks! — all for free! 
     <router-link class="tryIt" v-bind:to="{name:'decks'}"> Try It For Free!</router-link>
    </p>
    </div>
    
      </div>
</template>

<script>

export default {
  name: "Home",
  components: {
   
   
  }
  
  

};
</script>

<style scoped>

.home{
  padding: 0;
  min-height: 100vh;
  background: url(../assets/heroImage.jpg)left / cover no-repeat;
  filter: grayscale(70%);
  display: flex;
}


 .header {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  text-align: left;
  color: #ffffff;
  margin-top: 250px;
  display: flex;
  flex-direction: column;
  align-content:flex-end;
  flex-wrap: wrap;
  margin-right: 600px;
}

h1 {
  margin-top: 60px;
  margin-left: 170px;
  font-size: 60px;

}

h2 {
  margin-top: 0px;
  margin-left: 170px;
  font-size: 30px;

}

p {
  margin-left: 170px;
  font-size: 20px;

}

.tryIt {
  margin-left: 100px;
  color: rgb(171, 184, 207);
}

@media only screen and (max-width: 600px) {
    p{
      margin-left: 10px;
      font-size: 15px;
    }

    h2 {
      margin-left: 10px;
      font-size: 20px;
    }

  h1 {
    margin-top: 20px;
    margin-left: 10px;
    font-size:30px;
    text-align: center;
}
 .header {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  text-align: left;
  color: #ffffff;
  margin-top: 50px;
  display: flex;
  flex-direction: column;
  align-content:flex-end;
  flex-wrap: wrap;
  margin-right: 20px;
}

.home{
  padding: 0;
  min-height: 50vh;
  background: url(../assets/heroImage.jpg)left / cover no-repeat;
  filter: grayscale(70%);
  display: flex;
}

}









</style>

