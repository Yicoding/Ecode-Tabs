// var express = require('express')
// var router = express.Router()

// router.use((req, res, next) => {
// 	res.setHeader('Access-Control-Allow-Origin', '*')
// 	next()
// })

// // 站点查询
// var site = require('./site')
// router.use(site)

// module.exports = router



var express = require('express');
var cors = require('cors');
var app = express();
app.use(cors())

// 站点查询
var site = require('./site')
app.use(site)
 
var server = app.listen(3000, function () {
 
  var host = server.address().address
  var port = server.address().port
 
  console.log("应用实例，访问地址为 http://%s:%s", host, port)
 
})