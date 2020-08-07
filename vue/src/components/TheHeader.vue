<template>
<div class="menu">
    <nav class="navBar"> 
        <router-link class="menuLink" id="home" tag="button" v-bind:to="{ name: 'home' }">Home</router-link>
        <router-link class="menuLink" id="logout" tag="button" v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
        <router-link class="menuLink" id="about" tag="button"> About us </router-link> 
        <router-link class="menuLink" id="decks" tag="button" v-bind:to="{name:'decks'}"> Try It Now!</router-link> 
        <router-link class="menuLink" id="login" tag="button" :to="{ name: 'register' }">Register/Log In</router-link> 
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

.menuLink {
    font-family: fantasy;
    height: 30px;
    width: 150px;
    background-color:rgb(170, 168, 168);
    color:black;
    border-color: black;
    border-radius: 5px;
}
.menuLink:hover{
    height:35px;
    width: 160px;
    background-color: green;
    transition-duration: 0.2s;
    color: black;
}

.menu {
    background-color: rgb(170, 168, 168);
}
</style>
