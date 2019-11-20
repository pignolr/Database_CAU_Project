import { Router } from 'express'

let error_message = null

module.exports = Router({mergeParams: true})
    .get('/register', async(req, res, next) => {
        res.render('auth/register.ejs', { message: error_message });
        next();
    })
    .post('/register', async(req, res, next) => {
        res.cookie('username', req.body.username, { maxAge: 900000, httpOnly: true });
        res.redirect('/');
        next();
    })
