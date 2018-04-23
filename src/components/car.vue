<template>
  <div>
  	<BigImg :data="imgList"></BigImg>
  </div>
</template>

<script>
import BigImg from 'components/previewImg.vue'
export default {
  data () {
    return {
      imgList: [
        {path: 'http://ppt.h3c.com:5005/static/img/theme/theme1.jpg'},
        {path: 'http://ppt.h3c.com:5005/static/img/theme/theme2.jpg'},
        {path: 'http://ppt.h3c.com:5005/static/img/theme/theme3.jpg'}
      ]
    }
  },
  components: {
    BigImg
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  .el-button--default {
    background: green;
  }
</style>
