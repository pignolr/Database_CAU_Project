import { Router } from 'express'

module.exports = Router({mergeParams: true})
    .get('/', async (req, res, next) => {
        res.redirect('/gallery');
        return next();
    })
    .get('/gallery', async(req, res, next) => {
        res.send('<h1>This is the gallery</h1>');
        next();
    })
