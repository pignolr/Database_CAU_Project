import { Router } from 'express'

let error_message = null

module.exports = Router({mergeParams: true})
    .get('/auth/register', async(req, res, next) => {
        var username = req.cookies.username;

        res.render('auth/register.ejs',  {
            'username': username
        });
        next();
    })
    .post('/auth/register', async(req, res, next) => {
        res.cookie('username', req.body.username, { maxAge: 900000, httpOnly: true });
        res.redirect('/');
        next();
    })
