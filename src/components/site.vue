<template>
  <div>
    <div class="div-top">
      <el-button type="text" style="cursor: text;">请选择查看类型：</el-button>
      <el-tag style="margin: 0 0 10px 10px; cursor: pointer;" :type="(checkId  == 0)?'':'info'" @click.native="checkId = 0"><span>SelectAll</span></el-tag><el-tag :closable="true" @close="handleClose(tag.id)" style="margin: 0 0 10px 10px; cursor: pointer;" v-for="tag in tags" :key="tag.id" :type="(checkId  == tag.id)?'':'info'" @click.native="checkId = tag.id"><span v-text="tag.name"></span></el-tag> <el-button class="button-new-tag" size="small" @click="showInput">+ New Tag</el-button>
    </div>
  	<div class="div-search">
  		<el-button size="small" @click="add" icon="el-icon-plus">新增</el-button> 
      <el-button type="primary" @click="resetAll" size="mini" icon="el-icon-refresh">刷新</el-button>
      <div style="float: right; width: 243px;">
        <el-input size="small" v-model="input" placeholder="请输入查询内容（站点名、网址）" suffix-icon="el-icon-search"></el-input>
      </div>
  	</div>
    <!-- 模态框 -->
    <el-dialog title="枚举信息" :visible.sync="dialogFormVisible">
      <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
        <el-form-item label="站点类型" prop="type_id">
          <el-tag type="primary" v-text="checkName" v-if="!(checkId == 0)"></el-tag>
          <el-select v-model="ruleForm.type_id" placeholder="请选择" v-if="checkId == 0">
            <el-option
              v-for="item in options"
              :key="item.id"
              :label="item.name"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="名称" prop="name">
          <el-input v-model="ruleForm.name"></el-input>
        </el-form-item>
        <el-form-item label="网址" prop="site">
          <el-input v-model="ruleForm.site"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button size="small" type="primary" @click="submitForm('ruleForm')">提交</el-button>
          <el-button size="small" @click="resetForm" type="warning">重置</el-button>
          <el-button size="small" @click="dialogFormVisible = false">取消</el-button>
        </el-form-item>
      </el-form>      
    </el-dialog>
  	<el-table
	    :data="tableData"
	    stripe
      border
      max-height="450"
      @sort-change="sort"
	    style="width: 100%">
	    <el-table-column
	      label="序号"
        type="index"
        width="65">
	    </el-table-column>
      <el-table-column
        prop="name"
        sortable="custom"
        label="站点名" min-width="120">
        <template slot-scope="scope">
          <el-button type="text" size="small" @click="jump(scope.row.site)">{{scope.row.name}}</el-button>
        </template>
      </el-table-column>
	    <el-table-column
	      label="网址" min-width="300"
        sortable="custom"
        prop="site">
	      <template slot-scope="scope">
          <el-button type="text" size="small" @click="jump(scope.row.site)">{{scope.row.site}}</el-button>
        </template>
	    </el-table-column>
	    <el-table-column
	      prop="type.name"
        sortable="custom"
	      label="类型" min-width="120">
	    </el-table-column>
	    <el-table-column label="操作" width="200">
	      <template slot-scope="scope">
          <el-button size="small" @click="edit(scope.row)" icon="el-icon-edit">编辑</el-button>
	        <el-button
	          size="small"
	          type="danger"
	          @click="handleDelete(scope.row.id)" icon="el-icon-delete">删除</el-button>
	      </template>
	    </el-table-column>
    </el-table>
    <div class="div-top"></div>
    <el-pagination
      background
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="currentPage"
      :page-sizes="[3, 5, 10, 20]"
      :page-size="size"
      layout="total, sizes, prev, pager, next, jumper"
      :total="totalElements">
    </el-pagination>
  </div>
</template>

