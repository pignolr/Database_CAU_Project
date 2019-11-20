import express from 'express'
import cookieParser from 'cookie-parser'
import { urlencoded, json } from 'body-parser'
import { logger as _logger } from 'express-winston'
const router = require('./routes/createRouter.js')()

module.exports = ({ database, logger }) => express()
    .use(_logger({
        winstonInstance: logger,
        msg: '{{res.statusCode}} {{req.method}} {{req.url}} {{res.responseTime}}ms',
        meta: false,
    }))
    .use(urlencoded({ extended: true }))
    .use(json())
    .set('view engine', 'ejs')
    .use((req, res, next) => {
        req.base = `${req.protocol}://${req.get('host')}`
        req.logger = logger
        req.db = database
        return next()
    })

    .use(express.static('./public'))
    .use(cookieParser())
    .use('/', router)
    .use((error, req, res, next) => {
        logger.error(error, error)
        res.status(error.status || 500).json({ error })
    })
