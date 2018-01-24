<template>
  <div class="project-box">
    <el-dialog title="试题" :visible.sync="dialogFormVisible">
      <el-form :model="form" ref="form" :rules="rules" label-width="100px" class="demo-ruleForm">
        <el-form-item label="标题" prop="title">
          <el-input type="textarea" v-model="form.title"></el-input>
        </el-form-item>
        <el-form-item label="内容" prop="content">
          <el-input type="textarea" v-model="form.content" rows="10"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitForm('form')">确 定</el-button>
      </div>
    </el-dialog>
    <el-card class="box-card">
      <div slot="header" class="clearfix">
          <span style="line-height: 36px;">详情</span>
          <el-button style="float: right;" size="small" icon="el-icon-arrow-left" @click="$router.go(-1)">返回到前端列表</el-button>
      </div>
      <el-button size="small" icon="el-icon-plus" @click="add">新增条目</el-button>
      <div class="div-top"></div>
        <div class="text item" v-for="(item, index) in arrData" :key="item.id">
          <h3>{{index + 1}}. {{item.title}} 
          <el-button icon="el-icon-edit" size="small" type="primary" @click="edit(item)"></el-button>
          <el-button icon="el-icon-delete" size="small" type="danger" @click="remove(item.id)"></el-button></h3>
          <div style="height: 15px;"></div>
          <p v-html="item.content"></p>
        </div>
    </el-card>
  </div>
</template>

<script>
export default {
  data () {
    return {
      dialogFormVisible: false,
      form: {
        title: null,
        content: null,
      },
      rules: {
        title: [
          { required: true, message: '请输入标题', trigger: 'blur' }
        ],
        content: [
          { required: true, message: '请输入内容', trigger: 'blur' }
        ],
      },
      arrData: [],
      method: null,
    }
  },
  mounted () {
    this.findAll()
  },
  methods: {
    // 删除
    remove (id) {
      this.$confirm('此操作将永久删除该题目, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$http.delete(this.resource + '/testdetail/remove/' + id).then((res) => {
            this.dialogFormVisible = false
            this.findAll()
            this.$message({
              type: 'success',
              message: '删除成功!'
            })
          }).catch((err) => {
            this.$message({
              type: 'error',
              message: '删除失败，请检查!'
            })
          })
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消删除'
          });          
        });
    },
    findAll () {
      this.$http.get(this.resource + '/testdetail/findAll/' + this.$route.params.id).then((res) => {
        this.arrData = res.data
      })
    },
    add () {
      this.dialogFormVisible = true
      this.method = 'add'
      this.form = {
        title: null,
        content: null,
        test_id: this.$route.params.id
      }
    },
    edit (data) {
      this.dialogFormVisible = true
      this.method = 'edit'
      this.form = {
        id: data.id,
        title: data.title,
        content: data.content,
        test_id: data.test_id
      }
    },
    submitForm (formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          if (this.method == 'add') {
            this.$http.post(this.resource + '/testdetail/add', this.form).then((res) => {
              this.dialogFormVisible = false
              this.findAll()
              this.$message({
                type: 'success',
                message: '添加成功!'
              })
            }).catch((err) => {
              this.$message({
                type: 'error',
                message: '添加失败，请检查!'
              })
            })
          } else {
            this.$http.put(this.resource + '/testdetail/put', this.form).then((res) => {
              this.dialogFormVisible = false
              this.findAll()
              this.$message({
                type: 'success',
                message: '修改成功!'
              })
            }).catch((err) => {
              this.$message({
                type: 'error',
                message: '修改失败，请检查!'
              })
            })
          }
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
