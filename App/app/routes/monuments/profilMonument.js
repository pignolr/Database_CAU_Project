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
        try {
            let querystring = "SELECT * FROM Monument WHERE id = :id"
            let params = { 'id': idMonument }
            response = await req.db.query(querystring, params)
            response = response[0]
        } catch (error) {
            response = undefined
            console.log('throw: ' + error)
        }
        if (response !== undefined) {
            res.render('monuments/profilMonument.ejs', {
                'username': username,
                'monument': {
                    'id': response.id,
                    'name': response.name,
                    'pictures': [
                        'https://www.parisinfo.com/var/otcp/sites/images/media/1.-photos/02.-sites-culturels-630-x-405/tour-eiffel-trocadero-630x405-c-thinkstock/37221-1-fre-FR/Tour-Eiffel-Trocadero-630x405-C-Thinkstock.jpg',
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Tour_Eiffel_Wikimedia_Commons.jpg/324px-Tour_Eiffel_Wikimedia_Commons.jpg',
                        'https://www.toureiffel.paris/themes/custom/tour_eiffel/img/poster-tour-eiffel-jour-nuit.jpg',
                        'https://www.toureiffel.paris/themes/custom/tour_eiffel/img/tour-eiffel-paris.jpg'
                    ],
                    'types': response.type_place,
                    'style': response.style,
                    'description': response.description,
                    'prices': response.prices,
                    'times': response.times,
                    'city': response.city,
                    'address': response.address,
                    'sportLevel': response.sport_level
                }
            });
        } else {
            res.redirect('/errors/page-not-found');
        }
        next();
    })
