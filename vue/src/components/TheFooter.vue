<template>
<div class="footer">

    <nav class="navBar">
       <p class="menuLink"> Tech Elevator </p>
       <p class="menuLink"> Instagram </p>
       <p class="menuLink"> FaceBook </p>
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
nav {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-content: flex-end 
}

.menuLink {
    font-family: fantasy;
    height: 15px;
    width: 150px;
    background-color:rgb(170, 168, 168);
    color:black;
    border-color: black;
}
.menuLink:hover{
    height:65px;
    width: 160px;
    background-color:rgb(155, 4, 109);
    transition-duration: 0.2s;
    color: black;

}

.footer {
    background-color: rgb(170, 168, 168);
}


</style>