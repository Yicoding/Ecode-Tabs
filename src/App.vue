<template>
  <div>
    <aside ref="aside">
      <div class="aisde-header" @click="expandAll">
        <div class="menu-on" v-show="!isCollapse">
          <span v-show="!isCollapse" class="icon-menu"></span>
        </div>
        <div class="menu-off" v-show="isCollapse">
          <span v-show="isCollapse" class="icon-menu"></span>
        </div>
      </div>
      <el-menu :default-active="$route.path" class="el-menu-vertical-demo" :collapse="isCollapse" background-color="#545c64" text-color="#bfcbd9" active-text-color="#ffd04b">
        <el-menu-item v-for="(item, index) in menuArr" :key="index" :index="item.name" @click="toRouter(item.title, item.name)">
          <i :class="item.icon"></i>
          <span slot="title" v-text="item.title"></span>
        </el-menu-item>
      </el-menu>
    </aside>
    <header ref="header">
      <div style="line-height: 60px; background: #fafafa;overflow: hidden;">
        <div class="userinfo">
          <ul>
            <li><span class="icon-user"></span></li>
            <li>Ecode</li>
          </ul>
        </div>
      </div>
      <el-tabs type="border-card" v-model="editableTabsValue" closable @tab-remove="removeTab">
        <el-tab-pane v-for="(todo, key) in todos" :key="key" :label="todo.title" :name="todo.name" @click="jump(todo.name)"></el-tab-pane>
      </el-tabs>
    </header>
    <section ref="section">
      <div class="section">
        <router-view/>
      </div>
    </section>
    <div id="mouseMenu" v-show="showMenu">
      <ul>
        <li @click="closetab"><span class="icon-cancel-circle" style="color: #e06d6d;"></span>&nbsp;&nbsp;关闭全部</li>
        <li @click="closeOther"><span class="icon-shuffle" style="color: #45cac1;"></span>&nbsp;&nbsp;关闭其它</li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      todos: [],
      menuArr: [
        {title: '站点管理', name: '/site', icon: 'el-icon-mobile-phone'},
        {title: '知识管理', name: '/knowledge', icon: 'el-icon-info'},
        {title: '文本编辑', name: '/text', icon: 'el-icon-document'},
        {title: '书籍分类', name: '/book', icon: 'el-icon-setting'},
        {title: '球类运动', name: '/ball', icon: 'el-icon-news'},
        {title: '爱车之旅', name: '/car', icon: 'el-icon-goods'},
      ],
      editableTabsValue: '/site',
      menu: [],
      mouseMenu: '',
      showMenu: false,
      targetTab: '站点管理',
      isCollapse: false,
      leftOut: null,
    }
  },
  created () {
    console.log(this.$route.path)
    this.editableTabsValue = this.$route.path
    if (this.todos.length == 0) {
      this.todos.push({title: this.menuArr[0].title, name: this.menuArr[0].name})
    }
    this.menuArr.forEach((item) => {
      if (item.name == this.$route.path && this.$route.path != this.todos[0].name) {
        this.todos.push({title: item.title, name: item.name})
      }
    })
  },
  mounted () {
    this.$nextTick(() => {
      setTimeout(() => {
        this.mouseMenu = document.getElementById('mouseMenu')
        this.mouseMenu.onmouseover = () => {
          this.showMenu = true
        }
        this.mouseMenu.onmouseout = () => {
          this.showMenu = false
        }
        document.querySelector('.el-tabs__nav').oncontextmenu = function(e){
          return false;
        }
        this.menu = document.querySelectorAll('.el-tabs__item')
        for (var k = 0; k < this.menu.length; k ++) {
          this.menu[k].onmousedown = (e) => {
            if (e.button == 2) {
              console.log(e.clientY)
              console.log(e.clientX)
              console.log(e.target.innerText)
              this.targetTab = e.target.innerText
              this.mouseMenu.style.top = e.clientY + 1 + 'px'
              this.mouseMenu.style.left = e.clientX + 1 + 'px'
              this.showMenu = true
            }
          }
          this.menu[k].onmouseout = () => {
            this.showMenu = false
          }
        }
      }, 3000)
    })
  },
  watch: {
    editableTabsValue (value) {
      console.log(value)
      if ((value != '0') && (value != '/')) {
        this.$router.push(value)
      }
    }
  },
  methods: {
    expandAll () {
      if (this.isCollapse) {
        window.clearTimeout(this.leftOut)
        this.$refs.aside.style.width = 200 + 'px'
        this.$refs.header.style.left = 200 + 'px'
        this.$refs.section.style.left = 200 + 'px'
      } else {
        this.leftOut = setTimeout(() => {
          this.$refs.aside.style.width = 64 + 'px'
          this.$refs.header.style.left = 64 + 'px'
          this.$refs.section.style.left = 64 + 'px'
        }, 300)
      }
      this.isCollapse = !this.isCollapse
    },
    toRouter (title, name) {
      this.editableTabsValue = name
      if (JSON.stringify(this.todos).indexOf(JSON.stringify({title: title, name: name})) == -1) {
        this.todos.push({title: title, name: name})
      }
      setTimeout(() => {
        this.menu = document.querySelectorAll('.el-tabs__item')
        for (var k = 0; k < this.menu.length; k ++) {
          this.menu[k].onmousedown = (e) => {
            if (e.button == 2) {
              console.log(e.clientY)
              console.log(e.clientX)
              console.log(e.target.innerText)
              this.targetTab = e.target.innerText
              this.mouseMenu.style.top = e.clientY + 1 + 'px'
              this.mouseMenu.style.left = e.clientX + 1 + 'px'
              this.showMenu = true
            }
          }
          this.menu[k].onmouseout = () => {
            this.showMenu = false
          }
        }
      },200)
    },
    removeTab (targetName) {
      console.log(targetName)
      let tabs = this.todos
      let activeName = this.editableTabsValue
      if (activeName === targetName) {
        tabs.forEach((tab, index) => {
          if (tab.name === targetName) {
            let nextTab = tabs[index + 1] || tabs[index - 1];
            if (nextTab) {
              activeName = nextTab.name;
              this.$router.push('/'+nextTab.title)
              console.log(nextTab.title)
            }
          }
        });
      }
      this.editableTabsValue = activeName
      this.todos = tabs.filter(tab => tab.name !== targetName);
      if (this.todos.length == 1) {
        this.editableTabsValue = this.todos[0].name
      }
    },
    closeOther () { // 关闭其他
      this.todos = [{title: this.menuArr[0].title, name: this.menuArr[0].name}]
      if (this.targetTab == this.menuArr[0].title) {
        this.editableTabsValue = this.menuArr[0].name
      } else {
        this.menuArr.forEach((item) => {
          if (item.title == this.targetTab) {
            this.todos.push({title: item.title, name: item.name})
            this.editableTabsValue = item.name
          }
        })
      }
      this.showMenu = false
    },
    closetab () { // 关闭全部
      this.showMenu = false
      if (this.todos.length == 1) {
        console.log('当前处于index')
      } else {
        this.todos = [{title: this.menuArr[0].title, name: this.menuArr[0].name}]
      }
      this.editableTabsValue = this.menuArr[0].name
    },
  }
}
</script>

<style>

</style>
