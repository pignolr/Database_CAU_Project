import { Router } from 'express'

let error_message = null

module.exports = Router({mergeParams: true})
    .get('/errors/page-not-found', async(req, res, next) => {
        var username = req.cookies.username;

        res.status(404).render('errors/pageNotFound.ejs',  {
            'username': username
        });
        next();
    })
