<template>
  <div style="overflow :hidden">
    <Header></Header>
    <div class="container">
      <div class="row">
        <div class="col-8">
          <router-view></router-view>
        </div>
        <div class="col-4">
          <p>ランキング</p>
        </div>
      </div>
    </div>
    
  </div>
</template>

<script>
import Vue from 'vue'
import VueRouter from 'vue-router'
import 'bootstrap/dist/css/bootstrap.css' 
import 'bootstrap-vue/dist/bootstrap-vue.css' 

import Table from './vue/table.vue'
import Header from './vue/header.vue'

Vue.config.productionTip = false

const router = new VueRouter({
  routes: [
    { path: '/',
      component: Table  }
  ]
})

Vue.use(VueRouter)

export default {
  router,
  components :{
    Header
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
 
 
</style>