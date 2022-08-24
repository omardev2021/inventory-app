import http from "../http-common";

class ProductsService {
    getAll() {
        return http.get("/products");
      }

      create(data) {
        return http.post("/products", data);
      }
}

export default new ProductsService();