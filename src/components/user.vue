<template>
  <div id="main">
    <div class="div-title">
      促销员列表&nbsp;&nbsp;<el-button type="primary" @click="currentPageAll" size="mini">刷新</el-button>
    </div>
    <div class="div-search">
      <el-button size="small" @click="add">新增</el-button>
    </div>
    <!-- 模态框 -->
    <el-dialog title="角色信息" :visible.sync="dialogFormVisible">
      <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
        <el-form-item label="姓名" prop="name">
          <el-input v-model="ruleForm.name"></el-input>
        </el-form-item>
        <el-form-item label="性别" prop="sex">
          <el-radio-group v-model="ruleForm.sex">
            <el-radio-button label="男"></el-radio-button>
            <el-radio-button label="女"></el-radio-button>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="账号" prop="loginId">
          <el-input v-model="ruleForm.loginId"></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="loginPassward">
          <el-input v-model="ruleForm.loginPassward"></el-input>
        </el-form-item>
        <el-form-item label="手机" prop="mobilePhone">
          <el-input v-model="ruleForm.mobilePhone"></el-input>
        </el-form-item>
        <el-form-item label="邮箱" prop="mail">
          <el-input v-model="ruleForm.mail"></el-input>
        </el-form-item>
        <el-form-item label="身份证号" prop="idCard">
          <el-input v-model="ruleForm.idCard"></el-input>
        </el-form-item>
        <el-form-item label="银行卡号" prop="bankAccount">
          <el-input v-model="ruleForm.bankAccount"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button size="small" type="primary" @click="submitForm('ruleForm')">提交</el-button>
          <el-button size="small" @click="resetForm('ruleForm')" type="warning">重置</el-button>
          <el-button size="small" @click="dialogFormVisible = false">取消</el-button>
        </el-form-item>
      </el-form>      
    </el-dialog>
    <!-- 图片展示 -->
    <el-dialog :title="checkMethod" :visible.sync="dialogImg" size="tiny">
      <div style="text-align: center;">
        <div style="height: 20px;"></div>
        <img :src="contImg" :alt="checkMethod" id="imgTranform"/>
        <div style="height: 70px;"></div>
        <el-button @click="imgTransform('left')"><span class="icon-undo"></span> 左旋</el-button>
        <el-button style="margin-left: 20px;" @click="imgTransform('right')"><span class="icon-redo"></span> 右旋</el-button>
      </div>
    </el-dialog>
  	<el-table
      stripe
      border
      :data="tableData"
      @sort-change="sort"
      max-height="600"
      style="width: 100%;">
      <el-table-column
        prop="name"
        min-width="120"
        sortable="custom"
        label="姓名">
      </el-table-column>
      <el-table-column
        prop="sex"
        sortable="custom"
        width="90"
        label="性别">
      </el-table-column>
      <el-table-column
        prop="mobilePhone"
        sortable="custom"
        width="180"
        label="手机号">
      </el-table-column>
      <el-table-column
        prop="mobilePhone"
        sortable="custom"
        width="180"
        label="微信号">
      </el-table-column>
      <el-table-column
        prop="mobilePhone"
        width="180"
        sortable="custom"
        label="添加时间">
      </el-table-column>
      <el-table-column
        width="120"
        prop="status"
        sortable="custom"
        label="状态"
        :filters="[{ text: 'DISABLE', value: 'DISABLE' }, { text: 'ENABLE', value: 'ENABLE' }]" :filter-method="filterTag" filter-placement="bottom-end">
        <template scope="scope">
          <el-button v-if="scope.row.status == 'DISABLE'" size="small" @click="changeActive(scope.row, 'ENABLE')">{{scope.row.status | statuschange}}</el-button>
          <el-button v-if="scope.row.status == 'ENABLE'" size="small" @click="changeActive(scope.row, 'DISABLE')" type="primary">{{scope.row.status | statuschange}}</el-button>
        </template>
      </el-table-column>
      <el-table-column
        prop="idCard"
        width="200"
        sortable="custom"
        label="身份证号">
      </el-table-column>
      <el-table-column
        width="120"
        label="身份证照片">
        <template scope="scope">
          <el-button size="small" @click="checkImg(scope.row.idCardImg, '身份证照片')">查看</el-button>
        </template>
      </el-table-column>
      <el-table-column
        prop="bankAccount"
        width="120"
        sortable="custom"
        label="银行卡号">
      </el-table-column>
      <el-table-column
        width="120"
        label="银行卡照片">
        <template scope="scope">
          <el-button size="small" @click="checkImg(scope.row.bankAccountImg, '银行卡照片')">查看</el-button>
        </template>
      </el-table-column>
      <el-table-column label="操作" min-width="140">
        <template scope="scope">
          <el-button size="small" @click="edit(scope.row)">编辑</el-button>
          <el-button size="small" type="danger" @click="deleteLine(scope.row.id)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <div class="page-list">
      <div class="page-info left">
        共 <span v-text="total" style="color: #E38A8B;"></span> 条记录，每页显示&nbsp;
        <select v-model="selected">
          <option value="3">3</option>
          <option value="5">5</option>
          <option value="10">10</option>
        </select>
        &nbsp;条信息
      </div>
      <div class="page-bar right">
        <ul class="pagination">
          <li><a href="#" @click.prevent="cur=0">第一页</a></li>
          <li v-if="showFirst"><a @click="cur--">上一页</a></li>
          <li v-for="index in indexs"  v-bind:class="{ 'active': (cur+1) == index}">
            <a @click="btnClick(index)" v-text="index"></a>
          </li>
          <li v-if="showLast"><a @click="cur++">下一页</a></li>
          <li><a>共<i>{{all}}</i>页</a></li>
          <li><a @click="cur=all-1">最后一页</a></li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  filters: {
    statuschange (value) {
      if (value == 'ENABLE') {
        return '已激活'
      } else {
        return '未激活'
      }
    }
  },
  data () {
    return {
      msg: 'I am hello',
      tableData: [],
      isTop: '',
      cur: 0, // 当前页码
      all: 1, // 总页数
      total: 0, // 总数据条数
      selected: 10, // 每页显示的数据条数
      direction: 'ASC', // 正序
      properties: 'id', // 按ID排序
      dialogFormVisible: false,
      role_id: '',
      ruleForm: {
        id: null,
        name: null,
        sex: null,
        wechatOpenId: null,
        dingtalkOpenId: null,
        dingtalkId: null,
        loginId: null,
        loginPassward: null,
        mobilePhone: null,
        mail: null,
        idCard: null,
        idCardImg: null,
        bankAccount: null,
        bankAccountImg:null,
        role: {
          id: null,
        },
        knowledge: null,
        quiz: null,
        status: 'DISABLE',
      },
      rules: {
        name: [
          { required: true, message: '请输入姓名', trigger: 'blur' },
        ],
        sex: [{required: true, message: '请选择性别', trigger: 'change'}],
        loginId: [
          { required: true, message: '请输入账号', trigger: 'blur' },
        ],
        loginPassward: [
          { required: true, message: '请输入密码', trigger: 'blur' },
        ],
        mobilePhone: [
          { required: true, message: '请输入手机号', trigger: 'blur' },
        ],
      },
      method: '',
      uid: '', // 用户ID
      options: [], // 角色选择
      contImg: '',
      checkMethod: '',
      dialogImg: false,
      num: 0,
    }
  },
  created () {
    this.$http.get(this.resource + '/enum/typeId/1').then((result) => {
      for (var k in result.data) {
        // this.options.push({id: String(result.data[k].id), label: result.data[k].label})
        if (result.data[k].value == 'promoter') {
          this.role_id = result.data[k].id
        }
      }
    })
    this.refreshAll()
  },
  computed: {
    indexs () {
      var left = 1
      var right = this.all
      var ar = []
      if (this.all >= 11) {
        if (this.cur > 5 && this.cur < this.all - 4) {
          left = this.cur - 5
          right = this.cur + 4
        } else {
          if (this.cur <= 5) {
            left = 1
            right = 8
          } else {
            right = this.all
            left = this.all - 7
          }
        }
      }
      while (left <= right) {
        ar.push(left)
        left++
      }
      return ar
    },
    showLast () {
      if (this.cur === this.all - 1) {
          return false
      }
      return true
    },
    showFirst () {
      if (this.cur === 0) {
        return false
      }
      return true
    }
  },
  methods: {
    // 刷新
    refreshAll () {
      this.cur = 0
      this.currentPageAll()
    },
    // 当前页数据刷新
    currentPageAll () {
      this.$http.get(this.resource + '/user/all', {params: {pageIndex: this.cur, pageSize: this.selected, direction: this.direction, properties: this.properties}}).then((response) => {
        console.log(JSON.stringify(response.data))
        this.cur = response.data.number
        this.all = response.data.totalPages
        this.total = response.data.totalElements
        this.selected = response.data.size
        this.tableData = []
        for (var k in response.data.content) {
          var item = response.data.content[k]
          if (item.role && item.role.value == 'promoter') {
            this.tableData.push(item)
          }
        }
        // this.tableData = response.data.content
      })
    },
    // 新增
    add () {
      var role_id = this.role_id
      this.ruleForm = {
        id: null,
        name: null,
        sex: null,
        wechatOpenId: null,
        dingtalkOpenId: null,
        dingtalkId: null,
        loginId: null,
        loginPassward: null,
        mobilePhone: null,
        mail: null,
        idCard: null,
        idCardImg: null,
        bankAccount: null,
        bankAccountImg:null,
        role: {
          id: role_id,
        },
        status: 'DISABLE',
      }
      this.dialogFormVisible = true
      this.method = 'post'
    },
    // 编辑
    edit (value) {
      this.dialogFormVisible = true
      this.method = 'put'
      this.uid = value.id
      this.ruleForm = value
    },
    // 查看照片
    checkImg (value, data) {
      this.num = 0
      this.dialogImg = true
      this.contImg = this.resource + '/wechat/getImg?imgName=' + value
      this.checkMethod = data
    },
    // 旋转图片
    imgTransform (value) {
      if (value == 'left') {
        this.num --
      } else {
        this.num ++
      }
    },
    // 排序
    sort (event) {
      console.log(event)
      if (event.prop != null) {
        this.properties = event.prop
      } else {
        this.properties = 'id'
      }
      if (event.order == 'ascending' || event.order == null) { // 升序
        this.direction = 'ASC'
      } else if (event.order == 'descending') { // 降序
        this.direction = 'DESC'
      }
      this.currentPageAll()
    },
    // 页面点击
    btnClick (num) {
      this.cur = num - 1
    },
    // 提交
    submitForm (formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          console.log(JSON.stringify(this.ruleForm))
          if (this.method == 'post') {
            this.$http.post(this.resource + '/user', this.ruleForm).then((res) => {
              console.log(JSON.stringify(res.data))
              this.dialogFormVisible = false
              this.$message({
                showClose: true,
                message: '恭喜你，添加成功',
                type: 'success'
              });
              this.currentPageAll()
            }).catch((err) => {
              console.log(JSON.stringify(err))
              this.$message({
                showClose: true,
                message: '添加失败，请检查',
                type: 'error'
              });
            })
          } else {
            this.$http.put(this.resource + '/user/' + this.uid, this.ruleForm).then((res) => {
              console.log(JSON.stringify(res.data))
              this.dialogFormVisible = false
              this.$message({
                showClose: true,
                message: '恭喜你，修改成功',
                type: 'success'
              });
              this.currentPageAll()
            }).catch((err) => {
              console.log(JSON.stringify(err))
              this.$message({
                showClose: true,
                message: '修改失败，请检查',
                type: 'error'
              });
            })
          }
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    // 重置
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    // 删除
    deleteLine (value) {
      this.$confirm('此操作将永久删除该用户, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$http.delete(this.resource + '/user/' + value).then((res) => {
          this.$message({
            showClose: true,
            message: '恭喜你，删除成功',
            type: 'success'
          });
          this.refreshAll()
        }).catch((err) => {
          this.$message({
            showClose: true,
            message: '删除失败，请检查',
            type: 'error'
          });
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        });          
      });
    },
    // 改变激活状态
    changeActive (value, data) {
      var info;
      if (data == 'ENABLE') {
        info = '激活'
      } else {
        info = '取消激活'
      }
      this.$confirm('此操作将' + info +', 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        value.status = data
        this.$http.put(this.resource + '/user/' + value.id, value).then((res) => {
          this.$message({
            showClose: true,
            message: '恭喜你，成功' + info,
            type: 'success'
          });
          this.currentPageAll()
        }).catch((err) => {
          this.$message({
            showClose: true,
            message: '操作失败，请检查',
            type: 'error'
          });
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消操作'
        });          
      });
    },
    filterTag(value, row) {
      return row.status === value;
    },
  },
  watch: {
    cur () {
      this.currentPageAll()
    },
    selected () {
      this.cur = 0
      this.currentPageAll()
    },
    num (value) {
      document.getElementById('imgTranform').style.transform = 'rotate(' + value * 90 + 'deg)'
    },
  },
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
