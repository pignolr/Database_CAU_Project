import { Router } from 'express'

module.exports = Router({mergeParams: true})
    .get('/users', async(req, res, next) => {
        res.redirect('users/planning');
        next();
    })
    .get('/users/planning', async(req, res, next) => {
        var username = req.cookies.username;
        if (username === undefined) {
            res.redirect("/auth/login")
            return next();
        }

        res.render('users/planning.ejs',  {
            'username': username
        });
        return next();
    })
