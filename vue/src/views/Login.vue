<template>
  <div id="login" class="text-center">
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


*, *:before, *:after {
  box-sizing: border-box;
  text-align: center;
}

.text-center {
  margin: 15%;  
}
input[type=text] {
  width: 20%;
  padding: 10px;
  margin:10px 10px;
  box-shadow:0 0 15px 4px rgba(0,0,0,0.06);
  border-radius: 12px;
}
input[type=password] {
  padding: 10px;
  margin:10px 10px;
  border-radius: 12px;
  width: 20%;
}
.border-customized-input {
   border: 2px solid #eee;
}
button {
  appearance:none;
  -webkit-appearance:none;
  padding:10px;
  border:none;
  background-color:rgb(148, 146, 146);
  color:black;
  font-weight:600;
  border-radius:5px;
  width:15%;
  height: 13%;
  margin: 10px 10px;
}
button:hover {
background-color: gray;
color:rgb(17, 13, 235);
width: 15.25%;
height: 13.5%;
}
.link {
  display:flex;
  justify-content: center;
  margin:10px;
  font-size:20px;
  color: rgb(95, 95, 240)
}
.link:hover {
  color:blue;
}
label {
  font-size: 25px;
}
</style>
