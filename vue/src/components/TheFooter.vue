<template>
<div class="footer">

    <nav class="navBar">
       <img src="../assets/facebook.png" />
       <img src="../assets/instagram.png" />
       <img src="../assets/twitter.png" />      
    </nav>



</div>
</template>

<script>
export default {
    
  name: "the-footer",
  components: {
  }
};
</script>

<style scoped>

.navBar {
    display: flex;
    flex-direction: row;
    justify-content: center;
    /* align-content: flex-end; */
}

img {
    margin-left: 55px;
    margin-right: 55px;
}
/* .menuLink {
    text-align: center;
    font-family: Arial, Helvetica, sans-serif;    
    height: 15px;
    width: 150px;
    background-color:rgb(209, 196, 129);
    color:#53224f;
    border-color: black;
}
.menuLink:hover{
    height:30px;
    width: 160px;
    background-color:#815b7e;
    transition-duration: 0.2s;
    color: rgb(209, 196, 129);

} */

.footer {
    background-color: rgb(209, 196, 129);
    margin-bottom: 0;
}


</style>