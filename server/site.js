var express = require('express')
var router = express.Router()
var mysql = require('mysql')
var bodyParser = require('body-parser')
var pool  = mysql.createPool({
	host: 'localhost',
	user: 'root',
	password: 'root',
	port: '3306',
	database: 'tabs'
})
router.use(bodyParser.json())
router.use(bodyParser.urlencoded({ extended: false }))

// type类型
// type/findAll
router.get('/type/site/findAll', (req, res) => {
	var sql = 'select * from type_site'
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
// type/add
router.post('/type/site/add', (req, res) => {
	var sql = 'insert into type_site values(null, ?)'
	pool.getConnection((err, connection) => {
		connection.query(sql, [req.body.name], (err, data, fields) => {
			if (err) {
				console.log(err)
				res.status(500).send(err)
			} else {
				console.log(data)
				connection.query('select * from type_site where id=' + data.insertId, (err, result, fields) => {
					res.send(result[0])
				})
			}
			connection.release();
		})
	})
})
// type/delete
router.delete('/type/site/:id', (req, res) => {
	pool.getConnection((err, connection) => {
		connection.query('select count(*) as nums from site where type_id=?', [req.params.id], (err, data, fields) => {
			if (err) {
				console.log(err)
				res.status(500).send(err)
			} else {
				console.log(data)
				if (data[0].nums != 0) {
					res.status(500).send('该类型下有数据，不能删除')
				} else {
					connection.query('delete from type_site where id=?', [req.params.id], (error, result) => {
						if (error) {
							console.log(error)
							res.status(500).send(error)
						} else {
							res.send(result)
						}
						connection.release();
					})
				}
			}
		})
	})
})

// site
// site/findAll
router.get('/site/findAll', (req, res) => {
	if (req.query.checkId == 0) {
		pool.getConnection((err, connection) => {
			connection.query('select count(*) as nums from site', (err, data, fields) => {
				if (err) {
					console.log(err)
					res.status(500).send(err)
				} else {
					console.log(data)
					var totalElements = data[0].nums
					var totalPages = Math.ceil(totalElements/req.query.pageSize)
					connection.query('select s.id, s.name, s.site, t.id as type_id, t.name as type_name from site s inner join type_site t on s.type_id=t.id order by ' + req.query.properties + ' ' + req.query.direction + ' limit ' + req.query.pageIndex*req.query.pageSize + ',' + req.query.pageSize, (error, result) => {
						if (error) {
							console.log(error)
							res.status(500).send(error)
						} else {
							var content = []
							for (var k = 0; k < result.length; k ++) {
								var item = result[k]
								content.push({
									id: item.id,
									name: item.name,
									site: item.site,
									type: {
										id: item.type_id,
										name: item.type_name
									}
								})
							}
							res.send({
								totalElements: totalElements,
								totalPages: totalPages,
								content: content
							})
						}
						connection.release();
					})
				}
			})
		})
	} else {
		pool.getConnection((err, connection) => {
			connection.query('select count(*) as nums from site where type_id=?', [req.query.checkId], (err, data, fields) => {
				if (err) {
					console.log(err)
					res.status(500).send(err)
				} else {
					console.log(data)
					var totalElements = data[0].nums
					var totalPages = Math.ceil(totalElements/req.query.pageSize)
					connection.query('select s.id, s.name, s.site, t.id as type_id, t.name as type_name from site s inner join type_site t on s.type_id=t.id where s.type_id=? order by ' + req.query.properties + ' ' + req.query.direction + ' limit ' + req.query.pageIndex*req.query.pageSize + ',' + req.query.pageSize, [req.query.checkId], (error, result) => {
						if (error) {
							console.log(error)
							res.status(500).send(error)
						} else {
							var content = []
							for (var k = 0; k < result.length; k ++) {
								var item = result[k]
								content.push({
									id: item.id,
									name: item.name,
									site: item.site,
									type: {
										id: item.type_id,
										name: item.type_name
									}
								})
							}
							res.send({
								totalElements: totalElements,
								totalPages: totalPages,
								content: content
							})
						}
						connection.release();
					})
				}
			})
		})
	}
})
// site/add
router.post('/site/add', (req, res) => {
	var sql = 'insert into site values(null, ?, ?, ?)'
	pool.getConnection((err, connection) => {
		connection.query(sql, [req.body.name, req.body.site, req.body.type_id], (err, data, fields) => {
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
// site/put
router.put('/site/put', (req, res) => {
	var sql = 'update site set name=?, site=?, type_id=? where id=' + req.body.id
	pool.getConnection((err, connection) => {
		connection.query(sql, [req.body.name, req.body.site, req.body.type_id], (err, data, fields) => {
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
// site/delete
router.delete('/site/delete/:id', (req, res) => {
	var sql = 'delete from site where id=' + req.params.id
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


module.exports = router