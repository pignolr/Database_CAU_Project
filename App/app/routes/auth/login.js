import { Router } from 'express'

module.exports = Router({mergeParams: true})
    .get('/auth/login', async(req, res, next) => {
        var username = req.cookies.username;

        res.render('auth/login.ejs',  {
            'username': username
        });
        next();
    })
    .post('/auth/login', async(req, res, next) => {
        res.cookie('username', req.body.username, { maxAge: 900000, httpOnly: true });
        res.redirect('/');
        next();
    })
