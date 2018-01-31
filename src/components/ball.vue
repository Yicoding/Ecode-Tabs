<template>
  <div>
    <el-button size="small" @click="show">show</el-button>
    <div class="div-top"></div>
  	<div>
      <tinymce :height="300" v-model="content"></tinymce>
    </div>
    <div class="editor-content" v-html="content"></div>
  </div>
</template>

<script>
import Tinymce from 'components/Tinymce'
import city from 'components/city'
export default {
  components: { Tinymce },
  data() {
    return {
      msg: 'I am ball',
      content:
      `<h1 style="text-align: center;">Welcome to the TinyMCE demo!</h1>
      <ul>
        <li>Our <a href="//www.tinymce.com/docs/">documentation</a> is a great resource for learning how to configure TinyMCE.</li>
        <li>Have a specific question? Visit the <a href="https://community.tinymce.com/forum/">Community Forum</a>.</li>
        <li>We also offer enterprise grade support as part of <a href="https://tinymce.com/pricing">TinyMCE premium subscriptions</a>.</li>
      </ul>
      `
    }
  },
  mounted() {
  	console.log(JSON.stringify(city))
  },
  methods: {
    show() {
      console.log(this.content)
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  .box-side {
    background: red;
  }
</style>
