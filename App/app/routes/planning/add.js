import { Router } from 'express'

module.exports = Router({mergeParams: true})
    .post('/planning/add/:id_monument', async(req, res, next) => {
        let id_monument = req.params.id_monument;
        let username = req.cookies.username;
        let date_from = new Date(req.body.date + ' ' + req.body.time_from);
        let date_to = new Date(req.body.date + ' ' + req.body.time_to);

        if (username === undefined) {
            res.redirect('auth/login');
            return next();
        }
        if (Object.prototype.toString.call(date_from) === "[object Date]"
            && Object.prototype.toString.call(date_to) === "[object Date]"
            && !isNaN(date_from.getTime())
            && !isNaN(date_to.getTime())) {
            let response
            try {
                let querystring = "INSERT INTO Schedule (id_client, id_monument, date_from, date_to) VALUES ((select id from Customer where username = :username limit 1), :id_monument, :date_from, :date_to);" 
                let params = {
                    "username": username,
                    "id_monument": id_monument,
                    "date_from": date_from,
                    "date_to": date_to
                }
                response = await req.db.query(querystring, params)
            } catch (error) {
                response = undefined
                console.log('throw: ' + error)
            }
            if (response === undefined) {
                res.redirect('/monuments/profil/' + id_monument);
            } else {
                res.redirect('/planning');
            }
        }
        next();
    })
