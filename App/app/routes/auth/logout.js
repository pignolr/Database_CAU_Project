import { Router } from 'express'

module.exports = Router({mergeParams: true})
    .get('/logout', async(req, res, next) => {
        // Destroy cookie
        res.clearCookie('username');
        res.redirect('/');
        next();
    })
    .post('/logout', async(req, res, next) => {
        // Destroy cookie
        res.clearCookie('username');
        res.redirect('/');
        next();
    })
