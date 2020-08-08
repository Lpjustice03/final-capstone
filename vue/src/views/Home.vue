<template>
  <div class="home">
    <div class="header">
    <h1>FLIPDECK</h1>
    <h2> Welcome to FlipDeck the coolest study tool around</h2>
    <p>FlipDeck makes simple learning flash cards that let you study anything.  Start learning today!  Use the ever growing library of decks approved by top educators or create your own custom decks! — all for free! 
  </p>
   <div v-if="$store.state.token == ''">

     <router-link class="tryIt"  v-bind:to="{name:'TrialPage'}"> Try It For Free!</router-link>
   </div>
   
   
    
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
  background: url(../assets/heroImage.jpg)left / cover no-repeat;
  padding: 0;
  min-height: 100vh;
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

.tryIt {
    transform: translate(100%,20%);
}

.workpls {
  
}

h1 {
  margin-top: 60px;
  margin-left: 0px;
  font-size: 60px; 
  position: flex;
  justify-content: flex-start;
  transform: translate(13%,20%);
  text-transform: uppercase;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 6em;
  font-weight: 700;
  color: #f5f5f5;
  text-shadow: 1px 1px 1px #a75aa0,
1px 2px 1px #a75aa0,
1px 3px 1px #a75aa0,
1px 4px 1px #a75aa0,
1px 5px 1px #a75aa0,
1px 6px 1px #a75aa0,
1px 7px 1px #a75aa0,
1px 8px 1px #a75aa0,
1px 18px 6px rgba(16,16,16,0.2),
1px 22px 10px rgba(16,16,16,0.2),
1px 25px 35px rgba(16,16,16,0.2),
1px 30px 60px rgba(16,16,16,0.2)
}

h2 {
  margin-top: 0px;
  margin-left: 170px;
  font-size: 30px;
  font-weight: 350;
  font-family: Arial, Helvetica, sans-serif;
  text-shadow: 1px 1px 1px #a75aa0,
1px 2px 1px #a75aa0,
1px 3px 1px #a75aa0,
1px 4px 1px #a75aa0;
}

p {
  margin-left: 170px;
  font-size: 20px;
  background: transparent;
  color: white;
  font-weight: 175;
  font-family: Arial, Helvetica, sans-serif;
  text-shadow: 1px 1px 1px #a75aa0,
  1px 2px 1px #a75aa0;

}

.tryIt {
  margin-left: 100px;
  color: rgb(248, 248, 248);
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

