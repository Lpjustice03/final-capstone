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
    font-family: Arial, Helvetica, sans-serif;    
    height: 15px;
    width: 150px;
    background-color:rgb(209, 196, 129);
    color:black;
    border-color: black;
}
.menuLink:hover{
    height:30px;
    width: 160px;
    background-color:#815b7e;
    transition-duration: 0.2s;
    color: rgb(209, 196, 129);

}

.footer {
    background-color: rgb(209, 196, 129);
    margin-bottom: 0;
}


</style>