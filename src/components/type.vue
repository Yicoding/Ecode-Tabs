<template>
  <div>
  	<div>
  		<el-button type="text" style="cursor: text;">请选择查看类型：</el-button> <el-tag :closable="true" @close="handleClose(tag.id)" style="margin: 0 0 10px 10px; cursor: pointer;" v-for="tag in tags" :key="tag.name" :type="(ruleForm.type.name  == tag.name)?'primary':''"><span @click="selectTag(tag.id, tag.name)" v-text="tag.name"></span></el-tag> <el-button class="button-new-tag" size="small" @click="showInput">+ New Tag</el-button>
  	</div>
  	<!-- 模态框 -->
  	<el-dialog title="枚举信息" :visible.sync="dialogFormVisible">
  		<el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
        <el-form-item label="枚举类型">
          <el-tag type="primary" v-text="ruleForm.type.name"></el-tag>
        </el-form-item>
  			<el-form-item label="枚举值" prop="value">
		      <el-input v-model="ruleForm.value"></el-input>
  			</el-form-item>
  			<el-form-item label="枚举名" prop="label">
		      <el-input v-model="ruleForm.label"></el-input>
  			</el-form-item>
  			<el-form-item label="备注">
		      <el-input v-model="ruleForm.note"></el-input>
  			</el-form-item>
  			<el-form-item>
		      <el-button size="small" type="primary" @click="submitForm('ruleForm')">提交</el-button>
		      <el-button size="small" @click="resetForm" type="warning">重置</el-button>
		      <el-button size="small" @click="dialogFormVisible = false">取消</el-button>
  			</el-form-item>
  		</el-form>  	  
  	</el-dialog>
  	<el-button size="small" type="info" @click="add">新增</el-button>
  	<div class="div-top"></div>
  	<el-table
  	    :data="tableData"
        border
  	    stripe
  	    style="width: 100%">
  	    <el-table-column
  	      label="序号"
  	      type="index"
  	      width="70">
  	    </el-table-column>
  	    <el-table-column
  	      prop="value"
  	      sortable
  	      min-width="100"
  	      label="枚举值">
  	    </el-table-column>
  	    <el-table-column
  	      prop="label"
  	      min-width="120"
  	      sortable
  	      label="枚举名">
  	    </el-table-column>
  	    <el-table-column
  	      prop="note"
  	      min-width="150"
  	      sortable
  	      label="备注">
  	    </el-table-column>
  	    <el-table-column
  	      min-width="160"
  	      label="操作">
  	      <template scope="scope">
  	      	<el-button size="small" @click="edit(scope.row)">编辑</el-button>
  	      	<el-button size="small" type="danger" @click="deleteLine(scope.row.id)">删除</el-button>
  	      </template>
  	    </el-table-column>
	</el-table>
  </div>
</template>

<script>
export default {
  data () {
    return {
  		tags: [],
  		tableData: [],
  		dialogFormVisible: false,
  		ruleForm: {
        type: {
          id: null
        },
        value: '',
        note: null,
        label: '',
      },
      rules: {
      	value: [
          { required: true, message: '请输入角色', trigger: 'blur' },
      	],
      	label: [
          { required: true, message: '请输入角色名', trigger: 'blur' },
      	],
      },
      method: '',
      rid: '', // 角色ID
    }
  },
  created () {
  	// this.$http.get(this.resource + '/enum/all').then((res) => {
  	// 	this.$http.get(this.resource + '/enum/name/' + res.data[0]).then((result) => {
  	// 		this.tableData = result.data
  	// 	})
  	// 	for (var k in res.data) {
  	// 		this.tags.push({name: res.data[k]})
  	// 	}
  	// 	this.ruleForm.name = res.data[0]
  	// })
    // this.$http.get(this.resource + '/enumType/all', {params: {pageIndex: 0, pageSize: 99999}}).then((res) => {
    //   this.tags = res.data.content
    //   this.ruleForm.type.name = res.data.content[0].name
    //   this.selectTag(res.data.content[0].id, res.data.content[0].name)
    // })
  },
  methods: {
    // 查询所有类型
    tagAll () {
      this.$http.get(this.resource + '/enumType/all', {params: {pageIndex: 0, pageSize: 99999}}).then((res) => {
        this.tags = res.data.content
      })
    },
    // 新增类型
    showInput () {
      this.$prompt('请输入枚举类型', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        // inputPattern: /^.[A-Za-z]+$/,
        // inputErrorMessage: '只能输入纯英文'
      }).then(({ value }) => {
        this.$http.post(this.resource + '/enumType', {name: value}).then((response) => {
          this.ruleForm.type.name = response.data.data.name
          this.selectTag(response.data.data.id, response.data.data.name)
          this.tagAll()
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
        this.$http.delete(this.resource + '/enumType/' + value).then((response) => {
          this.$message({
            showClose: true,
            message: '恭喜你，删除成功',
            type: 'success'
          });
          this.$http.get(this.resource + '/enumType/all', {params: {pageIndex: 0, pageSize: 99999}}).then((res) => {
            this.tags = res.data.content
            if (value == this.ruleForm.type.id) {
              this.ruleForm.type.name = res.data.content[0].name
              this.selectTag(res.data.content[0].id, res.data.content[0].name)
            }
          })
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
  	// 选择查看类型
  	selectTag (data, name) {
  		console.log(data)
  		this.ruleForm.type.id = data
      this.ruleForm.type.name = name
  		this.$http.get(this.resource + '/enum/typeId/' + data).then((result) => {
  			this.tableData = result.data
  		})
  	},
  	// 新增
  	add () {
  		this.ruleForm.value = ''
  		this.ruleForm.label = ''
  		this.ruleForm.note = null
	  	this.dialogFormVisible = true
	  	this.method = 'post'
  	},
  	// 编辑
  	edit (value) {
  		this.dialogFormVisible = true
	  	this.method = 'put'
	  	this.rid = value.id
      this.ruleForm = value
  	},
  	// 提交
  	submitForm (formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          if (this.method == 'post') {
          	this.$http.post(this.resource + '/enum', this.ruleForm).then((res) => {
          		console.log(JSON.stringify(res.data))
          		this.dialogFormVisible = false
          		this.$message({
  		          showClose: true,
  		          message: '恭喜你，添加成功',
  		          type: 'success'
  		        });
  		        this.selectTag(this.ruleForm.type.id, this.ruleForm.type.name)
          	}).catch((err) => {
          		console.log(JSON.stringify(err))
          		this.$message({
  		          showClose: true,
  		          message: '添加失败，请检查',
  		          type: 'error'
  		        });
          	})
          } else {
          	this.$http.put(this.resource + '/enum/' + this.rid, this.ruleForm).then((res) => {
          		console.log(JSON.stringify(res.data))
          		this.dialogFormVisible = false
          		this.$message({
  		          showClose: true,
  		          message: '恭喜你，修改成功',
  		          type: 'success'
  		        });
  		        this.selectTag(this.ruleForm.type.id, this.ruleForm.type.name)
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
  		this.ruleForm.value = ''
  		this.ruleForm.label = ''
  		this.ruleForm.note = null
  	},
  	// 删除
  	deleteLine (value) {
  		this.$confirm('此操作将永久删除该枚举, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
      	this.$http.delete(this.resource + '/enum/' + value).then((res) => {
    			this.$message({
            showClose: true,
            message: '恭喜你，删除成功',
            type: 'success'
          });
          this.selectTag(this.ruleForm.type.id, this.ruleForm.type.name)
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
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
