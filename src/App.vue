<template>
  <div style="height: 100%;">
    <aside>
      <el-col>
        <div @click="hideaside" style="background:#4A5064;height: 30px;">
          <div style="position: absolute; left: 75px; top: 4px;" v-show="asidediv">
            <span v-show="asidediv" class="icon-menu div-off"></span>
          </div>
          <div class="div-tranform" v-show="!asidediv">
            <span v-show="!asidediv" class="icon-menu div-off"></span>
          </div>
        </div>
        <el-menu :default-active="$route.path" class="el-menu-vertical-demo" theme="dark">
          <el-menu-item index="/site" @click="toIndex">
            <div :class="(asidediv)?'hide':'div-hover'"><i class="el-icon-caret-left" style="position: absolute;top: 20px;left: -12px; color: #53616f;"></i>站点管理</div>
            <span class="icon-home style-icon"></span>
            <div v-show="asidediv" class="menu-text">站点管理</div>
          </el-menu-item>
          <el-submenu index="1">
            <template slot="title">
              <span v-show="asidediv" class="icon-users style-icon"></span>
              <div v-show="asidediv" class="menu-text">娱乐管理</div>
            </template>
            <el-menu-item index="/user" @click="toMenu('电影分类', 'user')" style="padding-left: 20px;">
              <div :class="(asidediv)?'hide':'div-hover'"><i class="el-icon-caret-left" style="position: absolute;top: 20px;left: -12px; color: #53616f"></i>电影分类</div>
              <span class="icon-accessibility style-icon"></span>
              <div v-show="asidediv" class="menu-text">电影分类</div>
            </el-menu-item>
            <el-menu-item index="/sysuser" @click="toMenu('音乐分类', 'sysuser')" style="padding-left: 20px;">
              <div :class="(asidediv)?'hide':'div-hover'"><i class="el-icon-caret-left" style="position: absolute;top: 20px;left: -12px; color: #53616f"></i>音乐分类</div>
              <span class="icon-user style-icon"></span>
              <div v-show="asidediv" class="menu-text">音乐分类</div>
            </el-menu-item>
          </el-submenu>
          <el-submenu index="2">
            <template slot="title">
              <span v-show="asidediv" class="icon-cog style-icon"></span>
              <div v-show="asidediv" class="menu-text">个人爱好</div>
            </template>
            <el-menu-item index="/type" @click="toMenu('书籍分类', 'type')" style="padding-left: 20px;">
              <div :class="(asidediv)?'hide':'div-hover'"><i class="el-icon-caret-left" style="position: absolute;top: 20px;left: -12px; color: #53616f"></i>书籍分类</div>
              <span class="icon-books style-icon"></span>
              <div v-show="asidediv" class="menu-text">书籍分类</div>
            </el-menu-item>
            <el-menu-item index="/childB" @click="toMenu('球类运动', 'childB')" style="padding-left: 20px;">
              <div :class="(asidediv)?'hide':'div-hover'"><i class="el-icon-caret-left" style="position: absolute;top: 20px;left: -12px; color: #53616f"></i>球类运动</div>
              <span class="icon-price-tags style-icon"></span>
              <div v-show="asidediv" class="menu-text">球类运动</div>
            </el-menu-item>
            <el-menu-item index="/test/fromA" @click="toMenu('爱车之旅', 'test/fromA')" style="padding-left: 20px;">
              <div :class="(asidediv)?'hide':'div-hover'"><i class="el-icon-caret-left" style="position: absolute;top: 20px;left: -12px; color: #53616f"></i>爱车之旅</div>
              <span class="icon-road style-icon"></span>
              <div v-show="asidediv" class="menu-text">爱车之旅</div>
            </el-menu-item>
          </el-submenu>
        </el-menu>
      </el-col>
    </aside>
    <!-- 修改密码弹框 -->
    <el-dialog title="修改密码" :visible.sync="dialogFormVisible">
      <el-form :model="ruleForm2" :rules="rules2" ref="ruleForm2" label-width="100px" class="demo-ruleForm">
        <el-form-item label="用户名">
          <el-tag type="primary" v-text="ruleForm2.name"></el-tag>
        </el-form-item>
        <el-form-item label="新密码" prop="pass">
          <el-input type="password" v-model="ruleForm2.pass" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="确认新密码" prop="checkPass">
          <el-input type="password" v-model="ruleForm2.checkPass" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm('ruleForm2')">提交</el-button>
          <el-button @click="resetForm('ruleForm2')">重置</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
    <header>
      <div style="line-height: 60px; background: #fafafa;overflow: hidden;">
        <div class="userinfo">
          <ul>
            <li><span class="icon-user"></span></li>
            <li>Ecode</li>
          </ul>
          <ul class="ul-pointer" @click="changePwd">
            <li><span class="icon-cog"></span></li>
            <li>修改密码</li>
          </ul>
          <ul class="ul-pointer" @click="logout">
            <li><span class="icon-switch"></span></li>
            <li>退出</li>
          </ul>
        </div>
      </div>
      <el-tabs type="border-card" v-model="editableTabsValue" closable @tab-remove="removeTab">
        <el-tab-pane label="站点管理" name="site" style="z-index: 999;"></el-tab-pane>
        <el-tab-pane v-for="(todo, key) in todos" :key="key" :label="todo.title" :name="todo.name" @click="jump(todo.name)"></el-tab-pane>
      </el-tabs>
    </header>
    <div id="mouseMenu" v-show="showMenu">
      <ul>
        <li @click="closetab"><span class="icon-cancel-circle" style="color: #e06d6d;"></span>&nbsp;&nbsp;关闭全部</li>
        <li @click="closeOther"><span class="icon-shuffle" style="color: #45cac1;"></span>&nbsp;&nbsp;关闭其它</li>
      </ul>
    </div>
    <section id="section">
      <div class="section" id="section-body">
        <router-view></router-view>
        <div style="float: right; margin-top: 10px;">
          <el-button icon="arrow-up" @click="toTop"></el-button>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  data () {
    var validatePass = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入密码'));
      } else {
        if (this.ruleForm2.checkPass !== '') {
          this.$refs.ruleForm2.validateField('checkPass');
        }
        callback();
      }
    };
    var validatePass2 = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请再次输入密码'));
      } else if (value !== this.ruleForm2.pass) {
        callback(new Error('两次输入密码不一致!'));
      } else {
        callback();
      }
    };
    return {
      todos: [],
      tabArr: [
        {title: '站点管理', name: 'site'},
        {title: '电影分类', name: 'user'},
        {title: '音乐分类', name: 'sysuser'},
        {title: '书籍分类', name: 'type'},
        {title: '球类运动', name: 'childB'},
        {title: '爱车之旅', name: 'test/fromA'},
      ],
      editableTabsValue: 'site',
      asidediv: true,
      dialogFormVisible: false,
      ruleForm2: {
        name: 'Ecode',
        pass: '',
        checkPass: '',
      },
      rules2: {
        pass: [
          { validator: validatePass, trigger: 'blur' }
        ],
        checkPass: [
          { validator: validatePass2, trigger: 'blur' }
        ],
      },
      menu: [],
      mouseMenu: '',
      showMenu: false,
      targetTab: '站点管理',
      dialoggobind: false,
    }
  },
  watch: {
    editableTabsValue (value) {
      console.log(value)
      this.$router.push('/' + value)
    },
  },
  created () {
    console.log(this.$route.path)
    this.editableTabsValue = this.$route.path.slice(1)
    var eTab = null
    for (var k = 0; k < this.tabArr.length; k ++) {
      if (this.tabArr[k].name == this.editableTabsValue) {
        eTab = this.tabArr[k].title
      }
    }
    if (this.editableTabsValue != 'site') {
      this.todos.push({
        title: eTab,
        name: this.editableTabsValue,
      });
    }
  },
  mounted () {
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
    })
  },
  methods: {
    // 退出
    logout () {
      console.log('logout')
    },
    toTop () {
      document.getElementById('section').scrollTop = 0;
    },
    blur (e) {
        this.showMenu = false
    },
    toIndex () {
      this.$router.push('/site')
      this.editableTabsValue = 'site'
    },
    closeOther () {
      if (this.todos.length == 0) {
        console.log('当前处于index')
        this.showMenu = false
      } else {
        if (this.targetTab == '站点管理') {
          this.editableTabsValue = 'site'
          this.todos = []
        } else {
          var eName = null
          for (var k = 0; k < this.todos.length; k ++) {
            if (this.todos[k].title == this.targetTab) {
              eName = this.todos[k].name
            }
          }
          console.log('slice')
          this.todos = []
          console.log(this.targetTab+ 'hi')
          this.todos.push({
            title: this.targetTab,
            name: eName
          })
          this.$router.push(eName)
          this.editableTabsValue = eName
        }
        this.showMenu = false
      }
    },
    closetab () {
      this.editableTabsValue = 'site'
      this.todos = []
      this.showMenu = false
    },
    hideaside () {
      this.asidediv = !this.asidediv
    },
    jump (value) {
      console.log(value)
      this.$router.push('/' + value)
    },
    toMenu (title, value) {
      this.$router.push('/' + value)
      var ishas = false
      for (var k in this.todos) {
        if (this.todos[k].title == title) {
          this.editableTabsValue =  this.todos[k].name
          ishas = true
          return false
        }
      }
      if (!ishas) {
        this.todos.push({
          title: title,
          name: value,
        });
        this.editableTabsValue = value;
        setTimeout(() => {
          this.menu = document.querySelectorAll('.el-tabs__item')
          for (var k = 0; k < this.menu.length; k ++) {
            this.menu[k].onmousedown = (e) => {
              if (e.button == 2) {
                console.log(e.clientY)
                console.log(e.clientX)
                // console.log(e)
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
      }
    },
    removeTab(targetName) {
      // console.log(targetName)
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
      if (this.todos.length == 0) {
        this.editableTabsValue = 'site'
      }
    },
    // 打开修改密码弹框
    changePwd () {
      this.dialogFormVisible = true
      this.ruleForm2.pass = ''
      this.ruleForm2.checkPass = ''
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.$message({
            showClose: true,
            message: '恭喜你，密码修改成功',
            type: 'success'
          });
          this.dialogFormVisible = false
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
  }
}
</script>

<style lang="stylus" style="stylesheet/stylus">

</style>
