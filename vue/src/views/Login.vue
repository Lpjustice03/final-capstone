<template>
  <div id="login" class="text-center">
    <!-- <img src= ../assets/artificial-intelligence.jpg id= "background-image"> -->
    <form class="form-signin" @submit.prevent="login">
      <div><h1 class="h3 mb-3 font-weight-normal">Please Sign In</h1>
      </div>
      <div
        class="alert alert-danger"
        role="alert"
        v-if="invalidCredentials"
      >Invalid username and password!</div>
      <div
        class="alert alert-success"
        role="alert"
        v-if="this.$route.query.registration"
      >Thank you for registering, please sign in.</div>
      <label for="username" class="sr-only">Username</label>
      <input
        type="text"
        id="username"
        class="form-control"
        placeholder="Username"
        v-model="user.username"
        required
        autofocus
      />
      <label for="password" class="sr-only">Password</label>
      <input
        type="password"
        id="password"
        class="form-control"
        placeholder="Password"
        v-model="user.password"
        required
      />
        <button type="submit">Sign in</button>
        <router-link class="link" :to="{ name: 'register' }">Need an account?</router-link>
    </form>
  </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            authService.getUserId(this.user).then((response) =>
            {
              this.$store.commit("SET_USER_ID", response.data)
            });
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>
<style scoped>


/* *, *:before, *:after {
  text-align: center;
  
} */

.text-center {
  height: 100%;
  padding: 8%;
  text-align: center;
  background-image: url(../assets/login.jpeg); 
  background-repeat: no-repeat;
  background-size: cover;
  margin:0%;  
}

h1 {
  text-shadow: -1px 1px 2px #23430C, 1px 1px 2px #23430C, 1px -1px 0 #23430C, -1px -1px 0 #23430C;
  font-size: 50px;
  color:burlywood;
}
input[type=text] {
  width: 50%;
  padding: 10px;
  margin:10px 20%;
  border-radius: 12px;
  opacity:1;
}
input[type=password] {
  width: 50%;
  padding: 10px;
  margin:10px 20%;
  border-radius: 12px;
}
.border-customized-input {
   border: 2px solid #eee;
}
button {
  appearance:none;
  -webkit-appearance:none;
  background:burlywood;
  text-shadow: -1px 1px 2px #23430C,  1px 1px 2px #23430C,  1px -1px 0 #23430C, -1px -1px 0 #23430C;
 color: burlywood;
  font-weight:600;
  width: 52%;
  padding: 10px;
  margin:15px 20%;
  border-radius: 12px;
  font-size: 20px;
}
button:hover {
background: rgb(223, 177, 118);
color:rgb(17, 13, 235);
width: 53%;
height: 13.5%;
padding: 10px;
margin:10px 20%;
}
.link {
  display:flex;
  justify-content: center;
  margin:10px;
  font-size:30px;
  color: blue;
}
.link:hover {
  color:rgb(87, 87, 245);
}
label {
text-shadow: -1px 1px 2px #23430C, 1px 1px 2px #23430C, 1px -1px 0 #23430C,  -1px -1px 0 #23430C;
 color: burlywood;
  font-size: 30px;
}
</style>
