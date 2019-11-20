import { Router } from 'express'

module.exports = Router({mergeParams: true})
    .get('/planning', async(req, res, next) => {
        res.render('users/planning.ejs');
        next();
    })
