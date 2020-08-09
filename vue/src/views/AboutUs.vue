<template>
<body>
  <div>
    <div class="about-section">
  <h1>About Us Page</h1>
  <p>Some text about who we are and what we do.</p>
  <p>We are the coolest people alive.</p>
</div>
    <h2 class="nam">Our Team</h2>
    <div class="row">
  <div class="column">
    <div class="card">
 <img src="../assets/Omer Ali.jpg" alt="Jane" style="width:100%">
      <!-- images -->
      <div class="container">
        <h2>Omer Ali</h2>
        <p class="title">Just another guy</p>
        <p>Greatest Man ALive.</p>
        <p>Omer.ali17@gmail.com</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div>
  </div>

<div class="column">
    <div class="card">
     <img src="../assets/Lance.jpeg" alt="Jane" style="width:100%">
            <div class="container">
        <h2>Lance Justice </h2>
        <p class="title">The Vue Guy</p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p>mike@example.com</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div>

<div class="column">
    <div class="card">
      <img src="../assets/Eric.jpeg" alt="Jane" style="width:100%">
      <div class="container">
        <h2>Eric</h2>
        <p class="title">The Css Guy</p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p>john@example.com</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div>



  <div class="column">
    <div class="card">
      <img src="../assets/Mike.jpeg" alt="Jane" style="width:100%">
      <div class="container">
        <h2>Erik</h2>
        <p class="title">The Everything Guy</p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p>john@example.com</p>
        <p><button class="button">Contact</button></p>
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

body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
  display: flex;
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
}

.about-section {
  padding: 50px;
  text-align: center;
  background-color: #474e5d;
  color: white;
}

.container {
  padding: 0 16px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
}

.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
}

.button:hover {
  background-color: #555;
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


</style>

