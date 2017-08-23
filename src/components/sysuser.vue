<template>
  <div id="main">
    <div class="div-title">
      系统用户列表&nbsp;&nbsp;<el-button type="primary" @click="currentPageAll" size="mini">刷新</el-button>
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
        <el-row :span="24">
          <el-col :span="10">
            <el-form-item label="性别" prop="sex">
              <el-radio-group v-model="ruleForm.sex">
                <el-radio-button label="男"></el-radio-button>
                <el-radio-button label="女"></el-radio-button>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="角色" prop="role_id">
              <el-select v-model="ruleForm.role_id" placeholder="请选择角色">
                <el-option
                  v-for="item in options"
                  :key="item.id"
                  :label="item.label"
                  :value="item.id">
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="用户名" prop="loginId">
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
    <el-dialog title="用户信息" :visible.sync="dialogHasbind">
      <el-form label-width="100px">
	    <el-form-item label="钉钉号">
	      <el-tag type="primary" v-text="userinfo.userid"></el-tag>
	    </el-form-item>
	    <el-form-item label="钉钉openId">
	      <el-tag type="primary" v-text="userinfo.unionid"></el-tag>
	    </el-form-item>
	    <el-form-item label="部门："></el-form-item>
	    <el-tree :data="data" default-expand-all show-checkbox node-key="id" ref="treeA" highlight-current check-strictly :props="defaultProps"></el-tree>
	    <div style="height: 10px;"></div>
      	<el-button style="float: right;" size="small" @click="changepart">保存</el-button>
      	<div style="height: 10px;"></div>
	  </el-form>
    </el-dialog>
    <el-dialog title="绑定钉钉" :visible.sync="dialoggobind">
    	<el-tag>选择部门：</el-tag>
    	<div style="height: 10px;"></div>
      <el-tree :data="data" default-expand-all show-checkbox node-key="id" ref="tree" highlight-current check-strictly :props="defaultProps"></el-tree>
      <div style="height: 10px;"></div>
      <el-button style="float: right;" size="small" @click="bindpart">绑定</el-button>
      <div style="height: 10px;"></div>
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
        min-width="90"
        sortable="custom"
        label="姓名">
      </el-table-column>
      <el-table-column
        prop="sex"
        width="90"
        sortable="custom"
        label="性别">
      </el-table-column>
      <el-table-column
        prop="role.label"
        width="120"
        sortable="role.label"
        label="角色">
      </el-table-column>
      <el-table-column
        prop="loginId"
        min-width="150"
        sortable="custom"
        label="用户名">
      </el-table-column>
      <el-table-column
        prop="mobilePhone"
        min-width="180"
        sortable="custom"
        label="手机号">
      </el-table-column>
      <el-table-column
        prop="loginPassward"
        min-width="80"
        label="密码">
      </el-table-column>
      <el-table-column
        min-width="100"
        sortable="custom"
        prop="dingtalkId"
        label="钉钉">
        <template scope="scope">
        	<el-button size="small" type="primary" v-if="scope.row.dingtalkId" @click="openbind(scope.row.dingtalkId, scope.row.name)">已绑定</el-button>
        	<el-button size="small" v-if="!scope.row.dingtalkId" @click="gobind(scope.row.name, scope.row.mobilePhone, scope.row.id)">未绑定</el-button>
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
      dialogHasbind: false,
      dialoggobind: false,
      userinfo: {
      	department: []
      },
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
        role_id: '',
        role: {
          id: null,
        },
        status: 'DISABLE',
      },
      rules: {
        name: [
          { required: true, message: '请输入姓名', trigger: 'blur' },
        ],
        sex: [{required: true, message: '请选择性别', trigger: 'change'}],
        role_id: [{required: true, message: '请选择角色', trigger: 'change'}],
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
      data: [],
      defaultProps: {
        children: 'children',
        label: 'name'
      },
      bindname: '',
      bindphone: '',
      binduserid: '',
    }
  },
  created () {
    this.$http.get(this.resource + '/enum/typeId/1').then((result) => {
      for (var k = 0; k < result.data.length; k ++) {
        this.options.push({id: String(result.data[k].id), label: result.data[k].label})
      }
    })
    this.refreshAll()
    // 获取部门
    this.$http.get(this.resource + '/dingtalk/listDeps').then((res) => {
    	// this.data = res.data.department
    	var todos = res.data.department
    	for (var k = 0; k < todos.length; k ++) {
    		// todos[k].label = todos[k].name
    		if (!todos[k].parentid) {
    			todos[k].parentid = 0
    		}
    	} 
    	// console.log(JSON.stringify(todos))
    	this.data = this.toTree(todos)
      console.log(JSON.stringify(this.data))
    })
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
  	// 变成树形结构
  	toTree (data) {
  		// 删除 所有 children,以防止多次调用
        data.forEach(function (item) {
            delete item.children;
        });

        // 将数据存储为 以 id 为 KEY 的 map 索引数据列
        var map = {};
        data.forEach(function (item) {
            map[item.id] = item;
        });
//        console.log(map);

        var val = [];
        data.forEach(function (item) {

            // 以当前遍历项，的pid,去map对象中找到索引的id
            var parent = map[item.parentid];

            // 好绕啊，如果找到索引，那么说明此项不在顶级当中,那么需要把此项添加到，他对应的父级中
            if (parent) {

                (parent.children || ( parent.children = [] )).push(item);

            } else {
                //如果没有在map中找到对应的索引ID,那么直接把 当前的item添加到 val结果集中，作为顶级
                val.push(item);
            }
        });

        return val;
  	},
  	getCheckedNodes() {
    	console.log(JSON.stringify(this.$refs.tree.getCheckedNodes()));
	},
  	// 树形
  	handleNodeClick(data) {
        console.log(data);
  	},
  	// 修改部门
  	changepart () {
  		if (this.$refs.treeA.getCheckedKeys().length == 0) {
  			this.$message({
                showClose: true,
                message: '请至少选择一个部门',
                type: 'warning'
          	});
  		} else {
  			this.$http.post(this.resource + '/dingtalk/user', {name: this.bindname, userid: this.binduserid, department: this.$refs.treeA.getCheckedKeys()}).then((res) => {
  				if (res.data.errcode == 0) {
	  				this.$message({
		                showClose: true,
		                message: '部门保存成功',
		                type: 'success'
		          	});
		          	this.$refs.treeA.setCheckedKeys([]);
		          	this.dialogHasbind = false
		        } else {
  					this.$message({
		                showClose: true,
		                message: res.data.errmsg,
		                type: 'warning'
		          	});
  				}
  			})
  		}
  	},
  	// 确认绑定
  	bindpart () {
  		if (this.$refs.tree.getCheckedKeys().length == 0) {
  			this.$message({
                showClose: true,
                message: '请至少选择一个部门',
                type: 'warning'
          	});
  		} else {
  			console.log(this.$refs.tree.getCheckedKeys())
  			this.$http.put(this.resource + '/dingtalk/user', {name: this.bindname, mobile: this.bindphone, department: this.$refs.tree.getCheckedKeys()}).then((res) => {
  				if (res.data.errcode == 0) {
	  				this.$message({
		                showClose: true,
		                message: '部门绑定成功',
		                type: 'success'
		          	});
	  				this.$refs.tree.setCheckedKeys([]);
	  				this.dialoggobind = false
	  				this.$http.get(this.resource + '/dingtalk/user/' + res.data.userid).then((result) => {
	  					var unionid = result.data.unionid
	  					var dingtalkId = result.data.userid
	  					this.$http.get(this.resource + '/user/' + this.uid).then((response) => {
					        response.data.dingtalkOpenId = unionid
					        response.data.dingtalkId = dingtalkId
					        this.$http.put(this.resource + '/user/' + this.uid, response.data).then((todo) => {
				              this.currentPageAll()
				            }).catch((err) => {
				              console.log(JSON.stringify(err))
				              this.$message({
				                showClose: true,
				                message: '部门绑定后修改用户失败，请检查',
				                type: 'error'
				              });
				            })
				      	})
	  				})
  				} else {
  					this.$message({
		                showClose: true,
		                message: res.data.errmsg,
		                type: 'warning'
		          	});
  				}
  			}).catch((err) => {
  				this.$message({
	                showClose: true,
	                message: '出错啦',
	                type: 'warning'
	          	});
  			})
  		}
  	},
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
        this.tableData = response.data.content
      })
    },
    // 打开绑定钉钉的用户信息
    openbind (value1, value2) {
    	this.$http.get(this.resource + '/dingtalk/user/' + value1).then((res) => {
    		this.userinfo = res.data
    		this.$refs.treeA.setCheckedKeys(res.data.department);
    	})
      	this.dialogHasbind = true
      	this.bindname = value2
      	this.binduserid = value1
    },
    // 绑定
    gobind (value1, value2, value3) {
    	this.dialoggobind = true
    	this.bindname = value1
    	this.bindphone = value2
    	this.uid = value3
    },
    // 新增
    add () {
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
        role_id: null,
        role: {
          id: null,
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
      var role_id;
      value.role?role_id=value.role.id:''
      this.ruleForm = {
        id: value.id,
        name: value.name,
        sex: value.sex,
        wechatOpenId: value.wechatOpenId,
        dingtalkOpenId: value.dingtalkOpenId,
        dingtalkId: value.dingtalkId,
        loginId: value.loginId,
        loginPassward: value.loginPassward,
        mobilePhone: value.mobilePhone,
        mail: value.mail,
        idCard: value.idCard,
        idCardImg: value.idCardImg,
        bankAccount: value.bankAccount,
        bankAccountImg: value.bankAccountImg,
        role_id: String(role_id),
        role: {
          id: role_id,
        },
        status: 'DISABLE',
      }
    },
    // 页面点击
    btnClick (num) {
      this.cur = num - 1
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
    // 提交
    submitForm (formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          var role_id = this.ruleForm.role_id
          this.ruleForm.role.id = Number(role_id)
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
    }
  },
  watch: {
    cur () {
      this.currentPageAll()
    },
    selected () {
      this.cur = 0
      this.currentPageAll()
    },
    dialogHasbind (value) {
    	if (!value) {
    		this.$refs.treeA.setCheckedKeys([]);
    	}
    },
    dialoggobind (value) {
    	if (!value) {
    		this.$refs.tree.setCheckedKeys([]);
    	}
    }
  },
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
