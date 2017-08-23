var express = require('express')
var router = express.Router()

router.use((req, res, next) => {
	res.setHeader('Access-Control-Allow-Origin', '*')
	next()
})

// 站点查询
var site = require('./site')
router.use(site)

module.exports = router



