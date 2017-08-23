<template>
  <div>
	<div class="div-title">
  		项目基本信息
  	</div>
  	<div class="infobox">
  		<!-- 创建时才有 -->
		<el-form :inline="true" :model="project" :rules="rules" ref="project" class="demo-form-inline" v-show="statusCreate">
		  <el-form-item label="项目编号" prop="sn">
		    <el-input placeholder="请输入项目编号" v-model="project.sn"></el-input>
		  </el-form-item>
		  <el-form-item label="项目名称" prop="name">
		    <el-input v-model="project.name" placeholder="请输入项目名称"></el-input>
		  </el-form-item>
		  <el-form-item label="客户名称">
		    <el-input v-model="project.customer" placeholder="请输入客户名称"></el-input>
		  </el-form-item>
		  <el-form-item label="品牌">
		    <el-input v-model="project.brand" placeholder="请输入品牌"></el-input>
		  </el-form-item>
		  <el-form-item label="* 计划开始日期" prop="date1">
	        <el-date-picker type="date" placeholder="选择日期" v-model="value1" style="width: 100%;" :picker-options="pickerOptions1"></el-date-picker>
	      </el-form-item>
	      <el-form-item label="* 计划结束日期" prop="date2">
	        <el-date-picker type="date" placeholder="选择日期" v-model="value2" style="width: 100%;" :picker-options="pickerOptions2"></el-date-picker>
	      </el-form-item>
	      <!-- 修改项目才有 -->
	      <el-form-item label="状态" v-if="pid">
	      	<div v-text="project.status" style="line-height: 36px;"></div>
	      </el-form-item>
		  <el-form-item>
		    <el-button size="small" type="primary" @click="submitForm('project')">保存</el-button>
		    <el-button size="small" type="info" @click="useproject" v-if="pid">执行</el-button>
		  </el-form-item>
		</el-form>
  	</div>
  	<div>
  		<el-tabs type="border-card" v-model="activeName">
		  <el-tab-pane label="人员" name="projectuser"></el-tab-pane>
		  <el-tab-pane label="设备" name="projectdevice"></el-tab-pane>
		  <el-tab-pane label="门店" name="store"></el-tab-pane>
		  <el-tab-pane label="关键词" name="keyword"></el-tab-pane>
		  <el-tab-pane label="统计" name="projectstatic"></el-tab-pane>
		</el-tabs>
		<div style="margin-top: 10px;">
  			<router-view></router-view>
		</div>
  	</div>
  </div>
</template>

<script>
export default {
	data  () {
		return {
			pid: '',
      		msg: 'I am addproject',
      		statusCreate: true,
      		project: {
		  		sn: '',
	      		name: '',
	      		customer: '',
	      		company: { // 公司
		    		id: '',
		    	},
      		},
      		rules: { // 验证规则
	        	sn: [{ required: true, message: '请输入项目编号', trigger: 'blur' }],
	        	name: [{ required: true, message: '请输入名称', trigger: 'blur' }],
		        status: [
		            { required: true, message: '请选择状态', trigger: 'change' }
		        ],
		        date: [{required: true, message: '请选择日期', trigger: 'change'}]
	        },
	        value1: '',
	        value2: '',
	        pickerOptions1: {},
	        pickerOptions2: {},
	      	brand: '',
	      	status: '创建',
	      	startDateEstimated: '', // 预计开始时间
	      	endDateEstimated: '', // 预计结束时间
	      	startDate: '', // 实际开始时间
	      	endDate: '', // 实际结束时间
	      	users: [], // 人员信息
	      	activeName: 'store',
		}
	},
	watch: {
		activeName (value) {
			this.$router.push('/addproject/' + value)
		}
	},
	methods: {
		submitForm () {

		}
	}
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
