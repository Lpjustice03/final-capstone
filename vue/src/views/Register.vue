<template>
  <div id="register" class="text-center" >
    <form class="form-register" @submit.prevent="register">
      <h1 class="h3 mb-3 font-weight-normal">Create Account</h1>
      <div class="alert alert-danger" role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>
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
      <input
        type="password"
        id="confirmPassword"
        class="form-control"
        placeholder="Confirm Password"
        v-model="user.confirmPassword"
        required
      />
      <button class="btn btn-lg btn-primary btn-block" type="submit">
        Create Account
      </button>
      <router-link class="link" :to="{ name: 'login' }">Have an account?</router-link>
    </form>
  </div>
</template>

<script>
import authService from '../services/AuthService';

export default {
  name: 'register',
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
};
</script>

<style scoped>

/* *, *:before, *:after {
  box-sizing: border-box;
  text-align: center;
} */

.text-center {
  display:flex;
  align-items: center;
  justify-content: center;
  height: 100%;
  padding: 5%;
  text-align: center;
  background-image: url(../assets/graph.jpeg);
  background-color: black; 
  
  background-repeat: no-repeat;
  background-size: cover;
  margin:0%;    
}
h1 {
  text-shadow: -1px 1px 2px #23430C, 1px 1px 2px #23430C,px -1px 0 #23430C, -1px -1px 0 #23430C;
  font-size: 50px;
  color:burlywood;
}
input[type=text] {
  width: 60%;
  padding: 10px;
  margin:10px 20%;
  border-radius: 12px;
  opacity:1;
}
input[type=password] {
  width: 60%;
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
  text-shadow: -1px 1px 2px #23430C, 1px 1px 2px #23430C, 1px -1px 0 #23430C,-1px -1px 0 #23430C;
 color: burlywood;
  font-weight:600;
  width: 63%;
  padding: 10px;
  margin:15px 20%;
  border-radius: 12px;
  font-size: 20px;
}
button:hover {
background: rgb(223, 177, 118);
color:rgb(17, 13, 235);
width: 64%;
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
  text-shadow: -1px 1px 2px #23430C,  1px 1px 2px #23430C,  1px -1px 0 #23430C,  -1px -1px 0 #23430C;
  color:burlywood;
  font-size: 25px;
}
</style>


