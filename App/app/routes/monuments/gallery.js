import { Router } from 'express'

module.exports = Router({mergeParams: true})
    .get('/', async (req, res, next) => {
        res.redirect('/monuments/gallery');
        return next();
    })
    .get('/monuments', async(req, res, next) => {
        res.redirect('/monuments/gallery');
        return next();
    })
    .get('/monuments/gallery', async(req, res, next) => {
        let username = req.cookies.username;
        let page = req.query.page || 1
        let maxPage = 1
        const nbElemByPage = 2
        let search = req.query.search

        let monuments = []
        let getMonuments = [
            {
                'id': 0,
                'name': 'Tour Eiffel',
                'pictures': [
                    'https://www.parisinfo.com/var/otcp/sites/images/media/1.-photos/02.-sites-culturels-630-x-405/tour-eiffel-trocadero-630x405-c-thinkstock/37221-1-fre-FR/Tour-Eiffel-Trocadero-630x405-C-Thinkstock.jpg',
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Tour_Eiffel_Wikimedia_Commons.jpg/324px-Tour_Eiffel_Wikimedia_Commons.jpg',
                    'https://www.toureiffel.paris/themes/custom/tour_eiffel/img/poster-tour-eiffel-jour-nuit.jpg',
                    'https://www.toureiffel.paris/themes/custom/tour_eiffel/img/tour-eiffel-paris.jpg'
                ],
                'description': 'La tour Eiffel est une tour de fer puddlé de 324 mètres de hauteur (avec antennes) située à Paris, à l’extrémité nord-ouest du parc du Champ-de-Mars en bordure de la Seine dans le 7e arrondissement.',
                'address': 'Champ de Mars, 5 Avenue Anatole France, 75007 Paris, France',
                'price': '5.00€'
            },
            {
                'id': 1,
                'name': 'Test',
                'description': 'description exaustif du test de ses morts',
                'address': '2 boulevard du tests, PARIS, FRANCE',
                'pictures': [ 'https://image.shutterstock.com/image-photo/bright-spring-view-cameo-island-260nw-1048185397.jpg',
                    'https://img.lemde.fr/2019/04/22/0/191/1619/1079/688/0/60/0/e39da8d_2FIads9h8wB-0SwSgxVaVWsp.jpg'],
                'price': '12.00€'
            },
            {
                'id': 2,
                'name': 'Tour Eiffel',
                'pictures': [
                    'https://www.parisinfo.com/var/otcp/sites/images/media/1.-photos/02.-sites-culturels-630-x-405/tour-eiffel-trocadero-630x405-c-thinkstock/37221-1-fre-FR/Tour-Eiffel-Trocadero-630x405-C-Thinkstock.jpg',
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Tour_Eiffel_Wikimedia_Commons.jpg/324px-Tour_Eiffel_Wikimedia_Commons.jpg',
                    'https://www.toureiffel.paris/themes/custom/tour_eiffel/img/poster-tour-eiffel-jour-nuit.jpg',
                    'https://www.toureiffel.paris/themes/custom/tour_eiffel/img/tour-eiffel-paris.jpg'
                ],
                'description': 'La tour Eiffel est une tour de fer puddlé de 324 mètres de hauteur (avec antennes) située à Paris, à l’extrémité nord-ouest du parc du Champ-de-Mars en bordure de la Seine dans le 7e arrondissement.',
                'address': 'Champ de Mars, 5 Avenue Anatole France, 75007 Paris, France',
                'price': '5.00€'
            },
            {
                'id': 3,
                'name': 'Test',
                'description': 'description exaustif du test de ses morts',
                'address': '2 boulevard du tests, PARIS, FRANCE',
                'pictures': [ 'https://image.shutterstock.com/image-photo/bright-spring-view-cameo-island-260nw-1048185397.jpg',
                    'https://img.lemde.fr/2019/04/22/0/191/1619/1079/688/0/60/0/e39da8d_2FIads9h8wB-0SwSgxVaVWsp.jpg'],
                'price': '12.00€'
            },
            {
                'id': 4,
                'name': 'Tour Eiffel',
                'pictures': [
                    'https://www.parisinfo.com/var/otcp/sites/images/media/1.-photos/02.-sites-culturels-630-x-405/tour-eiffel-trocadero-630x405-c-thinkstock/37221-1-fre-FR/Tour-Eiffel-Trocadero-630x405-C-Thinkstock.jpg',
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Tour_Eiffel_Wikimedia_Commons.jpg/324px-Tour_Eiffel_Wikimedia_Commons.jpg',
                    'https://www.toureiffel.paris/themes/custom/tour_eiffel/img/poster-tour-eiffel-jour-nuit.jpg',
                    'https://www.toureiffel.paris/themes/custom/tour_eiffel/img/tour-eiffel-paris.jpg'
                ],
                'description': 'La tour Eiffel est une tour de fer puddlé de 324 mètres de hauteur (avec antennes) située à Paris, à l’extrémité nord-ouest du parc du Champ-de-Mars en bordure de la Seine dans le 7e arrondissement.',
                'address': 'Champ de Mars, 5 Avenue Anatole France, 75007 Paris, France',
                'price': '5.00€'
            },
            {
                'id': 5,
                'name': 'Test',
                'description': 'description exaustif du test de ses morts',
                'address': '2 boulevard du tests, PARIS, FRANCE',
                'pictures': [ 'https://image.shutterstock.com/image-photo/bright-spring-view-cameo-island-260nw-1048185397.jpg',
                    'https://img.lemde.fr/2019/04/22/0/191/1619/1079/688/0/60/0/e39da8d_2FIads9h8wB-0SwSgxVaVWsp.jpg'],
                'price': '12.00€'
            },
            
        ]

        maxPage = Math.ceil(getMonuments.length / nbElemByPage)
        if (page < 1) {
            page = 1
        } else if (page > maxPage) {
            page = maxPage
        }

        for (let i = (page - 1) * nbElemByPage; i < getMonuments.length && i < page * nbElemByPage; ++i) {
            monuments.push({
                'profil': '/monuments/profil/' + getMonuments[i].id,
                'name': getMonuments[i].name,
                'description': getMonuments[i].description.length <= 300 ? getMonuments[i].description : getMonuments[i].description.substring(0, 300) + '...',
                'address': getMonuments[i].address,
                'picture': getMonuments[i].pictures[0],
                'price': getMonuments[i].price
            })
        }

        let newPageUrl = '/monuments/gallery?' + (search === undefined ? '' : 'search=' + search) + '&page=';
        res.render('monuments/gallery.ejs',  {
            'username': username,
            'monuments': monuments,
            'newPageUrl': newPageUrl,
            'maxPage': maxPage,
            'currentPage': page
        });

        return next();
    })
