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

        let response
        try {
            response = await req.db.query("SELECT * FROM Monument")
        } catch (error) {
            response = undefined
            console.log('throw: ' + error)
        }
        if (response !== undefined) {
            let results = response

            if (results.length != 0) {
                maxPage = Math.ceil(results.length / nbElemByPage)
                if (page < 1) {
                    page = 1
                } else if (page > maxPage) {
                    page = maxPage
                }
    
                for (let i = (page - 1) * nbElemByPage; i < results.length && i < page * nbElemByPage; ++i) {
                    monuments.push({
                        'profil': '/monuments/profil/' + results[i].id,
                        'name': results[i].name,
                        'description': results[i].description.length <= 300 ? results[i].description : results[i].description.substring(0, 300) + '...',
                        'address': results[i].address,
                        'picture': results[i].pictures[0],
                        'price': results[i].price
                    })
                }
            }
        }

        let newPageUrl = '/monuments/gallery?' + (search === undefined ? '' : 'search=' + search) + '&page=';
        res.render('monuments/gallery.ejs',  {
            'username': username,
            'monuments': monuments,
            'newPageUrl': newPageUrl,
            'maxPage': maxPage,
            'currentPage': page
        });

        next();    
    })
