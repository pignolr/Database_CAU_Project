import { Router } from 'express'

module.exports = Router({mergeParams: true})
    .get('/users', async(req, res, next) => {
        res.redirect('users/planning');
        next();
    })
    .get('/users/planning', async(req, res, next) => {
        var username = req.cookies.username;

        res.render('users/planning.ejs',  {
            'username': username
        });
        next();
    })
