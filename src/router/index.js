import Vue from 'vue'
import Router from 'vue-router'
import site from 'components/site'
import user from 'components/user'
import sysuser from 'components/sysuser'
import type from 'components/type'
import childB from 'components/childB'
import childC from 'components/childC'
import fromA from 'components/fromA'
import test from 'components/test'
Vue.use(Router)

export default new Router({
  // mode: 'history',
  routes: [
    {
      path: '/site',
      component: site
    },
    {
      path: '/user',
      component: user,
    },
    {
      path: '/test',
      component: test,
      children: [
        {
          path: '/',
          component: fromA
        },
        {
          path: 'fromA',
          component: fromA
        }
      ]
    },
    {
      path: '/sysuser',
      component: sysuser
    },
    {
      path: '/type',
      component: type
    },
    {
      path: '/childB',
      component: childB
    },
    {
      path: '/childC',
      component: childC
    },
    { path: '*', redirect: '/site'}
  ]
})
