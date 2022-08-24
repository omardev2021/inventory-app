<template>
  <v-app>
    <Navbar />
    <v-content>
      <router-view></router-view>
    </v-content>
  </v-app>
</template>

<script>
import Navbar from "@/components/Navbar";
import { mapGetters } from "vuex";
export default {
  name: "App",

  components: {
    Navbar,
  },
  computed: {
    ...mapGetters(["isLoggedIn"]),
  },

  data: () => ({
    //
  }),
};
</script>
