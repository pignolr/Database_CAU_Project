import { Router } from 'express'

module.exports = Router({mergeParams: true})
    .post('/planning/delete/:id_schedule', async(req, res, next) => {
        let id_schedule = req.params.id_schedule;
        let username = req.cookies.username;

        if (username === undefined) {
            res.redirect('auth/login');
            return next();
        }
        let response;
        try {
            let querystring = "DELETE FROM Schedule Where id = :id_schedule and id_client = (select id from Customer where username = :username limit 1);" 
            let params = {
                "username": username,
                "id_schedule": id_schedule
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
        next();
    })
