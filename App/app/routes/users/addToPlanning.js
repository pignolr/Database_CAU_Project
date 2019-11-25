import { Router } from 'express'

module.exports = Router({mergeParams: true})
    .post('/users/add-to-planning', async(req, res, next) => {
        next();
    })
