<template>
  <div>
  	{{msg}}
  </div>
</template>

<script>
import city from 'components/city'
export default {
  data() {
    return {
      msg: 'I am ball'
    }
  },
  mounted() {
  	console.log(JSON.stringify(city))
  },
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
