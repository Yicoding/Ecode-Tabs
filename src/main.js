// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import axios from 'axios'
import store from './store'
import 'element-ui/lib/theme-chalk/index.css'
import ElementUI from 'element-ui'
Vue.use(ElementUI)
Vue.prototype.$http = axios
Vue.prototype.resource = 'http://localhost:9000'
Vue.config.productionTip = false
// 图标
import 'assets/style.css'
// 自定义样式
import 'assets/main.css'
/* eslint-disable no-new */
new Vue({
  el: '#app',
  store,
  router,
  template: '<App/>',
  components: { App }
})
