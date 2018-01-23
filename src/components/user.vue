<template>
  <div>
    <el-dialog title="提示" :visible.sync="dialogFormVisible" size="tiny">
      <el-form :model="form" ref="form" :rules="rules">
        <el-form-item label="试卷名" prop="name">
          <el-input v-model="form.name" auto-complete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitForm('form')">确 定</el-button>
      </div>
    </el-dialog>
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span style="line-height: 36px;">前端列表</span>
        <el-button style="float: right;" type="primary" size="small" icon="el-icon-plus" @click="add">新增</el-button>
      </div>
      <div v-for="item in testArr" :key="item.id" class="text item" style="border-bottom: 1px solid #eee;">
        <el-button type="text" v-text="item.name" @click="jump(item.id)"></el-button>
        <el-button style="float: right;" size="small" :plain="true" icon="el-icon-delete" type="danger" @click="remove(item.id)">remove</el-button>
        <el-button style="float: right;" size="small" :plain="true" icon="el-icon-edit" type="warning" @click="edit(item)">edit</el-button>
      </div>
    </el-card>
  </div>
</template>

<script>
export default {
  data () {
      return {
        dialogFormVisible: false,
        testArr: [],
        form: {
          name: null,
        },
        rules: {
          name: [
             { required: true, message: '请输入试卷名', trigger: 'blur' }
          ]
        },
        isAdmin: false,
        isManager: false,
        method: null,
        did: null,
      }
    },
    computed: {
      project () {
        return this.$store.state.project
      },
    },
    created () {
      this.findAll()
    },
    methods: {
      findAll () {
        this.$http.get(this.resource + '/test/findAll').then((res) => {
          this.testArr = res.data
        })
      },
      jump (id) {
        this.$router.push('/testdetail/' + id)
      },
      add () {
        this.dialogFormVisible = true
        this.method = 'add'
        this.form = {
          name: null
        }
      },
      edit (value) {
        console.log(value)
        this.did = value.id
        this.dialogFormVisible = true
        this.method = 'edit'
        this.form = {
          id: value.id,
          name: value.name
        }
      },
      remove (id) {
        this.$confirm('此操作将永久删除该列表, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$http.delete(this.resource + '/test/remove/' + id).then((res) => {
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
      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            if (this.method == 'add') {
              this.$http.post(this.resource + '/test/add', this.form).then((res) => {
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
              this.$http.put(this.resource + '/test/put', this.form).then((res) => {
                this.dialogFormVisible = false
                this.findAll()
                this.$message({
                  type: 'success',
                  message: '编辑成功!'
                })
              }).catch((err) => {
                this.$message({
                  type: 'error',
                  message: '编辑失败，请检查!'
                })
              })
            }
          } else {
            console.log('error submit!!');
            return false;
          }
        });
      },
    },
    watch: {},
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
