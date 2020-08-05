<template>

<div class="wrapper">
   
    <header>Flash Cards</header>
<div class="menu">
    <nav class="navBar"> 
        <router-link class="menuLink" id="home" tag="button" v-bind:to="{ name: 'home' }">Home</router-link>
        <router-link class="menuLink" id="logout" tag="button" v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
        <router-link class="menuLink" id="about" tag="button"> About us </router-link> 
        <router-link class="menuLink" id="decks" tag="button" v-bind:to="{name:'decks'}"> Try It Now!</router-link> 
        <router-link class="menuLink" id="login" tag="button" :to="{ name: 'register' }">Register/Log In</router-link> 
    </nav>  
</div>

</div>



</template>

<script>




export default {
    
  name: "the-header",
  components: {
      
   
   
  }
  
  

};
</script>


<style scoped>
.wrapper {
    display: flex;
    margin: 0 auto;
   flex-direction: column;
}
.menu{
  display:flex;
  flex-direction: row;

}



header {
   /* background-image: url(../assets/artificial-intelligence.jpg);
  background-position: center;
  background-size: 285px; */
    animation-name: title;
    animation-duration: 1.5s;
    animation-fill-mode: backwards;
    text-shadow: 2px 2px 5px gray;
    display: flex;
    justify-content: center;
    background-color: white;
    color: #91ebf1;
    font-size: 100px;
    font-family: fantasy;
    width: 960px;
    flex-flow: row wrap;
    padding: 20px 0;
}
@keyframes title {
    from{color: white}
    to {color: black};
}

nav {
 float:left;
    height: 150px;
    width: 200px;
    margin-right: 10px;
      padding: 200px 0;
      display:flex;
      
     flex-direction: column;
  
  
}
.menuLink {
    margin-bottom: 20px;
    font-family: fantasy;
    height: 50px;
    width: 150px;
    background-color:gray;
    color:white;
    border-color: black;
    border-width: 2px;
    border-radius: 15px;
    
}
.menuLink:hover{
    height:65px;
    width: 160px;
    background-color: lightgray;
    transition-duration: 0.2s;
    color: black;
    
}

body {
  background-image: url(../assets/mind.webp);
  color: black;
  font-family: Helvetica;
  text-align: center;
  margin: 0;
  
}

header,
nav
 {
  border: 1px solid black;
  margin-bottom: 10px;
  border-radius: 3px;
}







</style>
