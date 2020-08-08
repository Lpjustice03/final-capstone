<template>
<div class="menu">
    <nav class="navBar"> 
        <div class="Welcome" v-if="$store.state.token != ''"> Welcome {{$store.state.user.username}} </div>
        <router-link class="menuLink" id="home" tag="button" v-bind:to="{ name: 'home' }">Home</router-link>
        <router-link class="menuLink" id="about" tag="button" v-bind:to="{ name: 'AboutUs' }"> About us </router-link>
        <router-link class="menuLink" id="decks" tag="button" v-bind:to="{name:'decks'}"> Try It Now!</router-link> 
        <router-link class="menuLink" id="logout" tag="button" v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link> 
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

.Welcome {
    transform: translate(-0%,20%);
    font-family: Arial, Helvetica, sans-serif;
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

.navBar {
    display: grid;
    grid-template-columns: .99fr 0fr 0fr 0fr 0fr;
    grid-template-areas:
    "header header1 header2 header3 header4 header5";
    grid-gap: 20px;
}


.Welcome {
    grid-area: header;
}
#home {
    grid-area: header1;
}

#about {
    grid-area: header2;
}

#decks {
    grid-area: header3;
}

#logout {
    grid-area: header4;
}

#login {
    grid-area: header5;
}

</style>
