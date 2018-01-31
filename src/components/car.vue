<template>
  <div>
  	{{msg}}
  </div>
</template>

<script>
export default {
  data () {
    return {
      msg: 'I am car'
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  .el-button--default {
    background: green;
  }
</style>
