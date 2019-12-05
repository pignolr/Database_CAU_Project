import { Router } from 'express'

module.exports = Router({mergeParams: true})
    .get('/monuments/profil', async(req, res, next) => {
        res.redirect('/errors/page-not-found');
        next();
    })
    .get('/monuments/profil/:id', async(req, res, next) => {
        var idMonument = req.params.id;
        var username = req.cookies.username;

        let response
        let images
        let access
        let affluence
        try {
            let querystring = "SELECT * FROM Monument WHERE id = :id"
            let params = { 'id': idMonument }
            response = await req.db.query(querystring, params)
            response = response[0]
        } catch (error) {
            response = undefined
            console.log('throw: ' + error)
        }

        try {
            let querystring = "SELECT url_image FROM Image WHERE id_monument = :id"
            let params = { 'id': idMonument }
            images = await req.db.query(querystring, params)
            if (images === undefined) {
                images = []
            }
        } catch (error) {
            images = []
            console.log('throw: ' + error)
        }

        try {
            let querystring = "SELECT * FROM Access WHERE id_monument = :id"
            let params = { 'id': idMonument }
            access = await req.db.query(querystring, params)
            if (access === undefined) {
                access = []
            }
        } catch (error) {
            access = []
            console.log('throw: ' + error)
        }

        try {
            let querystring = "SELECT * FROM Affluence WHERE id_monument = :id"
            let params = { 'id': idMonument }
            affluence = await req.db.query(querystring, params)
            if (affluence === undefined) {
                affluence = []
            }
        } catch (error) {
            affluence = []
            console.log('throw: ' + error)
        }

        if (response !== undefined) {
            res.render('monuments/profil.ejs', {
                'username': username,
                'monument': {
                    'id': response.id,
                    'name': response.name,
                    'pictures': images,
                    'types': response.type_place,
                    'style': response.style,
                    'description': response.description,
                    'prices': response.prices,
                    'times': response.times,
                    'city': response.city,
                    'address': response.address,
                    'sportLevel': response.sport_level,
                    'access': access,
                    'affluence': affluence
                }
            });
        } else {
            res.redirect('/errors/page-not-found');
        }
        next();
    })
