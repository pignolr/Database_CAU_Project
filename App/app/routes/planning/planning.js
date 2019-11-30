import { Router } from 'express'

module.exports = Router({mergeParams: true})
    .get('/planning', async(req, res, next) => {
        var username = req.cookies.username;
        if (username === undefined) {
            res.redirect("/auth/login")
            return next();
        }

        res.render('planning/planning.ejs',  {
            'username': username
        });
        return next();
    })
