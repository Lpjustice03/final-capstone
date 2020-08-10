<template>
    <div>
        <div class="resetBlock">
        <div class=row>
        <button class="beginStudy" v-on:click="toggleTimer"> {{isRunning ? 'Stop Study Session' : 'Begin Study Session'}} </button>
        <button class="beginStudy" v-on:click="resetCounter"> Reset </button>
        </div>
        <div class="row">
        <div class="time"> Hr: {{hour}} </div> 
        <div class="time"> Min: {{minute}}  </div> 
        <div class="time"> Sec: {{second}} </div>    

        <!-- <div class="time"> {{hour}} : {{minute}} : {{second}} </div>  -->
        </div>
        <div class="row">
        <div class="counter">Correct: {{this.$store.state.counterCorrect}}  </div>
        <div class="counter">  Total: {{this.$store.state.counterTotal}} </div>
        

        </div>

        </div>
  </div>
</template>

<script>
export default {
    name: 'timer',

data () {
    return {
      time: 0,
      hour: 0,
      minute: 0,
      second: 0,
      interval: null,
      isRunning: false
    }
  },
  methods: {
      addCorrect(){
        this.$store.state.counterCorrect = this.$store.state.counterCorrect + 1;
        this.$store.state.counterTotal = this.$store.state.counterTotal + 1;
    },

    addTotal(){
       this.$store.state.counterTotal = this.$store.state.counterTotal + 1;
    },

    resetCounter()
    {
        this.$store.state.counterTotal = 0;
        this.$store.state.counterCorrect = 0;
    },
    
    toggleTimer() {
        if (this.isRunning) {
            clearInterval(this.interval);
            // Insert method to add to database here/service
            this.resetCounter();
            this.minute = 0;
            this.second = 0;
            this.hour = 0;
            this.time = 0;
        }
        else{
            this.interval = setInterval(this.incrementTime, 1000);
        }
        this.isRunning = !this.isRunning;
    },
    incrementTime() {
        this.time = parseInt(this.time) + 1;
        if (this.time % 60 == 0){
            this.minute = this.minute + 1;
        }
        if (this.time % 3600 == 0)
        {
            this.hour = this.hour + 1;
        }
        this.second = this.time % 60;
    },
  }
};

</script>

<style>
.resetBlock {
      flex-direction: column;
      font-family: Arial, Helvetica, sans-serif;
      display: flex;
      align-content: flex-start;
  }

  .counter {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 20px;
    margin-left: 1%;
  }

  button{
    border-radius: 5px;
    border: 1px solid  #8984cb;
    background-color: #53224f;
    padding: 8px 15px;
    outline: none;
    font-size: 14px;
    font-weight: 700;
    color: #fff;
    cursor: pointer;
    transition: all 0.3s ease;
    justify-content: center;
    margin-right: 10px;
    margin-left: 10px;
    margin-bottom: 25px;
    font-family: Arial, Helvetica, sans-serif;
  }
   button:hover{
    background-color: rgb(194, 109, 41);
  }

  .beginStudy {
      display:flex;
      justify-content: center;
      font-family: Arial, Helvetica, sans-serif;
      width: 10%;
      height: auto;
}

.row {
    display: flex;
    flex-direction: row;
}

.time {
    margin-left: 1%;
}
</style>