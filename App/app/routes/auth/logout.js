import { Router } from 'express'

module.exports = Router({mergeParams: true})
    .get('/auth/logout', async(req, res, next) => {
        // Destroy cookie
        res.clearCookie('username');
        res.redirect('/');
        next();
    })
    .post('/auth/logout', async(req, res, next) => {
        // Destroy cookie
        res.clearCookie('username');
        res.redirect('/');
        next();
    })
