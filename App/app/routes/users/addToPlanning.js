import { Router } from 'express'

module.exports = Router({mergeParams: true})
    .post('/add-to-planning', async(req, res, next) => {
        next();
    })
