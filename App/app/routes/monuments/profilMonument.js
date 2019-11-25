import { Router } from 'express'

module.exports = Router({mergeParams: true})
    .get('/monuments/profil', async(req, res, next) => {
        res.redirect('/errors/page-not-found');
        return next();
    })
    .get('/monuments/profil/:id', async(req, res, next) => {
        var idMonument = req.params.id;
        var username = req.cookies.username;

        res.render('monuments/profilMonument.ejs', {
            'username': username,
            'monument': {
                'id': idMonument,
                'name': 'tour eiffel',
                'pictures': [
                    'https://www.parisinfo.com/var/otcp/sites/images/media/1.-photos/02.-sites-culturels-630-x-405/tour-eiffel-trocadero-630x405-c-thinkstock/37221-1-fre-FR/Tour-Eiffel-Trocadero-630x405-C-Thinkstock.jpg',
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Tour_Eiffel_Wikimedia_Commons.jpg/324px-Tour_Eiffel_Wikimedia_Commons.jpg',
                    'https://www.toureiffel.paris/themes/custom/tour_eiffel/img/poster-tour-eiffel-jour-nuit.jpg',
                    'https://www.toureiffel.paris/themes/custom/tour_eiffel/img/tour-eiffel-paris.jpg'
                ],
                'description': 'La tour Eiffel est une tour de fer puddlé de 324 mètres de hauteur (avec antennes) située à Paris, à l’extrémité nord-ouest du parc du Champ-de-Mars en bordure de la Seine dans le 7e arrondissement.',
                'address': 'Champ de Mars, 5 Avenue Anatole France, 75007 Paris, France'
            }
        });
        next();
    })
