<template>
  <div class="project-box">
  	<el-card class="box-card">
      <div slot="header" class="clearfix">
        <el-button size="small" icon="el-icon-edit" :plain="true" type="warning" @click="edit" v-show="!isEdit">编辑</el-button>
        <el-button v-show="isEdit" size="small" type="primary" @click="saveContent(htmlForEditor)">Save</el-button>
        <el-button v-show="isEdit" size="small" @click="find">Cancle</el-button>
        <el-button style="float: right;" size="small" icon="el-icon-arrow-left" @click="$router.go(-1)">返回到文本编辑列表</el-button>
      </div>
      <div class="text item">
        <div v-html="content" v-show="!isEdit"></div>
        <div v-show="isEdit">
          <!-- <vue-editor id="editor"
            useCustomImageHandler
            @imageAdded="handleImageAdded" v-model="htmlForEditor">
          </vue-editor> -->
          <tinymce :height="400" v-model="htmlForEditor" ref="tinymce"></tinymce>
        </div>
      </div>
    </el-card>
  </div>
</template>

<script>
// import { VueEditor } from 'vue2-editor'
import Tinymce from 'components/Tinymce'
export default {
  components: {
    // VueEditor
    Tinymce
  },
	data () {
  	return {
  		isAdmin: false,
    	isManager: false,
      kid: null,
      content: null,
      isEdit: false,
      htmlForEditor: null,
  	}
	},
	computed: {
		project () {
  	  return this.$store.state.project
  	},
	},
  created () {
    this.find()
  },
  methods: {
    edit() {
      this.isEdit = true
      this.$refs.tinymce.setContent(this.htmlForEditor)
    },
    find () {
      this.$http.get(this.resource + '/editcontent/find/' + this.$route.params.id).then((res) => {
        this.content = res.data.content
        this.htmlForEditor = res.data.content
        this.isEdit = false
      })
    },
    handleImageAdded (file, Editor, cursorLocation) {
      let formData = new FormData();
      console.log(file)
      formData.append('file', file)
      this.$http.post(this.resource + '/edit/img/upload', formData).then((result) => {
        console.log(JSON.stringify(result.data))
        let url = 'static/img/' + result.data.filename // Get url from response
        Editor.insertEmbed(cursorLocation, 'image', url);
      }).catch((err) => {
        this.$message({
          type: 'error',
          message: err
        })
      })
    },
    saveContent (content) {
      // console.log(content)
      let strArr = content.split('<img')
      let newStr = ''
      for (var k = 0; k < strArr.length-1; k++) {
        newStr = newStr + strArr[k] + '<img style="max-width:100%;"'
      }
      newStr = newStr + strArr[strArr.length-1]
      this.content = newStr
      console.log(newStr)
      this.$http.put(this.resource + '/editcontent/put', {content: this.content, edit_id: Number(this.$route.params.id)}).then((res) => {
        this.isEdit = false
      }).catch((err) => {
        this.$message({
          type: 'error',
          message: '服务器走神了，保存失败!'
        })
      })
    },
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
