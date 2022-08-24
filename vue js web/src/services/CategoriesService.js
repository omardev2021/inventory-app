import http from "../http-common";

class CategoriesService {
    getAll() {
        return http.get("/categories");
      }

      create(data) {
        return http.post("/categories", data);
      }

      // update(id,data) {
      //   return http.post('/update/'+id, data);
      // }

      delete(id) {
        return http.post(`/delete/${id}`);
      }
}

export default new CategoriesService();