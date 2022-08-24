<template>
  <v-app :style="{ background: $vuetify.theme.themes.light.background }">
    <v-container>
      <v-row>
        <v-col cols="12" md="3" class="mb-4">
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
                Add Category
              </v-btn>
            </template>
            <!-- dialog content  -->
            <v-card>
              <v-card-title>
                <span class="text-h5">Add New Category</span>
              </v-card-title>
              <v-card-text>
                <v-container>
                  <v-row>
                    <v-col cols="12">
                      <v-text-field
                        label="Category Name"
                        v-model="category.name"
                        name="name"
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
                <v-btn color="blue darken-1" text @click="saveCat">
                  Save
                </v-btn>
              </v-card-actions>
            </v-card>

            <!-- end -->
          </v-dialog>
        </v-col>
      </v-row>
      <v-row>
        <v-col
          cols="12"
          md="3"
          class="mb-4"
          v-for="(tutorial, index) in categories"
          :key="index"
        >
          <v-card class="mx-auto" max-width="400">
            <v-img
              class="white--text align-end"
              height="200px"
              src="https://media.baamboozle.com/uploads/images/63585/1620620483_46537.jpeg"
            >
              <v-card-title>{{ tutorial.name }}</v-card-title>
            </v-img>

            <v-card-subtitle class="pb-0" v-model="catgory">
              {{ tutorial.id }}</v-card-subtitle
            >

            <v-card-text class="text--primary">
              <!-- <div>Whitehaven Beach</div>

              <div>Whitsunday Island, Whitsunday Islands</div> -->
            </v-card-text>

            <v-card-actions>
              <v-btn
                color="red"
                small
                text
                @click="deleteTutorial(tutorial.id)"
              >
                Delete
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-app>
</template>



<script>
import CategoriesService from "../services/CategoriesService";
export default {
  data: () => ({
    dialog: false,
    dialog2: false,
    categories: [],
    catgory: "",
    category: {
      id: null,
      name: "",
    },
  }),
  methods: {
    clear() {
      this.category.name = "";
    },
    retrieveCat() {
      CategoriesService.getAll().then((response) => {
        this.categories = response.data;
        console.log(response.data);
      });
      // .catch((e) => {
      //   //   console.log(e);
      // });
    },

    saveCat() {
      var data = {
        name: this.category.name,
      };
      CategoriesService.create(data)
        .then((response) => {
          this.category.id = response.data.id;
          console.log(response.data);
          this.dialog = false;
          this.retrieveCat();
          //   this.submitted = true;
        })
        .catch((e) => {
          console.log(e);
        });
      this.retrieveCat();
    },
    deleteTutorial(id) {
      CategoriesService.delete(id)
        .then((response) => {
          console.log(response.data);
          this.retrieveCat();
          // this.$router.push({ name: "categories" });
        })
        .catch((e) => {
          console.log(e);
        });
    },
  },
  watch: {
    dialog: function (val) {
      if (val) {
        this.category.name = "";
        // this.lastName = '';
        // this.email = '';
        // this.profession = '';
      }
    },
  },
  mounted() {
    this.retrieveCat();
  },

  components: {},
};
</script>