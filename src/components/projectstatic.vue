<template>
  <div class="project-box">
  	<div class="div-search">
  		<el-date-picker
  	      v-model="value3"
  	      align="right"
  	      type="date"
  	      placeholder="选择日期">
  	    </el-date-picker>
  	    &nbsp;&nbsp;&nbsp;&nbsp;离岗时长定义：<el-select v-model="valueLine" placeholder="请选择" size="small" style="width: 70px;">
        <el-option v-for="item in optionsLine" :key="item.value" :label="item.label" :value="item.value"></el-option>
      </el-select>&nbsp;分钟
      <div class="right"><el-button type="primary" size="small">导出数据</el-button></div>
  	</div>
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
  	      label="门店名称"
  	      min-width="180">
  	    </el-table-column>
  	    <el-table-column
  	      prop="date"
  	      label="渠道"
  	      min-width="180">
  	    </el-table-column>
  	    <el-table-column
  	      prop="address"
  	      min-width="260"
  	      label="地址">
  	    </el-table-column>
  	</el-table>
  </div>
</template>

<script>
export default {
  data () {
    return {
  		msg: 'I am static',
  		value3: '',
      	optionsLine: [
	        {value: 5, label: 5},
	        {value: 10, label: 10},
	        {value: 15, label: 15}
    	],
    	valueLine: 15,
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
        }, {
          	date: '2016-05-03',
          	name: '王小虎',
          	address: '上海市普陀区金沙江路 1516 弄'
        }, {
          	date: '2016-05-03',
          	name: '王小虎',
          	address: '上海市普陀区金沙江路 1516 弄'
        }, {
          	date: '2016-05-03',
          	name: '王小虎',
          	address: '上海市普陀区金沙江路 1516 弄'
        }, {
          	date: '2016-05-03',
          	name: '王小虎',
          	address: '上海市普陀区金沙江路 1516 弄'
        }, {
          	date: '2016-05-03',
          	name: '王小虎',
          	address: '上海市普陀区金沙江路 1516 弄'
        }, {
          	date: '2016-05-03',
          	name: '王小虎',
          	address: '上海市普陀区金沙江路 1516 弄'
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
