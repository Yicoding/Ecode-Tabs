<template>
  <div class="project-box">
  	<div class="div-title">
  		设备
  		<div class="right">
  			<el-button size="small">Excel导入</el-button>
  			<el-button size="small">列表选择</el-button>
  		</div>
  	</div>
  	<div class="div-top"></div>
  	<el-table
  	    :data="tableData"
  	    stripe
  	    style="width: 100%">
  	    <el-table-column
  	      type="index"
  	      label="序号"
  	      width="180">
  	    </el-table-column>
  	    <el-table-column
  	      prop="name"
  	      label="设备编号"
  	      width="180">
  	    </el-table-column>
  	    <el-table-column
  	      prop="date"
  	      label="类型"
  	      width="180">
  	    </el-table-column>
  	    <el-table-column
  	      prop="address"
  	      label="门店">
  	    </el-table-column>
  	</el-table>
  </div>
</template>

<script>
export default {
  data () {
    return {
  		msg: 'I am projectuser',
  		tableData: [{
          	date: '2016-05-02',
          	name: '王小虎',
          	address: '上海市普陀区金沙江路 1518 弄'
        }, {
          	date: '2016-05-04',
          	name: '王小虎',
          	address: '上海市普陀区金沙江路 1517 弄'
        }, {
          	date: '2016-05-01',
          	name: '王小虎',
          	address: '上海市普陀区金沙江路 1519 弄'
        }, {
          	date: '2016-05-03',
          	name: '王小虎',
          	address: '上海市普陀区金沙江路 1516 弄'
        }],
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
