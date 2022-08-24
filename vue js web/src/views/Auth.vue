<template>
  <v-container>
    <v-row align="center" justify="center">
      <v-col cols="12" sm="10">
        <v-card class="elevation-6 mt-10">
          <v-row>
            <v-col cols="12" md="6" class="red rounded-br-xl">
              <div style="text-align: center; padding: 180px 0">
                <v-card-text class="white--text">
                  <h1 class="text-center">Al-Anfal Inventory System</h1>
                  <br />
                  <h2 class="text-center">Login Form</h2>
                </v-card-text>
              </div>
            </v-col>

            <v-col cols="12" md="6">
              <v-card-text class="mt-12">
                <h2 class="text-center">Sign In!</h2>

                <v-row align="center" justify="center">
                  <v-col cols="12" sm="8">
                    <v-text-field
                      label="Email"
                      outlined
                      dense
                      color="red"
                      autocomplete="false"
                      v-model="email"
                    />
                    <v-text-field
                      label="Password"
                      outlined
                      dense
                      color="red"
                      autocomplete="false"
                      type="password"
                      v-model="password"
                    />

                    <v-btn color="red" @click="login" block tile>Sign In</v-btn>
                  </v-col>
                </v-row>
              </v-card-text>
            </v-col>
          </v-row>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import { mapMutations } from "vuex";
export default {
  data: () => ({
    email: "",
    password: "",
  }),
  props: {
    source: String,
  },
  methods: {
    ...mapMutations(["setUser", "setToken"]),
    async login(e) {
      e.preventDefault();
      const response = await fetch("http://127.0.0.1:8000/api/login", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          email: this.email,
          password: this.password,
        }),
      });
      const { user, token } = await response.json();
      this.setUser(user);
      this.setToken(token);
      if (response.status == 201) {
        this.$router.push("/categories");
      }
    },
  },
};
</script>
<style scoped>
.v-application .rounded-bl-xl {
  border-bottom-left-radius: 300px !important;
}
.v-application .rounded-br-xl {
  border-bottom-right-radius: 300px !important;
}
</style>
