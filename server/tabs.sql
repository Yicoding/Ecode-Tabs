-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: tabs
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (1,'Vue官网','https://cn.vuejs.org/v2/guide/',1),(2,'Echarts3','http://echarts.baidu.com/examples.html',2),(3,'React官网','https://facebook.github.io/react/',3),(4,'Echarts2','http://echarts.baidu.com/echarts2/doc/example.html',2),(5,'element-ui官网','http://element.eleme.io/#/zh-CN/component/installation',1),(6,'vue-router官网','https://router.vuejs.org/zh-cn/',1),(10,'github官网','https://github.com/',7),(11,'码云-开源中国','https://git.oschina.net/',7),(12,'Vue开源项目查询','https://www.ctolib.com/cheatsheets-vuejs.html',1),(13,'慕课网','http://www.imooc.com/course/list',7),(14,'开放统计-应用概况','http://data.xfyun.cn/appsummary?flag=demo',7),(15,'钉钉开放平台','https://open.dingtalk.com/?spm=a219a.7629140.0.0.jPoFZ8',7),(16,'百度地图JavaScript API','http://lbsyun.baidu.com/index.php?title=jspopular',8),(17,'Mint-ui移动端','https://mint-ui.github.io/#!/zh-cn',1),(18,'Vue相关开源项目库汇总','https://github.com/opendigg/awesome-github-vue',1),(19,'Laravel官网','https://www.codecasts.com/',7),(20,'webpack官网','https://webpack.github.io/docs/',7),(21,'Spring官网','https://spring.io/',7),(22,'老戴-翻墙','https://laod.cn/hosts/2017-google-hosts.html',9),(23,'bootstrap-table官网','http://bootstrap-table.wenzhixin.net.cn/zh-cn/documentation/',7),(24,'w3cschool','http://www.w3school.com.cn/',7),(25,'icon图标网','https://icomoon.io/',7),(26,'nodejs官网','http://nodejs.cn/api/',10),(27,'高德地图','https://lbs.amap.com/',8),(28,'maven环境配置','http://blog.csdn.net/qq_33979657/article/details/52909241',9),(29,'nodejs菜鸟驿站','http://www.runoob.com/nodejs/nodejs-tutorial.html',10),(30,'微信小程序','https://mp.weixin.qq.com/debug/wxadoc/dev/',7),(31,'Vuex中文网','https://vuex.vuejs.org/zh-cn/intro.html',1),(32,'Vux移动端','https://vux.li/#/',1),(33,'react开源项目','http://www.lcode.org/category/react-native-zong/react-native-source-code/',3),(34,'morris','https://morrisjs.github.io/morris.js/',2),(35,'Hightcharts','https://www.hcharts.cn/demo/highcharts/line-basic',2),(36,'阿里云课程','https://yq.aliyun.com/video/TagSearch/cid_0-tagid_17106?spm=5176.100244.0.0.o9UJrK',7),(37,'nowa','https://nowa-webpack.github.io/nowa/?spm=a219a.7629140.0.0.ZxxThJ',9),(38,'Vonic','https://wangdahoo.github.io/vonic-documents/#/',1),(39,'MUI','http://dev.dcloud.net.cn/mui/ui/',1),(40,'vue-impression','https://newdadafe.github.io/impression_vue/#/input-number',1),(41,'专业基础云计算','https://console.ucloud.cn/dashboard',9),(42,'react中文网','http://www.react-cn.com/docs/getting-started.html',3),(43,'react入门教程','https://hulufei.gitbooks.io/react-tutorial/content/introduction.html',3),(44,'Docker','https://www.docker.com/docker-windows#/overview',9),(45,'docker文档','https://docs.docker.com/',9),(46,'react native中文网','http://reactnative.cn/',3),(47,'ES6入门','http://es6.ruanyifeng.com/#docs/function',11),(48,'Promise','https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Promise',11),(49,'Fetch','https://fetch.spec.whatwg.org/',11),(50,'Fetch API','https://developer.mozilla.org/zh-CN/docs/Web/API/Fetch_API',11),(51,'API BluePrint','https://apiblueprint.org/',9),(52,'axios','https://www.npmjs.com/package/axios',11),(53,'zeptojs','http://zeptojs.com/',11),(54,'swagger','https://swagger.io/',9),(55,'nodejs教程','http://www.yiibai.com/nodejs/',10),(56,'react-ui','https://www.ctolib.com/react-ui.html',3),(57,'react-router中文文档','http://www.uprogrammer.cn/react-router-cn/',3),(58,'nodejs文件上传','http://www.yiibai.com/nodejs/nodejs_ch1627.html',10),(59,'NavDrawer组件库','https://myronliu347.github.io/vue-carbon/book/v0.5.0/popups/drawer.html',1),(60,'jade模板引擎','https://segmentfault.com/a/1190000000357534',11),(61,'Express中文文档','https://expressjs.com/zh-cn/starter/installing.html',10),(62,'微信公众号','https://open.weixin.qq.com/cgi-bin/showdocument?action=dir_list&t=resource/res_list&verify=1&id=open1421823488&token=f6abe9625c9789b4b08d5ee74cf1da0b661e7238&lang=zh_CN',7),(63,'存储库管理器','https://help.sonatype.com/display/NXRM3',9),(64,'历史操作','https://developer.mozilla.org/en-US/docs/Web/API/History_API',9),(65,'Koa框架','https://github.com/guo-yu/koa-guide',10),(66,'MongoDB中文文档','http://docs.mongoing.com/manual-zh/index.html',12),(67,'MongoDB学习笔记','http://blog.csdn.net/sinat_25127047/article/details/50560167',12),(68,'node入门','https://www.nodebeginner.org/index-zh-cn.html',10),(69,'mongodb中文社区','http://www.mongoing.com/',12),(70,'kafka入门介绍','http://orchome.com/5',9),(71,'kafka官网','https://kafka.apache.org/quickstart',9),(72,'各种CDN','http://www.codeyyy.com/javascript/8-117-120.html',11),(73,'mongoose官网','http://mongoosejs.com/',12),(74,'node部署阿里云','http://www.jianshu.com/p/0496ef49b2a5',10),(75,'nuxt官网','https://nuxtjs.org/guide/installation',1),(76,'koa2','https://www.npmjs.com/package/koa2',10),(77,'vue服务端渲染','https://ssr.vuejs.org/zh/',1),(78,'koa2学习笔记','https://chenshenhai.github.io/koa2-note/',10),(79,'weex原生','http://weex.apache.org/cn/guide/index.html',1),(80,'管理后台','https://www.ctolib.com/article/wiki/44721',9),(81,'企业信息管理系统','http://stardust.baiytfp.com/auth/login',9),(82,'axios中文文档','https://www.kancloud.cn/yunye/axios/234845',11),(83,'在线课堂-汇智网','http://www.hubwiz.com/class/55c2c01e3ad79a1b05dcc432',9),(84,'lodash中文文档','http://lodashjs.com/docs/',11),(85,'sequelizejs','http://docs.sequelizejs.com/',11),(86,'Mysql数据库建立多对多关系表','http://13145200724.blog.51cto.com/6263780/1370753',12),(87,'站长工具','http://tool.chinaz.com/tools/imgtobase',9),(88,'H5上传图片','http://www.aliyue.net/573.html',13),(89,'H5拍照上传','https://stackoverflow.com/questions/14069421/show-an-image-preview-before-upload',13),(90,'树形-无限递归','http://blog.csdn.net/jayhkw/article/details/68945087',11),(91,'金云龙','https://segmentfault.com/u/jinyunlong',9),(92,'avalonjs','http://avalonjs.coding.me/',11),(93,'zeptojs中文','http://www.css88.com/doc/zeptojs_api/',11),(94,'响应式html5框架','http://www.cnblogs.com/zhicheng/p/4389645.html',9),(95,'h5 input 新特性','http://www.cnblogs.com/polk6/p/5417921.html',13),(96,'vue微信端框架YDUI','http://vue.ydui.org/',1),(97,'kairosdb中文社区','http://www.kairosdb.com/',7),(98,'网易云音乐接口','https://api.imjad.cn/cloudmusic.md',7),(99,' canvas示例','https://segmentfault.com/a/1190000006258726',13),(100,'jquery中文文档','http://jquery.cuishifeng.cn/',11),(101,'kafka-node','https://www.npmjs.com/package/wmf-kafka-node',10),(102,' 尤雨溪-知乎','https://www.zhihu.com/people/evanyou/answers?page=2',9),(103,'腾讯课堂','https://ke.qq.com/',7),(104,'跨域','https://github.com/FatDong1/cross-domain',11),(105,'博客首页','https://www.xuhaodong.cn/home',9),(106,'ES6-babel','https://babeljs.io/learn-es2015/',11),(107,'jquery树形菜单','http://www.jq22.com/jquery-info7449',11),(108,'jquery树形下拉菜单','http://www.jq22.com/yanshi8172',11),(109,'统计数组字符串','http://www.myexception.cn/web/1751543.html',11),(110,'ES6新方法','http://www.css88.com/archives/5710',11),(111,'可拖动弹窗','http://www.cnblogs.com/adventureofraindrop/p/6086298.html',11),(112,'动态添加echarts路径','http://bbs.csdn.net/topics/390886673',2),(113,'vue中使用echarts','http://www.cnblogs.com/jasonwang2y60/p/6517931.html',2),(114,'echarts引入','http://www.myexception.cn/javascript/2026854.html',2),(115,'谷歌翻译','https://translate.google.cn/',7),(116,'百度','https://www.baidu.com/?tn=78040160_5_pg&ch=1',7),(117,'adminTLE','https://adminlte.io/',14),(118,'在jsx里面使用vue','https://telanx.github.io/2017/08/25/Vue%E5%9C%A8JSX%E4%B8%AD%E4%BD%BF%E7%94%A8%E5%85%A8%E5%B1%80%E5%AE%89%E8%A3%85%E7%9A%84%E7%BB%84%E4%BB%B6/',1),(119,'sql菜鸟教程','http://www.runoob.com/sql/sql-tutorial.html',12),(120,'云之讯开放平台','http://docs.ucpaas.com/doku.php?id=home',7),(121,'css定位','http://www.zhangxinxu.com/wordpress/2011/08/css%E7%9B%B8%E5%AF%B9%E5%AE%9A%E4%BD%8Drelative%E7%BB%9D%E5%AF%B9%E5%AE%9A%E4%BD%8Dabsolute%E7%B3%BB%E5%88%97%EF%BC%88%E5%9B%9B%EF%BC%89/',13),(122,'MySQL建立多对多数据表关系','http://13145200724.blog.51cto.com/6263780/1370753',12),(123,'图片压缩网','https://tinypng.com/',7),(124,'vue:keep-alive','http://blog.csdn.net/sinat_17775997/article/details/62231818',1),(125,'element-ui表格单选','http://blog.csdn.net/rickiyeat/article/details/76595343',1),(126,'wegame游戏平台','http://www.wegame.com/client',7),(127,'开发APP','http://ask.dcloud.net.cn/article/237',9);
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
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
-- Dumping routines for database 'tabs'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-13 14:29:00
