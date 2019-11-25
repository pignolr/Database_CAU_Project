import { Router } from 'express'

module.exports = Router({mergeParams: true})
    .post('/users/remove-from-planning', async(req, res, next) => {
        next();
    })
