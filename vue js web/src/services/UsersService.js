import http from "../http-common";

class UsersService {
    getAll() {
        return http.get("/users");
    }

    create(data) {
        return http.post("/register", data);
    }

    // update(id,data) {
    //   return http.post('/update/'+id, data);
    // }

    //   delete(id) {
    //     return http.post(`/delete/${id}`);
    //   }
}

export default new UsersService();