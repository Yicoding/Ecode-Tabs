-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tabs
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `edit`
--

DROP TABLE IF EXISTS `edit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `demo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit`
--

LOCK TABLES `edit` WRITE;
/*!40000 ALTER TABLE `edit` DISABLE KEYS */;
INSERT INTO `edit` VALUES (4,'测试','file/1513518874144canvas验证码.html'),(6,'demo','file/1513518878484tencentMap lat.html'),(7,'CSS3','file/1518075953528盒模型.html'),(8,'css','file/1518075957623XHR.png'),(9,'纸质样式卡片','file/1518080851408纸质样式卡片(带阴影效果).html'),(10,'js基础',NULL);
/*!40000 ALTER TABLE `edit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editcontent`
--

DROP TABLE IF EXISTS `editcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editcontent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `edit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editcontent`
--

LOCK TABLES `editcontent` WRITE;
/*!40000 ALTER TABLE `editcontent` DISABLE KEYS */;
INSERT INTO `editcontent` VALUES (4,'<p><img style=\"max-width:100%;\" class=\"wscnph\" src=\"static/img/1517408697322QQ截图20180124172219.png\" data-mce-src=\"static/img/1517408697322QQ截图20180124172219.png\">&nbsp;111<br></p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fsfsf</p>',4),(6,'<p><img style=\"max-width:100%;\" style=\"max-width:100%;\" class=\"wscnph\" src=\"static/img/1517388783354XHR.png\" data-mce-src=\"static/img/1517388783354XHR.png\" data-mce-style=\"max-width: 100%;\"></p><ul><li>111</li></ul><p>&nbsp; &nbsp; &nbsp;232434</p><p>34324</p>',6),(7,'<p><strong>1.css盒模型：</strong><br></p><p>&nbsp;<br></p><p><strong>&nbsp; &nbsp; </strong>width：指的是content（填充内容的宽度）</p><p>&nbsp;<br></p><p>&nbsp; &nbsp; 元素的最终宽度 = content（手写的width） + padding*2 + border*2</p><p>&nbsp;<br></p><p><strong>&nbsp; &nbsp; </strong><span style=\"color: rgb(255, 0, 255);\" data-mce-style=\"color: #ff00ff;\">IE5和IE6中呈现怪异模式：</span><strong>&nbsp;</strong><strong>&nbsp;</strong>width（手写的width） = content + padding*2 + border*2</p><p>&nbsp;<br></p><p><strong>2.box-sizing 属性</strong></p><p>&nbsp;<br></p><p>&nbsp; &nbsp; box-sizing: content-box | border-box | inherit<br></p><p>&nbsp; &nbsp;&nbsp;</p><p>&nbsp; &nbsp;&nbsp;content-box：普通盒模型&nbsp; &nbsp; &nbsp;&nbsp;<span style=\"color: rgb(255, 0, 255);\" data-mce-style=\"color: #ff00ff;\">border-box：怪异模式</span>&nbsp; &nbsp; &nbsp;&nbsp;inherit：继承父元素的属性</p><p>&nbsp;<br></p><p><strong>3.box-shadow（阴影）：</strong></p><p><strong>&nbsp;&nbsp;</strong></p><p><strong>&nbsp; &nbsp;</strong><span style=\"color: rgb(0, 0, 0);\" data-mce-style=\"color: #000000;\"> box-shadow: <em>h-shadow v-shadow blur spread color</em>&nbsp;inset;</span></p><p>&nbsp;<br></p><p><span style=\"color: rgb(0, 0, 0);\" data-mce-style=\"color: #000000;\">&nbsp; &nbsp;&nbsp;<span style=\"color: rgb(255, 0, 255);\" data-mce-style=\"color: #ff00ff;\">h-shadow：必需的。水平阴影的位置。允许负值</span></span></p><p>&nbsp;<br></p><p><strong><em>&nbsp; &nbsp;</em></strong><span style=\"color: rgb(255, 0, 255);\" data-mce-style=\"color: #ff00ff;\"> <span data-mce-type=\"bookmark\" id=\"mce_14_start\" data-mce-style=\"overflow: hidden; line-height: 0px;\" style=\"overflow:hidden;line-height:0px\"></span>v-shadow：必需的。垂直阴影的位置。允许负值</span></p><p>&nbsp;<br></p><p><strong><span style=\"color: rgb(255, 0, 255);\" data-mce-style=\"color: #ff00ff;\">&nbsp; &nbsp; </span></strong><span style=\"color: rgb(255, 0, 255);\" data-mce-style=\"color: #ff00ff;\">&nbsp;</span><span style=\"color: rgb(255, 0, 255);\" data-mce-style=\"color: #ff00ff;\">blur：可选。模糊距离</span></p><p>&nbsp;<br></p><p><span style=\"color: rgb(255, 0, 255);\" data-mce-style=\"color: #ff00ff;\">&nbsp; &nbsp;&nbsp;spread：可选。阴影的大小</span></p><p>&nbsp;<br></p><p><span style=\"color: rgb(255, 0, 255);\" data-mce-style=\"color: #ff00ff;\">&nbsp; &nbsp;&nbsp;color：可选。阴影的颜色</span></p><p>&nbsp;<br></p><p><span style=\"color: rgb(255, 0, 255);\" data-mce-style=\"color: #ff00ff;\">&nbsp; &nbsp;&nbsp;inset：可选。从外层的阴影（开始时）改变阴影内侧阴影</span></p><p><span style=\"color: rgb(255, 0, 255);\" data-mce-style=\"color: #ff00ff;\"><br data-mce-bogus=\"1\"></span></p><p><strong><span style=\"color: rgb(0, 0, 0);\" data-mce-style=\"color: #000000;\">4.CSS3的换行<br data-mce-bogus=\"1\"></span></strong></p><p><strong><span style=\"color: rgb(0, 0, 0);\" data-mce-style=\"color: #000000;\"><br data-mce-bogus=\"1\"></span></strong></p><p><strong><span style=\"color: rgb(0, 0, 0);\" data-mce-style=\"color: #000000;\">&nbsp; &nbsp;&nbsp;</span></strong><span class=\"hl-identifier\">p</span> <span class=\"hl-brackets\">{</span><span class=\"hl-reserved\">word-wrap:</span><span class=\"hl-string\">break-word</span><span class=\"hl-code\">;</span><span class=\"hl-brackets\">}</span></p>',7),(8,NULL,8),(9,NULL,9),(10,'<p><strong>1.创建对象：</strong></p><p>function Demo(){<br>&nbsp; &nbsp; this.name=\"张思\";<br>&nbsp; &nbsp; this.age=12;<br>&nbsp; &nbsp; this.firstF=function(){<br>&nbsp; &nbsp; }<br>&nbsp; &nbsp; this.secondF=function(){<br>&nbsp; &nbsp; }<br>}</p><p>var one=new Demo()</p><p>// 调用输出<br>console.log(one.age)</p><p><strong>2.访问对象的属性</strong></p><p>var person = {<br>&nbsp; &nbsp; firstName: \"John\",<br>&nbsp; &nbsp; lastName : \"Doe\",<br>&nbsp; &nbsp; id : 5566<br>}</p><p>console.log(person[id])</p><p><strong>3.对象方法</strong></p><p>var person = {<br>&nbsp; &nbsp; firstName: \"John\",<br>&nbsp; &nbsp; lastName : \"Doe\",<br>&nbsp; &nbsp; id : 5566,<br>&nbsp; &nbsp; fullName : function()&nbsp; {<br>&nbsp; &nbsp; &nbsp; &nbsp; return this.firstName + \" \" + this.lastName<br>&nbsp; &nbsp; }<br>}</p><p>console.log(person.fullName())</p><p><strong>4.生成新对象</strong><br></p><p><strong><img style=\"max-width:100%;\" style=\"max-width:100%;\" class=\"wscnph\" src=\"static/img/1520478630527循环对象生成新对象.png\" data-mce-src=\"static/img/1520478630527循环对象生成新对象.png\" data-mce-style=\"max-width: 100%;\"></strong></p><p><strong>5.let var区别</strong></p><p><strong><img style=\"max-width:100%;\" style=\"max-width:100%;\" class=\"wscnph\" src=\"static/img/1520502255021var.png\" data-mce-src=\"static/img/1520502255021var.png\" data-mce-style=\"max-width: 100%;\"></strong></p><p><strong>6.常见的HTML事件</strong></p><p><strong><img style=\"max-width:100%;\" style=\"max-width:100%;\" class=\"wscnph\" src=\"static/img/1520503796807常见的HTML事件.png\" data-mce-src=\"static/img/1520503796807常见的HTML事件.png\" data-mce-style=\"max-width: 100%;\"></strong></p><p><strong>7.函数的声明与调用</strong></p><p><strong><img style=\"max-width:100%;\" style=\"max-width:100%;\" class=\"wscnph\" src=\"static/img/1520564792575函数的声明与调用.png\" data-mce-src=\"static/img/1520564792575函数的声明与调用.png\" data-mce-style=\"max-width: 100%;\"></strong></p><p><strong>8.闭包+let</strong></p><p><strong><img style=\"max-width:100%;\" style=\"max-width:100%;\" class=\"wscnph\" src=\"static/img/1520565509231闭包解决+let.png\" data-mce-src=\"static/img/1520565509231闭包解决+let.png\" data-mce-style=\"max-width: 100%;\"></strong></p><p><strong><img style=\"max-width:100%;\" style=\"max-width:100%;\" class=\"wscnph\" src=\"static/img/1520566836743传值.png\" data-mce-src=\"static/img/1520566836743传值.png\" data-mce-style=\"max-width: 100%;\"></strong></p><p><strong>9.数字取模<br></strong></p><p><strong><img style=\"max-width:100%;\" class=\"wscnph\" src=\"static/img/1520582167275数字取模.png\" data-mce-src=\"static/img/1520582167275数字取模.png\"></strong></p>',10);
/*!40000 ALTER TABLE `editcontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `site` varchar(200) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (1,'Vue官网','https://cn.vuejs.org/v2/guide/',1),(2,'Echarts3','http://echarts.baidu.com/examples.html',2),(3,'React官网','https://facebook.github.io/react/',3),(4,'Echarts2','http://echarts.baidu.com/echarts2/doc/example.html',2),(5,'element-ui官网','http://element.eleme.io/#/zh-CN/component/installation',1),(6,'vue-router官网','https://router.vuejs.org/zh-cn/',1),(10,'github官网','https://github.com/',7),(11,'码云-开源中国','https://git.oschina.net/',7),(12,'Vue开源项目查询','https://www.ctolib.com/cheatsheets-vuejs.html',1),(13,'慕课网','http://www.imooc.com/course/list',7),(14,'开放统计-应用概况','http://data.xfyun.cn/appsummary?flag=demo',7),(15,'钉钉开放平台','https://open.dingtalk.com/?spm=a219a.7629140.0.0.jPoFZ8',7),(16,'百度地图JavaScript API','http://lbsyun.baidu.com/index.php?title=jspopular',8),(17,'Mint-ui移动端','https://mint-ui.github.io/#!/zh-cn',1),(18,'Vue相关开源项目库汇总','https://github.com/opendigg/awesome-github-vue',1),(19,'Laravel官网','https://www.codecasts.com/',7),(20,'webpack官网','https://doc.webpack-china.org/',7),(21,'Spring官网','https://spring.io/',7),(22,'老戴-翻墙','https://laod.cn/hosts/2017-google-hosts.html',9),(23,'bootstrap-table官网','http://bootstrap-table.wenzhixin.net.cn/zh-cn/documentation/',7),(24,'w3cschool','http://www.w3school.com.cn/',7),(25,'icon图标网','https://icomoon.io/',7),(26,'nodejs官网','http://nodejs.cn/api/',10),(27,'高德地图','https://lbs.amap.com/',8),(28,'maven环境配置','http://blog.csdn.net/qq_33979657/article/details/52909241',9),(29,'nodejs菜鸟驿站','http://www.runoob.com/nodejs/nodejs-tutorial.html',10),(30,'微信小程序','https://mp.weixin.qq.com/debug/wxadoc/dev/',7),(31,'Vuex中文网','https://vuex.vuejs.org/zh-cn/intro.html',1),(32,'Vux移动端','https://vux.li/#/',1),(33,'react开源项目','http://www.lcode.org/category/react-native-zong/react-native-source-code/',3),(34,'morris','https://morrisjs.github.io/morris.js/',2),(35,'Hightcharts','https://www.hcharts.cn/demo/highcharts/line-basic',2),(36,'阿里云课程','https://yq.aliyun.com/video/TagSearch/cid_0-tagid_17106?spm=5176.100244.0.0.o9UJrK',7),(37,'nowa','https://nowa-webpack.github.io/nowa/?spm=a219a.7629140.0.0.ZxxThJ',9),(38,'Vonic','https://wangdahoo.github.io/vonic-documents/#/',1),(39,'MUI','http://dev.dcloud.net.cn/mui/ui/',1),(40,'vue-impression','https://newdadafe.github.io/impression_vue/#/input-number',1),(41,'专业基础云计算','https://console.ucloud.cn/dashboard',9),(42,'react中文网','http://www.react-cn.com/docs/getting-started.html',3),(43,'react入门教程','https://hulufei.gitbooks.io/react-tutorial/content/introduction.html',3),(44,'Docker','https://www.docker.com/docker-windows#/overview',9),(45,'docker文档','https://docs.docker.com/',9),(46,'react native中文网','http://reactnative.cn/',3),(47,'ES6入门','http://es6.ruanyifeng.com/#docs/function',11),(48,'Promise','https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Promise',11),(49,'Fetch','https://fetch.spec.whatwg.org/',11),(50,'Fetch API','https://developer.mozilla.org/zh-CN/docs/Web/API/Fetch_API',11),(51,'API BluePrint','https://apiblueprint.org/',9),(52,'axios','https://www.npmjs.com/package/axios',11),(53,'zeptojs','http://zeptojs.com/',11),(54,'swagger','https://swagger.io/',9),(55,'nodejs教程','http://www.yiibai.com/nodejs/',10),(56,'react-ui','https://www.ctolib.com/react-ui.html',3),(57,'react-router中文文档','http://www.uprogrammer.cn/react-router-cn/',3),(58,'nodejs文件上传','http://www.yiibai.com/nodejs/nodejs_ch1627.html',10),(59,'NavDrawer组件库','https://myronliu347.github.io/vue-carbon/book/v0.5.0/popups/drawer.html',1),(60,'jade模板引擎','https://segmentfault.com/a/1190000000357534',11),(61,'Express中文文档','https://expressjs.com/zh-cn/starter/installing.html',10),(62,'微信公众号','https://open.weixin.qq.com/cgi-bin/showdocument?action=dir_list&t=resource/res_list&verify=1&id=open1421823488&token=f6abe9625c9789b4b08d5ee74cf1da0b661e7238&lang=zh_CN',7),(63,'存储库管理器','https://help.sonatype.com/display/NXRM3',9),(64,'历史操作','https://developer.mozilla.org/en-US/docs/Web/API/History_API',9),(65,'Koa框架','https://github.com/guo-yu/koa-guide',10),(66,'MongoDB中文文档','http://docs.mongoing.com/manual-zh/index.html',12),(67,'MongoDB学习笔记','http://blog.csdn.net/sinat_25127047/article/details/50560167',12),(68,'node入门','https://www.nodebeginner.org/index-zh-cn.html',10),(69,'mongodb中文社区','http://www.mongoing.com/',12),(70,'kafka入门介绍','http://orchome.com/5',9),(71,'kafka官网','https://kafka.apache.org/quickstart',9),(72,'各种CDN','http://www.codeyyy.com/javascript/8-117-120.html',11),(73,'mongoose官网','http://mongoosejs.com/',12),(74,'node部署阿里云','http://www.jianshu.com/p/0496ef49b2a5',10),(75,'nuxt官网','https://nuxtjs.org/guide/installation',1),(76,'koa2','https://www.npmjs.com/package/koa2',10),(77,'vue服务端渲染','https://ssr.vuejs.org/zh/',1),(78,'koa2学习笔记','https://chenshenhai.github.io/koa2-note/',10),(79,'weex原生','http://weex.apache.org/cn/guide/index.html',1),(80,'管理后台','https://www.ctolib.com/article/wiki/44721',9),(81,'企业信息管理系统','http://stardust.baiytfp.com/auth/login',9),(82,'axios中文文档','https://www.kancloud.cn/yunye/axios/234845',11),(83,'在线课堂-汇智网','http://www.hubwiz.com/class/55c2c01e3ad79a1b05dcc432',9),(84,'lodash中文文档','http://lodashjs.com/docs/',11),(85,'sequelizejs','http://docs.sequelizejs.com/',11),(86,'Mysql数据库建立多对多关系表','http://13145200724.blog.51cto.com/6263780/1370753',12),(87,'站长工具','http://tool.chinaz.com/tools/imgtobase',9),(88,'H5上传图片','http://www.aliyue.net/573.html',13),(89,'H5拍照上传','https://stackoverflow.com/questions/14069421/show-an-image-preview-before-upload',13),(90,'树形-无限递归','http://blog.csdn.net/jayhkw/article/details/68945087',11),(91,'金云龙','https://segmentfault.com/u/jinyunlong',9),(92,'avalonjs','http://avalonjs.coding.me/',11),(93,'zeptojs中文','http://www.css88.com/doc/zeptojs_api/',11),(94,'响应式html5框架','http://www.cnblogs.com/zhicheng/p/4389645.html',9),(95,'h5 input 新特性','http://www.cnblogs.com/polk6/p/5417921.html',13),(96,'vue微信端框架YDUI','http://vue.ydui.org/',1),(97,'kairosdb中文社区','http://www.kairosdb.com/',7),(98,'网易云音乐接口','https://api.imjad.cn/cloudmusic.md',7),(99,' canvas示例','https://segmentfault.com/a/1190000006258726',13),(100,'jquery中文文档','http://jquery.cuishifeng.cn/',11),(101,'kafka-node','https://www.npmjs.com/package/wmf-kafka-node',10),(102,' 尤雨溪-知乎','https://www.zhihu.com/people/evanyou/answers?page=2',9),(103,'腾讯课堂','https://ke.qq.com/',7),(104,'跨域','https://github.com/FatDong1/cross-domain',11),(105,'博客首页','https://www.xuhaodong.cn/home',9),(106,'ES6-babel','https://babeljs.io/learn-es2015/',11),(107,'jquery树形菜单','http://www.jq22.com/jquery-info7449',11),(108,'jquery树形下拉菜单','http://www.jq22.com/yanshi8172',11),(109,'统计数组字符串','http://www.myexception.cn/web/1751543.html',11),(110,'ES6新方法','http://www.css88.com/archives/5710',11),(111,'可拖动弹窗','http://www.cnblogs.com/adventureofraindrop/p/6086298.html',11),(112,'动态添加echarts路径','http://bbs.csdn.net/topics/390886673',2),(113,'vue中使用echarts','http://www.cnblogs.com/jasonwang2y60/p/6517931.html',2),(114,'echarts引入','http://www.myexception.cn/javascript/2026854.html',2),(115,'谷歌翻译','https://translate.google.cn/',7),(116,'百度','https://www.baidu.com/?tn=78040160_5_pg&ch=1',7),(117,'adminTLE','https://adminlte.io/',14),(118,'在jsx里面使用vue','https://telanx.github.io/2017/08/25/Vue%E5%9C%A8JSX%E4%B8%AD%E4%BD%BF%E7%94%A8%E5%85%A8%E5%B1%80%E5%AE%89%E8%A3%85%E7%9A%84%E7%BB%84%E4%BB%B6/',1),(119,'sql菜鸟教程','http://www.runoob.com/sql/sql-tutorial.html',12),(120,'云之讯开放平台','http://docs.ucpaas.com/doku.php?id=home',7),(121,'css定位','http://www.zhangxinxu.com/wordpress/2011/08/css%E7%9B%B8%E5%AF%B9%E5%AE%9A%E4%BD%8Drelative%E7%BB%9D%E5%AF%B9%E5%AE%9A%E4%BD%8Dabsolute%E7%B3%BB%E5%88%97%EF%BC%88%E5%9B%9B%EF%BC%89/',13),(122,'MySQL建立多对多数据表关系','http://13145200724.blog.51cto.com/6263780/1370753',12),(123,'Tiny图片压缩网','https://tinypng.com/',7),(124,'vue:keep-alive','http://blog.csdn.net/sinat_17775997/article/details/62231818',1),(125,'element-ui表格单选','http://blog.csdn.net/rickiyeat/article/details/76595343',1),(126,'wegame游戏平台','http://www.wegame.com/client',7),(127,'开发APP','http://ask.dcloud.net.cn/article/237',9),(128,'node-kafka','https://www.npmjs.com/package/kafka-node',10),(129,'npm官网','https://www.npmjs.com/',10),(130,'移动端下拉加载更多','http://www.cnblogs.com/Nick-chen/p/6439609.html?utm_source=itdadao&utm_medium=referral',11),(131,'element-ui树形表格','http://blog.csdn.net/s8460049/article/details/61414751',1),(132,'正则判断小数点后两位','https://zhidao.baidu.com/question/542540657.html',11),(133,'reactiveX','http://reactivex.io/',11),(134,'vertx','http://vertx.io/docs/',11),(135,'better-scroll最好的移动端滚动组件','https://ustbhuangyi.github.io/better-scroll/doc/zh-hans/#better-scroll %E6%98%AF%E4%BB%80%E4%B9%88',11),(136,'技术胖视频','https://juejin.im/post/5a5bc8c36fb9a01ca26774eb',9),(137,'easy-javascript','http://www.longestory.com/easy-javascript/',11),(138,'技术阶段','https://juejin.im/post/5a576e98518825734d148a00',9),(139,'ECharts 实现地图散点图','http://echarts.baidu.com/blog/2016/04/28/echarts-map-tutorial.html',2),(140,'avaScript 格式化数字、金额、千分位、保留几位小数、舍入舍去…','http://www.css88.com/archives/7324',11),(141,'慕课大学','http://daxue.imooc.com/',7),(142,'z.less','http://www.aibusy.com/zless/',14),(143,'iH5','http://www.ih5.cn/not-logged-in',13),(144,'H5交互设计器','http://www.epub360.com/',13),(145,'swiper移动端触摸互动组件','http://www.swiper.com.cn/',13),(146,'Mysql基础','http://www.wclimb.site/2017/07/20/MySQL%E5%9F%BA%E7%A1%80/#more',12),(147,'TypeScript中文网','https://www.tslang.cn/',11),(148,'Spring Data JPA','https://docs.spring.io/spring-data/jpa/docs/2.0.2.RELEASE/reference/html/',9),(149,'字符串模板解析','https://juejin.im/post/5a373e096fb9a044fc44d4c9',13),(150,'canvas的基本用法','https://developer.mozilla.org/zh-CN/docs/Web/API/Canvas_API/Tutorial/Basic_usage',13),(151,'印象笔记（工作必备效率应用）','https://www.yinxiang.com/',9),(152,'草料二维码','https://cli.im/url',9),(153,'ajexoop','http://www.ajexoop.com/wordpress/',9),(154,'webGl中文网','http://www.hewebgl.com/article/articledir/1',9),(155,'three.js','https://threejs.org/',11),(156,'Create.js中文网','http://www.createjs.cc/',11),(157,'canvas滑动验证','http://blog.csdn.net/qq_33548381/article/details/53495673',13),(158,'vuejs升级踩坑日志','https://juejin.im/post/5a1af88f5188254a701ec230',1),(159,'ckeditor文本编辑器','https://ckeditor.com/',9),(160,'Cube-ui移动端vueUI框架','https://didi.github.io/cube-ui/#/zh-CN/docs/quick-start',1),(161,'sass参考手册','http://sass.bootcss.com/docs/sass-reference/',14),(162,'Flex布局教程-阮一峰','http://www.ruanyifeng.com/blog/2015/07/flex-grammar.html',14),(163,'JS中的forEach、$.each、map方法推荐','http://www.jb51.net/article/81955.htm',11),(164,'开源中国社区','https://www.oschina.net/',7),(165,'最详尽的 JS 原型与原型链终极详解','https://www.jianshu.com/p/dee9f8b14771',11),(166,'JavaScript 教程','http://www.w3school.com.cn/js/',11),(167,'Vue 脱坑记 - 查漏补缺','https://juejin.im/post/59fa9257f265da43062a1b0e?utm_source=weibo&utm_campaign=admin',1),(168,'knockoutjs','http://knockoutjs.com/',11),(169,'tinymce文本编辑器','https://www.tinymce.com/features/',9),(170,'ueditor富文本编辑器','http://ueditor.baidu.com/website/',9),(171,'layui经典模块化前端框架','http://www.layui.com/',14),(172,'momentjs中文网','http://momentjs.cn/',11),(173,'vue省市区三联动下拉选择组件的实现','http://blog.csdn.net/yangbingbinga/article/details/61922345',1),(174,'利用Vue v-model实现一个自定义的表单组件','http://blog.csdn.net/yangbingbinga/article/details/61915038',1),(175,'阿里巴巴矢量图网站','http://www.iconfont.cn/',7);
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(9999) DEFAULT NULL,
  `content` mediumtext,
  `test_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'num ++ 跟 ++ num的区别','一个是先运算，一个是先加值',1),(10,'什么是闭包？','答案一：<br/>\n闭包就是能够读取其他函数内部变量的函数。<br/>\n由于在Javascript语言中，只有函数内部的子函数才能读取局部变量，因此可以把闭包简单理解成“定义在一个函数内部的函数”。<br/>\n所以，在本质上，闭包就是将函数内部和函数外部连接起来的一座桥梁。<br/>\n答案二：<br/>\n当内部函数 在定义它的作用域 的外部 被引用时,就创建了该内部函数的闭包 ,如果内部函数引用了位于外部函数的变量,当外部函数调用完毕后,这些变量在内存不会被 释放,因为闭包需要它们.',1),(11,'闭包的用途？','它的最大用处有两个，一个是前面提到的可以读取函数内部的变量，另一个就是让这些变量的值始终保持在内存中。',1),(12,'使用闭包应注意的点？','1）由于闭包会使得函数中的变量都被保存在内存中，内存消耗很大，所以不能滥用闭包，否则会造成网页的性能问题，在IE中可能导致内存泄露。解决方法是，在退出函数之前，将不使用的局部变量全部删除。<br/>\n2）闭包会在父函数外部，改变父函数内部变量的值。所以，如果你把父函数当作对象（object）使用，把闭包当作它的公用方法（Public Method），把内部变量当作它的私有属性（private value），这时一定要小心，不要随便改变父函数内部变量的值。',1),(13,'什么是JavaScript 代码块？','块由左花括号开始，由右花括号结束。<br/>\n块的作用是使语句序列一起执行。<br/>\nJavaScript 函数是将语句组合在块中的典型例子。<br/>',1),(14,'css新特性？','平移、旋转、多背景图',7),(15,'三种方法能够确定浏览器窗口的尺寸','对于Internet Explorer、Chrome、Firefox、Opera 以及 Safari：<br/>\n<br/>\nwindow.innerHeight - 浏览器窗口的内部高度(包括滚动条)<br/>\nwindow.innerWidth - 浏览器窗口的内部宽度(包括滚动条)<br/><br/>\n对于 Internet Explorer 8、7、6、5：<br/>\ndocument.documentElement.clientHeight<br/>\ndocument.documentElement.clientWidth<br/><br/>\n或者<br/>\ndocument.body.clientHeight<br/>\ndocument.body.clientWidth<br/>\n<br/>\n实例：<br/>\nvar w=window.innerWidth\n|| document.documentElement.clientWidth\n|| document.body.clientWidth;<br/>\n\nvar h=window.innerHeight\n|| document.documentElement.clientHeight\n|| document.body.clientHeight;',8),(16,'window.open()','window.open(URL,name,specs,replace) <br/>\n<br/>\nfunction openWin(){ <br/>\n    myWindow=window.open(\'\',\'\',\'width=200,height=100\'); <br/>\n    myWindow.document.write(\"<p>这是\'我的窗口\'</p>\"); <br/>\n    myWindow.focus(); <br/>\n}\n',8),(17,'Window Screen','screen.availWidth - 可用的屏幕宽度 <br/>\nscreen.availHeight - 可用的屏幕高度',8),(18,'Window Location','location.hostname 返回 web 主机的域名 <br/>\nlocation.pathname 返回当前页面的路径和文件名 <br/>\nlocation.port 返回 web 主机的端口 （80 或 443） <br/>\nlocation.protocol 返回所使用的 web 协议（http:// 或 https://） <br/>',8),(19,'Window History','history.back() - 与在浏览器点击后退按钮相同 <br/>\nhistory.forward() - 与在浏览器中点击向前按钮相同',8),(20,'window.navigator 对象包含有关访问者浏览器的信息','<p>浏览器代号:  navigator.appCodeName  </p>\n<p>浏览器名称:   navigator.appName  </p>\n<p>浏览器版本:   navigator.appVersion  </p>\n<p>启用Cookies:  navigator.cookieEnabled  </p>\n<p>硬件平台:   navigator.platform  </p>\n<p>用户代理:  navigator.userAgent  </p>\n<p>用户代理语言:   navigator.systemLanguage  </p>\n',8),(21,'window.confirm(\"sometext\")确认框','var r=confirm(\"按下按钮\"); <br/>\nif (r==true)<br/>\n{<br/>\n    x=\"你按下了\\\"确定\\\"按钮!\";<br/>\n}<br/>\nelse<br/>\n{<br/>\n    x=\"你按下了\\\"取消\\\"按钮!\";<br/>\n}<br/>',8),(22,'window.prompt(\"sometext\",\"defaultvalue\")提示框','提示框经常用于提示用户在进入页面前输入某个值。<br/>\n当提示框出现后，用户需要输入某个值，然后点击确认或取消按钮才能继续操纵。<br/>\n如果用户点击确认，那么返回值为输入的值。如果用户点击取消，那么返回值为 null。<br/>\n<br>\n实例：<br/>\nvar person=prompt(\"请输入你的名字\",\"Harry Potter\");<br/>\nif (person!=null && person!=\"\")<br/>\n{\n    x=\"你好 \" + person + \"! 今天感觉如何?\";<br/>\n    document.getElementById(\"demo\").innerHTML=x;<br/>\n}',8),(23,'JavaScript 计时事件','setInterval() - 间隔指定的毫秒数不停地执行指定的代码。<br/>\nwindow.setInterval(\"javascript function\",milliseconds);<br/>\nsetInterval(function(){alert(\"Hello\")},3000);<br/>\nwindow.clearInterval(intervalVariable)<br/>\n<br/>\nsetTimeout() - 暂停指定的毫秒数后执行指定的代码<br/>\nwindow.setTimeout(\"javascript 函数\",毫秒数);<br/>\nindow.clearTimeout(timeoutVariable)',8),(24,'JavaScript Cookie','什么是 Cookie？<br/>\nCookie 是一些数据, 存储于你电脑上的文本文件中。<br/>\n当 web 服务器向浏览器发送 web 页面时，在连接关闭后，服务端不会记录用户的信息。<br/>\nCookie 的作用就是用于解决 \"如何记录客户端的用户信息\":<br/>\n当用户访问 web 页面时，他的名字可以记录在 cookie 中。<br/>\n在用户下一次访问该页面时，可以在 cookie 中读取用户访问记录。<br/>\n<br/><br/>\n使用 JavaScript 创建Cookie: <br/>\nJavaScript 中，创建 cookie 如下所示：<br/>\ndocument.cookie=\"username=John Doe\";(一次只能创建一个)<br/>\n您还可以为 cookie 添加一个过期时间（以 UTC 或 GMT 时间）。默认情况下，cookie 在浏览器关闭时删除：<br/>\ndocument.cookie=\"username=John Doe; expires=Thu, 18 Dec 2013 12:00:00 GMT\";<br/>\n您可以使用 path 参数告诉浏览器 cookie 的路径。默认情况下，cookie 属于当前页面。<br/>\ndocument.cookie=\"username=John Doe; expires=Thu, 18 Dec 2013 12:00:00 GMT; <br/>\n<br/>\n使用 JavaScript 删除 Cookie：<br/>\n删除 cookie 非常简单。您只需要设置 expires 参数为以前的时间即可，如下所示，设置为 Thu, 01 Jan 1970 00:00:00 GMT:<br/>\n\ndocument.cookie = \"username=; expires=Thu, 01 Jan 1970 00:00:00 GMT\";',8),(25,'获取 cookie 值的函数','\n然后，我们创建一个函数用户返回指定 cookie 的值：<br/>\n\nfunction getCookie(cname)<br/>\n{<br/>\n  var name = cname + \"=\";<br/>\n  var ca = document.cookie.split(\';\');<br/>\n  for(var i=0; i<ca.length; i++) <br/>\n  {<br/>\n    var c = ca[i].trim();<br/>\n    if (c.indexOf(name)==0) return c.substring(name.length,c.length);<br/>\n  }<br/>\n  return \"\";<br/>\n}<br/>',8),(26,'JavaScript：验证是否是数字','if isNaN(x) {alert(\"不是数字\")};',1);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_site`
--

DROP TABLE IF EXISTS `type_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_site`
--

LOCK TABLES `type_site` WRITE;
/*!40000 ALTER TABLE `type_site` DISABLE KEYS */;
INSERT INTO `type_site` VALUES (1,'vue'),(2,'echarts'),(3,'react'),(7,'website'),(8,'map'),(9,'other'),(10,'nodejs'),(11,'js'),(12,'database'),(13,'html'),(14,'ui');
/*!40000 ALTER TABLE `type_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_test`
--

DROP TABLE IF EXISTS `type_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_test`
--

LOCK TABLES `type_test` WRITE;
/*!40000 ALTER TABLE `type_test` DISABLE KEYS */;
INSERT INTO `type_test` VALUES (1,'原生js'),(6,'html'),(7,'css'),(8,'BOM');
/*!40000 ALTER TABLE `type_test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-12 22:24:02
