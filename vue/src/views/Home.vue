<template>
  <div class="home">
    <body>
        <div class="box">
            <div class="inner">
                <span>FlipDeck</span>
            </div>
            <div class="inner">
                <span>FlipDeck</span>
            </div>
        </div>
        <div class="paragraph">
    <p>FlipDeck makes simple learning flash cards that let you study anything.  Start learning today!  Use the ever growing library of decks approved by top educators or create your own custom decks! — all for free! 
    </p>
  
   <div v-if="$store.state.token == ''">
     <router-link class="tryIt"  v-bind:to="{name:'TrialPage'}"> Try It For Free!</router-link>
   </div>
   </div>
    </body>
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
.tryIt:hover {
  color: #753d71;
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
1px 30px 60px rgba(16,16,16,0.2);

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
  font-size: 25px;
  background: transparent;
  color: white;
  font-weight: 175;
  font-family: Arial, Helvetica, sans-serif;
  text-shadow: 1px 1px 1px #a75aa0,
  1px 2px 1px #a75aa0;
  position:flex;
  

}
.paragraph{
  margin-top: 10%;
  margin-right: 10%;
  flex-flow: row wrap;
  text-align:center;
  align-items:space-around;
}
.tryIt {
  font-size: 25px;
  margin-left: 100px;
  color: rgb(248, 248, 248);
  text-shadow: 1px 1px 1px #a75aa0,
1px 2px 1px #a75aa0;

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

body {

   
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
}

.box {
  margin-top: 10%;
  display: flex;
  align-content:flex-end;
  
  
    
}

.box .inner {
    width: 200px;
    height: 100px;
    line-height: 100px;
    font-size: 32px;
    font-family: sans-serif;
    font-weight: bold;
    white-space: nowrap;
    overflow: hidden;
}

.box .inner:first-child {
    background-color: rgb(205, 188, 92, 0.3);
    color: black;
    transform-origin: left;
    transform: perspective(300px) rotateY(-67.3deg);
    /* opacity: .8; */
    text-shadow: 1px 1px 1px #a75aa0,
1px 2px 1px #a75aa0,
1px 3px 1px #a75aa0,
1px 4px 1px #a75aa0,
1px 18px 6px rgba(16,16,16,0.2),
1px 22px 10px rgba(16,16,16,0.2),
1px 25px 35px rgba(16,16,16,0.2),
1px 30px 60px rgba(16,16,16,0.2);
}

.box .inner:last-child {
    background-color: rgb(119, 102, 8, 0.3);
    color: black;
    transform-origin: right;
    transform: perspective(300px) rotateY(67.3deg);
    /* opacity: .8; */
    text-shadow: 1px 1px 1px #a75aa0,
1px 2px 1px #a75aa0,
1px 3px 1px #a75aa0,
1px 4px 1px #a75aa0,
1px 18px 6px rgba(16,16,16,0.2),
1px 22px 10px rgba(16,16,16,0.2),
1px 25px 35px rgba(16,16,16,0.2),
1px 30px 60px rgba(16,16,16,0.2);
}

.box .inner span {
    position: absolute;
    animation: marquee 5s linear infinite;
}

.box .inner:first-child span {
    animation-delay: 2.5s;
    left: -100%;
    /* opacity: 1; */
}

@keyframes marquee {
    from {
        left: 100%;
    }
    
    to {
        left: -100%;
    }
}







</style>