<script>
export default {
	data () {
		return {
      tags: [],
      options: [],
      checkId: 0,
      checkName: null,
      tableData: [],
      totalElements: 0,
      currentPage: 1,
      size: 10,
	    direction: 'ASC', // 正序
    	properties: 'type_id', // 按ID排序
      dialogFormVisible: false,
      ruleForm: {
        id: null,
        name: null,
        site: null,
        type_id: null,
      },
      rules: {
        name: [
          { required: true, message: '请输入站点名', trigger: 'blur' },
        ],
        site: [
          { required: true, message: '请输入网址', trigger: 'blur' },
        ],
        type_id: [
          { required: true, message: '请选择一个类型', trigger: 'change' }
        ]
      },
      method: '',
      input: '',
      timer: null,
		}
	},
	created () {
    this.tagAll()
    this.refreshAll()
	},
	methods: {
    debounce(func, delay) { // 延迟执行模糊搜索达到节约资源的目的
      let timer
      return function (...args) {
        if (timer) {
          clearTimeout(timer)
        }
        timer = setTimeout(() => {
          func.apply(this, args)
        }, delay)
      }
    },
    // 查询类型
    tagAll () {
      this.$http.get(this.resource + '/type/site/findAll').then((res) => {
        console.log(JSON.stringify(res.data))
        this.tags = res.data
        this.options = []
        for (var k in res.data) {
          var item = res.data[k]
          this.options.push({id: String(item.id), name: item.name})
        }
      })
    },
    // 刷新
    resetAll () {
      this.currentPage = 1
      this.direction = 'ASC'
      this.properties = 'type_id'
      this.checkId = 0
      this.currentPageAll()
    },
    // 回第一页
    refreshAll () {
      this.currentPage = 1
      this.currentPageAll()
    },
    // 刷新当前页数据
    currentPageAll () {
      this.$http.get(this.resource + '/site/findAll', {params: {pageIndex: this.currentPage - 1, pageSize: this.size, direction: this.direction, properties: this.properties, checkId: this.checkId}}).then((res) => {
        this.tableData = res.data.content
        this.totalElements = res.data.totalElements
      })
    },
    // 模糊查询
    findByName() {
      this.checkId = 0
      this.$http.get(this.resource + '/site/like', {params: {pageIndex: this.currentPage - 1, pageSize: this.size, direction: this.direction, properties: this.properties, name: this.input}}).then((res) => {
        this.tableData = res.data.content
        this.totalElements = res.data.totalElements
        if (res.data.content.length == 0) {
          this.$message({
            showClose: true,
            message: '没有找到符合条件的数据！',
            type: 'info'
          });
        }
      })
    },
    // 站点跳转
    jump (value) {
      window.open(value)
    },
    // 添加类型
    showInput () {
      this.$prompt('请输入标签类型', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        inputPattern: /^.[A-Za-z]+$/,
        inputErrorMessage: '只能输入纯英文'
      }).then(({ value }) => {
        this.$http.post(this.resource + '/type/site/add', {name: value}).then((response) => {
          this.tagAll()
          this.checkId = response.data.id
          this.checkName = response.data.name
          this.$message({
            type: 'success',
            message: '添加成功，新增的枚举类型为: ' + value
          });
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消输入'
        });       
      });
    },
    // 删除类型
    handleClose (value) {
      this.$confirm('此操作将永久删除该枚举类型, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$http.delete(this.resource + '/type/site/' + value).then((response) => {
          this.$message({
            showClose: true,
            message: '恭喜你，删除成功',
            type: 'success'
          });
          this.tagAll()
          this.checkId = 0
        }).catch((err) => {
          this.$message({
            showClose: true,
            message: '该枚举类型下有数据，不能删除，请先清空该类型下的数据',
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
  	// 新增站点
  	add () {
  		this.dialogFormVisible = true
      this.method = 'post'
      this.ruleForm.name = null
      this.ruleForm.site = null
  	},
    // 编辑
    edit (value) {
      this.method = 'put'
      this.dialogFormVisible = true
      this.ruleForm = {
        id: value.id,
        name: value.name,
        site: value.site,
        type_id: String(value.type.id)
      }
    },
    // 提交
    submitForm (formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          if (this.method == 'post') {
            this.$http.post(this.resource + '/site/add', this.ruleForm).then((res) => {
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
            this.$http.put(this.resource + '/site/put', this.ruleForm).then((res) => {
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
    resetForm () {
      this.ruleForm.name = null
      this.ruleForm.site = null
      this.ruleForm.type_id = null
    },
  	// 删除
  	handleDelete (value) {
  		this.$confirm('此操作将永久删除该站点, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$http.delete(this.resource + '/site/delete/' + value).then((res) => {
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
    handleSizeChange(val) {
      // console.log(`每页 ${val} 条`)
      this.size = val
      this.currentPage = 1
      this.currentPageAll()
    },
    handleCurrentChange(val) {
      // console.log(`当前页: ${val}`)
      this.currentPage = val
      this.currentPageAll()
    },
    // 排序
    sort (event) {
      console.log(event)
      if (event.prop != null) {
        if (event.prop == 'type.name') {
          this.properties = 'type_id'
        } else {
          this.properties = event.prop
        }
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
	},
	watch: {
    checkId (value) {
      this.cur = 0
      this.selected = 10
      this.direction = 'ASC'
      this.properties = 'id'
      this.currentPageAll()
      if (value == 0) {
        this.ruleForm.type_id = null
      } else {
        this.ruleForm.type_id = String(value)
      }
      for (var k in this.tags) {
        if (value == this.tags[k].id) {
          this.checkName = this.tags[k].name
        }
      }
    },
    input (value) {
      if (value) {
        this.currentPage = 1
        // this.debounce(this.findByName(), 2000)
        if (this.timer) {
          clearTimeout(this.timer)
        }
        this.timer = setTimeout(() => {
          this.findByName()
        }, 300)
      } else {
        this.resetAll()
      }
    },
  },
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
