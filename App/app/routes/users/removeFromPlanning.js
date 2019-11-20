import { Router } from 'express'

module.exports = Router({mergeParams: true})
    .post('/remove-from-planning', async(req, res, next) => {
        next();
    })
