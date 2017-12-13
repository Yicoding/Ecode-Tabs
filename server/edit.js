var router = require('./router.js')
var pool = require('./pool.js')
var fs = require("fs");

var multipart = require('connect-multiparty')
var multipartMiddleware = multipart()

// type类型
// /edit/findAll
router.get('/edit/findAll', (req, res) => {
	var sql = 'select * from edit'
	pool.getConnection((err, connection) => {
		connection.query(sql, (err, data, fields) => {
			if (err) {
				console.log(err)
				res.status(500).send(err)
			} else {
				console.log(data)
				res.send(data)
			}
			connection.release();
		})
	})
})
// edit/add
router.post('/edit/add', (req, res) => {
	var sql = 'insert into edit values(null, ?)'
	pool.getConnection((err, connection) => {
		connection.query(sql, [req.body.name], (err, data, fields) => {
			if (err) {
				console.log(err)
				res.status(500).send(err)
			} else {
				console.log(data)
				connection.query('insert into editcontent values(null, null, ?)', [data.insertId], (err, body) => {
					if (err) {
						console.log(err)
						res.status(500).send(err)
					} else {
						console.log(body)
						res.send(body)
						
					}
					connection.release();
				})
			}
		})
	})
})
// edit/put
router.put('/edit/put', (req, res) => {
	var sql = 'update edit set name=? where id=?'
	pool.getConnection((err, connection) => {
		connection.query(sql, [req.body.name, req.body.id], (err, data, fields) => {
			if (err) {
				console.log(err)
				res.status(500).send(err)
			} else {
				console.log(data)
				res.send(data)
			}
			connection.release();
		})
	})
})
// edit/delete
router.delete('/edit/remove/:id', (req, res) => {
	pool.getConnection((err, connection) => {
		connection.query('delete from edit where id=?', [req.params.id], (error, result) => {
			if (error) {
				console.log(error)
				res.status(500).send(error)
			} else {
				// res.send(result)
				connection.query('delete from editcontent where edit_id=?', [req.params.id], (error, result) => {
					if (error) {
						console.log(error)
						res.status(500).send(error)
					} else {
						res.send(result)
					}
					connection.release();
				})
			}
		})
	})
})

// editcontent
// editcontent/find
router.get('/editcontent/find/:id', (req, res) => {
	var sql = 'select * from editcontent where edit_id=?'
	pool.getConnection((err, connection) => {
		connection.query(sql, [req.params.id], (err, data, fields) => {
			if (err) {
				console.log(err)
				res.status(500).send(err)
			} else {
				console.log(data)
				res.send(data[0])
			}
			connection.release();
		})
	})
})
// /editcontent/put
router.put('/editcontent/put', (req, res) => {
	var sql = 'update editcontent set content=? where edit_id=?'
	pool.getConnection((err, connection) => {
		connection.query(sql, [req.body.content, req.body.edit_id], (err, data) => {
			if (err) {
				console.log(err)
				res.status(500).send(err)
			} else {
				console.log(data)
				res.send(data)
			}
			connection.release();
		})
	})
})
// 文本编辑器上传图片
router.post('/edit/img/upload', multipartMiddleware, function (req, res) {
  let nowDate = new Date();
  console.log(req.files.file);  // 上传的文件信息

  var des_file = "../static/img/" + nowDate.getTime() + req.files.file.originalFilename;
  fs.readFile( req.files.file.path, function (err, data) {
    fs.writeFile(des_file, data, function (err) {
      if( err ){
        console.log( err );
      } else {
        response = {
          message:'File uploaded successfully', 
          filename:nowDate.getTime() + req.files.file.originalFilename
        };
      }
      console.log( response.filename );
      res.status(200).send({filename: response.filename});
    });
  });
})

module.exports = router