<template>
  <v-app :style="{ background: $vuetify.theme.themes.light.background }">
    <v-container>
      <v-row mb="3" class="mb-8">
        <!-- <v-col cols="12" md="4">
            <v-text-field
            label="Search items"
            prepend-icon="search"
            color="red"
            error
          ></v-text-field>
          </v-col> -->

        <!-- start -->
        <v-dialog v-model="dialog" persistent max-width="600px">
          <template v-slot:activator="{ on, attrs }">
            <v-col cols="12" md="4">
              <v-btn rounded color="red" dark v-bind="attrs" v-on="on">
                Add Product
              </v-btn>
            </v-col>
            <!-- <v-col cols="12" md="4"> -->
          </template>
          <v-form v-model="isValid">
            <!-- card -->
            <v-card>
              <v-card-title>
                <span class="text-h5">Add New Product</span>
              </v-card-title>
              <v-card-text>
                <v-container>
                  <v-row>
                    <v-col cols="12" sm="6" md="4">
                      <v-text-field
                        label="Product Name"
                        required
                        v-model="product.name"
                        :rules="[(v) => !!v || 'Item is required']"
                        name="name"
                      ></v-text-field>
                    </v-col>
                    <v-col cols="12" sm="6" md="4">
                      <v-text-field
                        type="number"
                        label="Product Quantity"
                        hint="example of helper text only on focus"
                        v-model="product.quantity"
                        name="quantity"
                        :rules="[numberRule]"
                      ></v-text-field>
                    </v-col>
                    <v-col cols="12" sm="6" md="4">
                      <v-text-field
                        type="date"
                        label="Product Expiration Date"
                        hint="example of persistent helper text"
                        v-model="product.exp_date"
                        :rules="[
                          (v) => !!v || 'Item is required',
                          (v) =>
                            v >=new Date().toISOString().substr(0, 10) ||
                            'error',
                        ]"
                        name="exp_date"
                        persistent-hint
                        :min="new Date().toISOString().substr(0, 10)"
                        :allowed-dates="
                          (date) =>
                            date < new Date().toISOString().substr(0, 10)
                        "
                        required
                      ></v-text-field>
                    </v-col>
                    <v-col cols="12">
                      <v-text-field
                        label="Product Description"
                        required
                        :rules="[(v) => !!v || 'Item is required']"
                        v-model="product.desciption"
                        name="desciption"
                      ></v-text-field>
                    </v-col>
                    <v-col cols="12">
                      <v-text-field
                        label="Product Image Url"
                        type="text"
                        v-model="product.image_url"
                        :rules="[(v) => !!v || 'Item is required']"
                        name="image_url"
                        required
                      ></v-text-field>
                    </v-col>
                    <v-col cols="12" sm="6">
                      <v-select
                        :items="categories"
                        item-text="name"
                        item-value="id"
                        v-model="product.category_id"
                        :rules="[(v) => !!v || 'Item is required']"
                        name="category_id"
                        label="Product Category"
                        required
                      ></v-select>
                    </v-col>
                    <v-col cols="12" sm="6">
                         <v-text-field
                        type="number"
                        label="Product Price"
                        hint="example of helper text only on focus"
                        v-model="product.price"
                        name="price"
                        :rules="[numberRule]"
                      ></v-text-field>
                    </v-col>
                  </v-row>
                </v-container>
                <small>*indicates required field</small>
              </v-card-text>
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="blue darken-1" text @click="dialog = false">
                  Close
                </v-btn>
                <v-btn
                  color="blue darken-1"
                  :disabled="!isValid"
                  text
                  @click="saveProduct"
                >
                  Save
                </v-btn>
              </v-card-actions>
            </v-card>
            <!-- card end -->
          </v-form>
        </v-dialog>
        <!-- </v-col> -->

        <!-- end -->
        <v-spacer></v-spacer>
        <span class="red--text mt-9">{{ products.length }} Products</span>
      </v-row>
      <v-row>
        <v-col
          cols="12"
          md="3"
          class="mb-4"
          v-for="(product, index) in products"
          :key="index"
        >
          <v-hover v-slot:default="{ hover }">
            <v-card max-width="250" max-heith="250" align="center">
              <v-card-actions color="">
                <v-spacer></v-spacer>
                <v-btn icon>
                  <v-icon>edit</v-icon>
                </v-btn>
              </v-card-actions>
              <v-img :src="product.image_url" width="150" height="150"></v-img>

              <v-card-text class="red--text">
                {{ product.name }}
              </v-card-text>
              <v-expand-transition>
                <div
                  v-if="hover"
                  class="
                    d-flex
                    transition-fast-in-fast-out
                    red
                    v-card--reveal
                    display-3
                    white--text
                  "
                  style="height: 100%"
                >
                  <v-btn outlined color="white"> Detail</v-btn>
                </div>
              </v-expand-transition>
              <v-btn
                absolute
                color="red"
                class="white--text"
                fab
                large
                left
                top
              >
                <h1>{{ product.quantity }}</h1>
              </v-btn>
            </v-card>
          </v-hover>
        </v-col>
      </v-row>
    </v-container>
  </v-app>
</template>

<script>
// @ is an alias to /src
import ProductsService from "../services/ProductsService";
import CategoriesService from "../services/CategoriesService";
export default {
  name: "home",
  data: () => ({
    numberRule: (v) => {
      (v) => !!v || "Item is required";
      if (!v.trim()) return true;
      if (!isNaN(parseFloat(v)) && v > 0 ) return true;
      return "Number has to be grater than 1";
    },
    nameRules: [
      (v) => !!v || "Name is required",
      (v) => (v && v.length <= 10) || "Name must be less than 10 characters",
    ],
    dialog: false,
    isValid: true,
    products: [],
    categories: [],
    product: {
      id: null,
      name: "",
      quantity: "",
      exp_date: "",
      category_id: "",
      image_url: "",
      desciption: "",
      price: "",
    },
  }),
  components: {},
  computed: {
    theme() {
      return this.$vuetify.theme.dark ? "dark" : "light";
    },
  },
  methods: {
    retrieveProducts() {
      ProductsService.getAll().then((response) => {
        this.products = response.data;
        console.log(response.data);
      });
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

    saveProduct() {
      var data = {
        name: this.product.name,
        desciption: this.product.desciption,
        exp_date: this.product.exp_date,
        category_id: this.product.category_id,
        quantity: this.product.quantity,
        image_url: this.product.image_url,
        price: this.product.price,
      };
      ProductsService.create(data)
        .then((response) => {
          this.product.id = response.data.id;
          console.log(response.data);
          this.dialog = false;
          this.retrieveProducts();
          //  this.retrieveCat();
          //   this.submitted = true;
        })
        .catch((e) => {
          console.log(e);
        });
    },
    validate() {
      this.$refs.form.validate();
    },
  },
  mounted() {
    this.retrieveProducts();
    this.retrieveCat();
  },
};
</script>
<style>
.v-card--reveal {
  align-items: center;
  bottom: 0;
  justify-content: center;
  opacity: 0.5;
  position: absolute;
  width: 100%;
}
</style>