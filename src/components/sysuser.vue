<template>
  <div>
    <el-dialog title="提示" :visible.sync="dialogFormVisible" size="tiny">
      <el-form :model="form" ref="form" :rules="rules">
        <el-form-item label="demo名" prop="name">
          <el-input v-model="form.name" auto-complete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitForm('form')">确 定</el-button>
      </div>
    </el-dialog>
    <form ref="formExcel" enctype="multipart/form-data"> 
      <div class="none"> 
        <input type="file" name="file" ref="file"/> 
      </div> 
    </form>
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span style="line-height: 36px;">文本列表</span>
        <el-button style="float: right;" type="primary" size="small" icon="plus" @click="add">新增</el-button>
      </div>
      <div v-for="item in testArr" :key="item.id" class="text item" style="border-bottom: 1px solid #eee;">
        <el-button type="text" v-text="item.name" @click="jump(item.id)"></el-button>
        <el-button style="float: right;" size="small" :plain="true" icon="delete" type="danger" @click="remove(item.id)">remove</el-button>
        <el-button style="float: right;" size="small" :plain="true" icon="edit" type="warning" @click="edit(item)">edit</el-button>
        <el-button style="float: right;" size="small" :plain="true" icon="document" @click="check(item)" v-if="item.demo">查看demo</el-button>
        <el-button style="float: right;" size="small" :plain="true" icon="upload" type="primary" @click="upload(item)">上传demo</el-button>
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
             { required: true, message: '请输入demo名', trigger: 'blur' }
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
    mounted () {
      this.$nextTick(function () {
        // 代码保证 this.$el 在 document 中
        this.$refs.file.onchange = () => {
          // console.log('change')
          let formData = new FormData(this.$refs.formExcel)
          formData.append('id', this.did)
          this.$http.post(this.resource + '/edit/upload', formData).then((response) => {
            console.log(response.data)
            this.findAll()
            this.$message({
              type: 'success',
              message: '上传成功!'
            })
          },(response) => {
            this.$message({
              type: 'error',
              message: '上传失败，请检查!'
            })
          })
        }
      })
    },
    methods: {
      findAll () {
        this.$http.get(this.resource + '/edit/findAll').then((res) => {
          this.testArr = res.data
        })
      },
      upload (item) {
        console.log(item)
        this.did = item.id
        this.$refs.file.click()
      },
      check (item) {
        window.open(this.resource + '/edit/checkFile?demo=' + item.demo)
      },
      jump (id) {
        this.$router.push('/edit/' + id)
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
          this.$http.delete(this.resource + '/edit/remove/' + id).then((res) => {
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
              this.$http.post(this.resource + '/edit/add', this.form).then((res) => {
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
              this.$http.put(this.resource + '/edit/put', this.form).then((res) => {
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
