var router = require('./router.js')
var pool = require('./pool.js')

// type类型
// /test/findAll
router.get('/test/findAll', (req, res) => {
	var sql = 'select * from type_test'
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
// test/add
router.post('/test/add', (req, res) => {
	var sql = 'insert into type_test values(null, ?)'
	pool.getConnection((err, connection) => {
		connection.query(sql, [req.body.name], (err, data, fields) => {
			if (err) {
				console.log(err)
				res.status(500).send(err)
			} else {
				console.log(data)
				connection.query('select * from type_test where id=' + data.insertId, (err, result, fields) => {
					res.send(result[0])
				})
			}
			connection.release();
		})
	})
})
// test/put
router.put('/test/put', (req, res) => {
	var sql = 'update type_test set name=? where id=' + req.body.id
	pool.getConnection((err, connection) => {
		connection.query(sql, [req.body.name], (err, data, fields) => {
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
// test/delete
router.delete('/test/remove/:id', (req, res) => {
	pool.getConnection((err, connection) => {
		connection.query('delete from type_test where id=?', [req.params.id], (error, result) => {
			if (error) {
				console.log(error)
				res.status(500).send(error)
			} else {
				res.send(result)
			}
			connection.release();
		})
	})
})

// testdetail
// testdetail/findAll
router.get('/testdetail/findAll/:id', (req, res) => {
	var sql = 'select * from test where test_id=?'
	pool.getConnection((err, connection) => {
		connection.query(sql, [req.params.id], (err, data, fields) => {
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
// testdetail/add
router.post('/testdetail/add', (req, res) => {
	var sql = 'insert into test values(null, ?, ? ,?)'
	pool.getConnection((err, connection) => {
		connection.query(sql, [req.body.title, req.body.content, req.body.test_id], (err, data, fields) => {
			if (err) {
				console.log(err)
				res.status(500).send(err)
			} else {
				console.log(data)
				connection.query('select * from type_test where id=' + data.insertId, (err, result, fields) => {
					res.send(result[0])
				})
			}
			connection.release();
		})
	})
})
// /testdetail/put
router.put('/testdetail/put', (req, res) => {
	var sql = 'update test set title=?, content=?, test_id=? where id=' + req.body.id
	pool.getConnection((err, connection) => {
		connection.query(sql, [req.body.title, req.body.content, req.body.test_id], (err, data, fields) => {
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
// /testdetail/remove
router.delete('/testdetail/remove/:id', (req, res) => {
	pool.getConnection((err, connection) => {
		connection.query('delete from test where id=?', [req.params.id], (error, result) => {
			if (error) {
				console.log(error)
				res.status(500).send(error)
			} else {
				res.send(result)
			}
			connection.release();
		})
	})
})
module.exports = router