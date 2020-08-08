<template>
<div class="menu">

    <nav class="navBar"> 
        <div class="Welcome" v-if="$store.state.token != ''"> Welcome {{$store.state.user.username}} </div>
        <div v-if="$store.state.token == ''">
        <router-link class="menuLink" id="home" tag="button" v-bind:to="{ name: 'home' }">Home</router-link>
        <router-link class="menuLink" id="about" tag="button" v-bind:to="{ name: 'AboutUs' }"> About us </router-link>
        <router-link class="menuLink" id="decks" tag="button" v-bind:to="{name:'TrialPage'}"> Try it now! </router-link> 
        <router-link class="menuLink" id="logout" tag="button" v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link> 
        <router-link class="menuLink" id="login" tag="button" :to="{ name: 'register' }">Register/Log In</router-link> 
        </div>
        <div class="try it" v-else>
             <router-link class="menuLink" id="home" tag="button" v-bind:to="{ name: 'home' }">Home</router-link>
         <router-link class="menuLink" id="about" tag="button" v-bind:to="{ name: 'AboutUs' }"> About us </router-link>
            <router-link class="menuLink" id="decks" tag="button" v-bind:to="{name:'decks'}"> decks </router-link>
            <router-link class="menuLink" id="logout" tag="button" v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
        </div>
        
    </nav>  

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
nav {
    display: flex;
    flex-direction: row;
    justify-content: flex-end; 
}


.Welcome {
    transform: translate(5%, 15%);
    font-family: Arial, Helvetica, sans-serif;
    height: 30px;
    width: 150px;
    color: black;
    font-size: 20px;

}
.menuLink {
    font-family: Arial, Helvetica, sans-serif;
    height: 30px;
    width: 150px;
    background-color:rgb(209, 196, 129);
    color:black;
    border: none;
    justify-content: flex-end; 

}
.menuLink:hover{
    height:31px;
    width: 151px;
    background-color: #815b7e;
    transition-duration: 0.2s;
    color: rgb(209, 196, 129);
}

.menu {
    height: 30px;
    background-color: rgb(209, 196, 129);


}

@media only screen and (max-width: 600px){

  .navBar {
        grid-template-areas:
        "header"
        "header1"
        "header2"
        "header3"
        "header4"
        "header5";
        grid-template-columns: 0.5fr;
    }
}


</style>
