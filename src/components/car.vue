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
        {path: 'https://qcloudtest-1257454171.cos.ap-guangzhou.myqcloud.com/img/swiper-1.jpg'},
        {path: 'https://qcloudtest-1257454171.cos.ap-guangzhou.myqcloud.com/img/swiper-2.jpg'},
        {path: 'https://qcloudtest-1257454171.cos.ap-guangzhou.myqcloud.com/img/swiper-3.jpg'}
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
