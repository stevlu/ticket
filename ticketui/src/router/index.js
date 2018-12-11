import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/components/Login'
import Home from '@/components/Home'
import Chat from '@/components/chat/Chat'
import TktDetail from '@/components/ticket/TktDetail'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Login',
      component: Login,
      hidden: true
    },
    {
      path: '/home',
      name: '主页',
      component: Home,
      hidden: true,
      meta: {
        requireAuth: true
      },
      children: [
        {
          path: '/chat',
          name: '消息',
          component: Chat,
          hidden: true,
          meta: {
            keepAlive: false,
            requireAuth: true
          }
        },
        {
          path: '/tkt/detail',
          name: '工单细节',
          component: TktDetail,
          hidden: true,
          meta: {
            keepAlive: false,
            requireAuth: true
          }
        }
      ]
    }
  ]
})
