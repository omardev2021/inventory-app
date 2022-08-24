import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Categories from '../views/Categories.vue'
import Auth from '../views/Auth.vue'
import User from '../views/User.vue'
import About from '../views/About.vue'


Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'auth',
    component: Auth
  },
  {
    path: '/categories',
    name: 'categories',
    component: Categories
  },
  {
    path: '/home',
    name: 'home',
    component: Home
  },
  {
    path: '/users',
    name: 'user',
    component: User
  },
  {
    path: '/users-list',
    name: 'users-list',
    component: About
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
