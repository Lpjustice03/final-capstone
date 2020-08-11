<template>
<body>
  <div>
    <div class="about-section">
  <h1>About Us</h1>
  <p> We are the creators of FlipDeck.  After going through a rigorous program at Tech Elevator, we all banded together to create this super awesome app. </p>
  <p>We are the coolest people alive so you should get to know us.</p>
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
        <p> h</p>
        <p> h</p>
        <p> h</p>


        <p>Omer.ali17@gmail.com</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div>

<div class="column">
    <div class="card">
     <img src="../assets/Lance.jpeg" alt="Jane" style="width:100%">
            <div class="container">
        <div class="cardProp">
        <h2 class="names">Lance Justice </h2>
        <p class="title">The Vue Guy</p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p class="emails">mike@example.com</p>
        <p><button class="button">Contact</button></p>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="row">
<div class="column">
    <div class="card">
      <img src="../assets/Eric.jpeg" alt="Jane" style="width:100%">
      <div class="container">
        <h2>Erik Leopard</h2>
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
        <h2>Mike Finegan</h2>
        <p class="title">The Everything Guy</p>
        <p> Hello, I'm Michael Finegan. This is a generic description about who I am and Why I'm 'The Everything Guy.'</p>
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
}


.about-section {
  padding: 50px;
  text-align: center;
  background-color: rgb(214, 182, 137);
  color: black;
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
  color: #F7C331;
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
  width: 33%;
  justify-content: center;
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

.row {
  display: flex;
  justify-content: center;
  justify-items: center;
}

</style>

