import { Router } from 'express'

module.exports = Router({mergeParams: true})
    .get('/profil-monument', async(req, res, next) => {
        res.render('monuments/profilMonument.ejs');
        next();
    })
