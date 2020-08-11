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
    <div>FlipDeck makes simple learning flash cards that let you study anything. Use the ever growing library of decks approved by top educators or create your own custom decks! — all for free! 
    <div v-if="$store.state.token == ''">
     <router-link class="tryIt" tag="button" v-bind:to="{name:'TrialPage'}"> Try It Now!</router-link>
   </div>
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
  min-height: 92vh;
  display: flex;

}

.tryIt {
    margin-right: 20%;
    margin-top: 2%;
    opacity: 0.8;
}
.tryIt:hover {
  background-color: #F7C331;
}

.paragraph {
  margin-left: 170px;
  font-size: 35px;
  background: rgb(107, 122, 143, .3);
  color: white;
  font-weight: 175;
  font-family: Arial, Helvetica, sans-serif;
  text-shadow: 1px 1px 1px black,
                1px 2px 1px black;
  position:flex;
  margin-top: 10%;
  margin-right: 10%;
  flex-flow: row wrap;
  text-align:center;
  font-weight: 600;
}
.tryIt {
  font-size: 35px;
  margin-right: 5%;
  color: rgb(248, 248, 248);
  text-shadow: 1px 1px 1px #662861,
1px 2px 1px #662861;

}

@media only screen and (max-width: 600px) {
    p{
      margin-left: 10px;
      font-size: 15px;
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
    transform: perspective(300px) rotateY(-67.3deg) ;
    text-shadow: 1px 1px 1px #F7C331,
                 1px 2px 1px #F7C331,
                 1px 3px 1px #F7C331,
                 1px 4px 1px #F7C331,
                 1px 18px 6px rgba(16,16,16,0.2),
                1px 22px 10px rgba(16,16,16,0.2),
                1px 25px 35px rgba(16,16,16,0.2),
                1px 30px 60px rgba(16,16,16,0.2);
}

.box .inner:last-child {
    background-color: rgb(119, 102, 8, 0.3);
    color: black;
    transform-origin: right;
    transform: perspective(300px) rotateY(67.3deg) rotateX(180deg);
    text-shadow: 1px 1px 1px #F7C331,
                 1px 2px 1px #F7C331,
                 1px 3px 1px #F7C331,
                 1px 4px 1px #F7C331,
                 1px -18px 6px rgba(16,16,16,0.2),
                1px -22px 10px rgba(16,16,16,0.2),
                1px -25px 35px rgba(16,16,16,0.2),
                1px -30px 60px rgba(16,16,16,0.2);
}

.box .inner span {
    position: absolute;
    animation: marquee 8s linear infinite;
}

.box .inner:first-child span {
    animation-delay: 4s;
    left: -100%;
    
}

@keyframes marquee {
    from {
        left: -100%;
    }
    
    to {
        left: 100%;
    }
}







</style>

