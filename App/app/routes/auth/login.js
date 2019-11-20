import { Router } from 'express'

module.exports = Router({mergeParams: true})
    .get('/login', async(req, res, next) => {
        res.render('auth/login.ejs');
        next();
    })
    .post('/login', async(req, res, next) => {
        res.cookie('username', req.body.username, { maxAge: 900000, httpOnly: true });
        res.redirect('/');
        next();
    })
