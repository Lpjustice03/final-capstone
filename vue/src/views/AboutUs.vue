<template>
<body>
  <div>
    <div class="about-section">
  <h1>About Us</h1>
  <p class="description"> We are the creators of FlipDeck.  After going through a rigorous program at Tech Elevator, we all banded together to create FlipDeck, the flashcard study app! 
  Using everything we have learned here at Tech Elevator, we combined back-end code(Java, SQL), with front-end code(HTML,CSS). Using CSS, we were able to experiment with different looks and feels, for the ultimate user experience.
  Thanks for using the app, and we hope you enjoy it!</p>
</div>
    <h2 class="name">Our Team</h2>
    <div class="row">
  <div class="column">
    <div class="card">
 <img src="../assets/Omer Ali.jpg" alt="Omer" style="width:100%">
      <div class="container">
        <h2>Omer Ali</h2>
        <p class="title">The Vue Guy</p>
        <p class="title"></p>
        <p>  Working on this project with my teammates Erik, Lance, and Mike has been the second greatest joy in my life.  My greatest joy in life, will be coming into this world in about a month. </p>
        <p>Omer.ali17@gmail.com</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div>

<div class="column">
    <div class="card">
     <img src="../assets/Lance.jpeg" alt="Lance" style="width:100%">
            <div class="container">
        <div class="cardProp">
        <h2 class="names">Lance Justice </h2>
        <p class="title">The Java/Vue Guy</p>
        <p> I spent 9 years at a bank servicing and processing mortgage loan accounts. My real passion was in coding which led me to Tech Elevator.
           I am thankful for the skills I've obtained and the languages I've learned. Excited to grow and learn more as software developer.</p>
        <p class="emails">lpjustice03@gmail.com</p>
        <p><button class="button">Contact</button></p>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="row">
<div class="column">
    <div class="card">
      <img src="../assets/Erik.jpeg" alt="Erik" style="width:100%">
      <div class="container">
        <h2>Erik Leopard</h2>
        <p class="title">The Old Guy</p>
        <p>I am a proud father of 2 beautiful children. They are what has motivated me to make this career change, and pick this project to work on.</p>
        <p>erikleopard3@gmail.com</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div>
  <div class="column">
    <div class="card">
      <img src="../assets/Mike.jpeg" alt="Mike" style="width:100%">
      <div class="container">
        <h2>Mike Finegan</h2>
        <p class="title">The Everything Guy</p>
        <p> I graduated from OSU with a degree in Economics but my passion for technology led me to Tech Elevator.  After three months of hard work and perseverence, I'm happy that I made this decision.
        </p>
        <p>mfinegan96@gmail.com</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div>
</div>
</div>


</body>
</template>

<script>
export default {
    name: "AboutUs",
    components: {
   
   
  }
}
</script>

<style scoped>
img{
  height:100%;
}

body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
  display: flex;
  background-color: #DCC7AA;
}

html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  float: left;
  width: 33.3%;
  margin-bottom: 16px;
  padding: 0 8px;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  margin: 8px;
  background-color: #6B7A8F;
  justify-content: flex-start;
  color: white;
  text-shadow: 1px 1px 1px black,
                1px 2px 1px black;
}


.about-section {
  padding: 50px;
  text-align: center;
  background-color: rgb(214, 182, 137);
  color: white;
  text-shadow: 1px 1px 1px black,
                1px 2px 1px black;
}

.container {
  padding: 0 16px;
  height: 500px;
}


.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: #F7C331;
}

.button {
  position: relative;
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  text-shadow: 1px 1px 1px black,
                1px 2px 1px black;
  background-color: #F7882F;
  text-align: center;
  cursor: pointer;
  width: 33%;
  justify-content: center;
}

.button:hover {
  background-color: #F7C331;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}

h2{
  text-align: center;

}

.row {
  display: flex;
  justify-content: center;
  justify-items: center;
}
.name {
color: white;
  text-shadow: 1px 1px 1px black,
                1px 2px 1px black;
}

.description{
  font-size: 30px;
}

</style>

