

<template>
  <v-container>
    <v-dialog v-model="dialog" persistent max-width="600px">
      <template v-slot:activator="{ on, attrs }">
        <v-btn
          rounded
          color="red"
          dark
          v-bind="attrs"
          v-on="on"
          @click="dialog = true"
        >
          Add Admin
        </v-btn>
      </template>
      <!-- dialog content  -->
      <v-card>
        <v-card-title>
          <span class="text-h5">Add New Admin</span>
        </v-card-title>
        <v-card-text>
          <v-container>
            <v-row>
              <v-col cols="12">
                <v-text-field
                  label="Name"
                  v-model="user.name"
                  name="name"
                  required
                ></v-text-field>
              </v-col>
              <v-col cols="12">
                <v-text-field
                  label="Email"
                  v-model="user.email"
                  name="email"
                  required
                ></v-text-field>
              </v-col>
              <v-col cols="12">
                <v-text-field
                  label="password"
                  v-model="user.password"
                  name="password"
                  required
                ></v-text-field>
              </v-col>
            </v-row>
          </v-container>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="blue darken-1" text @click="dialog = false">
            Close
          </v-btn>
          <v-btn color="blue darken-1" text @click="saveUser"> Save </v-btn>
        </v-card-actions>
      </v-card>

      <!-- end -->
    </v-dialog>
    <h2>All Users</h2>
    <v-card>
      <v-card-title>
        <v-text-field
          v-model="search"
          append-icon="mdi-magnify"
          label="Search"
          single-line
          hide-details
        ></v-text-field>
      </v-card-title>
      <v-data-table
        :headers="headers"
        :items="users"
        :search="search"
      ></v-data-table>
    </v-card>
  </v-container>
</template>

<script>
import UsersService from "../services/UsersService";
export default {
  data() {
    return {
      dialog: false,
      users: [],
      user: {
        id: null,

        name: "",
        email: "",
        password: "",
        role: "admin",
      },
      headers: [
        {
          text: "ID",
          align: "start",
          sortable: false,
          value: "id",
        },
        { text: "Name", value: "name" },
        { text: "Email ", value: "email" },
        { text: "Registerd At", value: "created_at" },
        { text: "Role", value: "role" },
      ],
      desserts: [
        {
          name: "Frozen Yogurt",
          calories: 159,
          fat: 6.0,
          carbs: 24,
          protein: 4.0,
          iron: "1%",
        },
        {
          name: "Ice cream sandwich",
          calories: 237,
          fat: 9.0,
          carbs: 37,
          protein: 4.3,
          iron: "1%",
        },
        {
          name: "Eclair",
          calories: 262,
          fat: 16.0,
          carbs: 23,
          protein: 6.0,
          iron: "7%",
        },
        {
          name: "Cupcake",
          calories: 305,
          fat: 3.7,
          carbs: 67,
          protein: 4.3,
          iron: "8%",
        },
        {
          name: "Gingerbread",
          calories: 356,
          fat: 16.0,
          carbs: 49,
          protein: 3.9,
          iron: "16%",
        },
        {
          name: "Jelly bean",
          calories: 375,
          fat: 0.0,
          carbs: 94,
          protein: 0.0,
          iron: "0%",
        },
        {
          name: "Lollipop",
          calories: 392,
          fat: 0.2,
          carbs: 98,
          protein: 0,
          iron: "2%",
        },
        {
          name: "Honeycomb",
          calories: 408,
          fat: 3.2,
          carbs: 87,
          protein: 6.5,
          iron: "45%",
        },
        {
          name: "Donut",
          calories: 452,
          fat: 25.0,
          carbs: 51,
          protein: 4.9,
          iron: "22%",
        },
        {
          name: "KitKat",
          calories: 518,
          fat: 26.0,
          carbs: 65,
          protein: 7,
          iron: "6%",
        },
      ],
    };
  },
  methods: {
    retrieveUsers() {
      UsersService.getAll().then((response) => {
        this.users = response.data;
        console.log(response.data);
      });
    },
    saveUser() {
      var data = {
        name: this.user.name,
        email: this.user.email,
        password: this.user.password,
        role: this.user.role,
      };
      UsersService.create(data)
        .then((response) => {
          this.user.id = response.data.id;
          console.log(response.data);
          this.dialog = false;
          // this.retrieveProducts();
          //  this.retrieveCat();
          //   this.submitted = true;
        })
        .catch((e) => {
          console.log(e);
        });
        this.retrieveUsers();
    },
  },
  mounted() {
    this.retrieveUsers();
  },
};
</script>