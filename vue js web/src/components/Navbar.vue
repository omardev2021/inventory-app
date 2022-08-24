<template>
  <nav v-if="show">
    <v-app-bar color="white" dark app class="line">
      <v-toolbar-title class="text-uppercase red--text">
        <span class="font-weight-light">Al-Anfal </span>
        <span>Inventory</span>
      </v-toolbar-title>
    </v-app-bar>
    <v-navigation-drawer v-model="drawer" dark app mini-variant class="red">
      <v-list flat>
        <v-list-item class="mb-12">
          <v-list-item-action>
            <v-icon>fa-solid fa-warehouse</v-icon>
          </v-list-item-action>
        </v-list-item>
        <v-list-item router to="categories">
          <v-list-item-action>
            <v-icon>fa-solid fa-shapes</v-icon>
          </v-list-item-action>
        </v-list-item>
        <v-list-item router to="home">
          <v-list-item-action>
            <v-icon>fa-solid fa-cart-arrow-down</v-icon>
          </v-list-item-action>
        </v-list-item>
        <v-list-item router to="users">
          <v-list-item-action>
            <v-icon>fas fa-city</v-icon>
          </v-list-item-action>
        </v-list-item>
        <v-list-item router to="users-list">
          <v-list-item-action>
            <v-icon>fas fa-cog</v-icon>
          </v-list-item-action>
        </v-list-item>
      </v-list>
      <v-list style="position: absolute; bottom: 0" class="ml-3" flat>
        <v-list-item @click="logout">
          <v-list-item-action>
            <v-icon>fas fa-sign-out-alt</v-icon>
          </v-list-item-action>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
  </nav>
</template>
<script>
import { mapGetters } from "vuex";
export default {
  data: () => ({
    dialog: false,
    drawer: true,
    show: true,

    categories: [],

    links: [
      { icon: "fas fa-desktop", route: "/" },
      { icon: "fas fa-shopping-cart", route: "/shopping" },
      { icon: "fas fa-city", route: "/city" },
      { icon: "fas fa-cog" },
    ],
  }),
  components: {},
  methods: {
    async logout() {
      await this.$store.dispatch("LogOut");
      this.show = false;
      this.$router.push("/");
     
    },
  },
  computed: {
    ...mapGetters(["isLoggedIn"]),
  },
};
</script>
<style scoped>
.border {
  border-left: 4px solid #0ba518;
}
</style>
