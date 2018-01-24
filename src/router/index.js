import Vue from 'vue'
import Router from 'vue-router'

import site from 'components/site'
import knowledge from 'components/knowledge'
import knowledgeDetail from 'components/knowledge-detail'
import text from 'components/text'
import edit from 'components/edit'
import book from 'components/book'
import ball from 'components/ball'
import car from 'components/car'
Vue.use(Router)

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
    { path: '*', redirect: '/site'}
  ]
})
