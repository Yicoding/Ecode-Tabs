/**
 * Created by Administrator on 2016/11/5.
 */
import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)
import axios from 'axios'

const store = new Vuex.Store({
  state: {
    user: {},
    project: '33',
  },
  getters: {
    // config: state => state.config
  },
  mutations: {
    setConfig: (state, config) => {
      state.config = config
    },
    setProject: (state, putproject) => {
      state.project = putproject
    },
    setNum: (state, data) => {
      state.Num = data
    }
  },
  actions: {
    getProject (store, data) {
      store.commit('setProject', data)
    },
    getConfig (store) {
      store.commit('setConfig', {'name': '呼啦'})
    },
    getNum (store, data) {
      store.commit('setNum', data)
    }
  }
})
export default store
