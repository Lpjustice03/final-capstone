<template>
<div class="loginPage">
  <div id="login" class="text-center">
    <form class="form-signin" @submit.prevent="login">
      <div>
        <h1 class="h3 mb-3 font-weight-normal">Please Sign In</h1>
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
        <div class="registerLink">
        <router-link class="link" :to="{ name: 'register' }">Need an account?</router-link>
        </div>
    </form>
  </div>
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
            this.$router.push("/decks");
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
.loginPage{
  height: 100%;
  padding: 8%;
  text-align: center;
  background-image: url(../assets/books.jpg); 
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center;
  margin:0%;  
  min-height: 63vh;
}

/* .text-center {
  height: 100%;
  padding: 8%;
  text-align: center;
  background-image: url(../assets/books.jpg); 
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center;
  margin:0%;  
  
} */

h1 {
  text-shadow: -1px 1px 2px #53224f, 1px 1px 2px  #53224f, 1px -1px 0  #53224f, -1px -1px 0  #53224f;
  font-size: 50px;
  color:#F7C331;
}

input[type=text] {
  width: 50%;
  padding: 10px;
  margin:10px 20%;
  border-radius: 12px;
  opacity:1;
   margin-left: 25%;
margin-right: 30%;
}

input[type=password] {
  width: 50%;
  padding: 10px;
  margin:10px 20%;
  border-radius: 12px;
   margin-left: 25%;
margin-right: 30%;
}

.border-customized-input {
   border: 2px solid #eee;
}

button {
  appearance:none;
  -webkit-appearance:none;
  background: #F7882F;
  text-shadow: -1px 1px 2px  #4e204a,  1px 1px 2px  #4e204a,  1px -1px 0 #4e204a, -1px -1px 0 #4e204a;
  color:#F7C331;
  font-weight:600;
  width: 52%;
  padding: 10px;
  margin:15px 20%;
  border-radius: 12px;
  font-size: 20px;
 margin-left: 25%;
margin-right: 30%;
}

button:hover {
background:  #F7C331;;
color:#F7882F;

}

.link {
  display:flex;
  justify-content: center;
  margin:10px;
  font-size:30px;
  color:  #F7C331;
}

.link:hover {
  color: #F7882F;
}

label {
 text-shadow: -1px 1px 2px #4e204a, 1px 1px 2px #4e204a, 1px -1px 0 #4e204a,  -1px -1px 0  #4e204a;
 color: #F7C331;
  font-size: 30px;
  
}

.registerLink{
  background: transparent;
  text-shadow: 2px 2px #6e6e6e;
  margin-right: 42%;
  margin-left: 42%;

}
</style>
