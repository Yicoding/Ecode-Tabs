import Vue from 'vue'
import Router from 'vue-router'
Vue.use(Router)

import site from 'components/site'
import knowledge from 'components/knowledge'
import knowledgeDetail from 'components/knowledge-detail'
import text from 'components/text'
import edit from 'components/edit'
import book from 'components/book'
import ball from 'components/ball'
import car from 'components/car'
import h5 from 'components/h5'

// // 路由懒加载
// const site = () => import('components/site')
// const knowledge = () => import('components/knowledge')
// const knowledgeDetail = () => import('components/knowledge-detail')
// const text = () => import('components/text')
// const edit = () => import('components/edit')
// const book = () => import('components/book')
// const ball = () => import('components/ball')
// const car = () => import('components/car')
// const h5 = () => import('components/h5')

export default new Router({
  // mode: 'history',
  routes: [
    { path: '/site', component: site },
    { path: '/knowledge', component: knowledge },
    { path: '/knowledgeDetail/:id', component: knowledgeDetail },
    { path: '/text', component: text },
    { path: '/edit/:id', component: edit },
    { path: '/book', component: book },
    { path: '/ball', component: ball },
    { path: '/car', component:  car },
    { path: '/h5', component:  h5 },
    { path: '*', redirect: '/site'}
  ]
})
