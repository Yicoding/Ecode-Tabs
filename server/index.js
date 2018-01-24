let express = require('express');
let cors = require('cors');
let app = express();
app.use(cors())

// 站点查询
let site = require('./site')
app.use(site)
// 前端管理
let test = require('./test')
app.use(test)
// 文本编辑
let edit = require('./edit')
app.use(edit)

let server = app.listen(9000, function () {
 
  let host = server.address().address
  let port = server.address().port
 
  console.log("应用实例，访问地址为 http://%s:%s", host, port)
 
})