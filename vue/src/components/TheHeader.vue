<template>
<div class="menu">
    <nav class="navBar"> 
        <router-link class="menuLink" id="home" tag="button" v-bind:to="{ name: 'home' }">Home</router-link>
        <router-link class="menuLink" id="about" tag="button" v-bind:to="{ name: 'AboutUs' }"> About us </router-link>
        <router-link class="menuLink" id="decks" tag="button" v-bind:to="{name:'decks'}"> Try It Now!</router-link> 
        <router-link class="menuLink" id="logout" tag="button" v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link> 
        <router-link class="menuLink" id="login" tag="button" :to="{ name: 'register' }">Register/Log In</router-link> 

    </nav>  
    <p v-if="$store.state.token != ''"> Welcome {{$store.state.user.username}} </p>
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

.menuLink {
    font-family: Arial, Helvetica, sans-serif;
    height: 30px;
    width: 150px;
    background-color:rgb(209, 196, 129);
    color:black;
    border: none;

}
.menuLink:hover{
    height:31px;
    width: 151px;
    background-color: #815b7e;
    transition-duration: 0.2s;
    color: rgb(209, 196, 129);
}

.menu {
    background-color: rgb(209, 196, 129);
}
</style>
