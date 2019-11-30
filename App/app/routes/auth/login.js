import { Router } from 'express'

let error_message = null

module.exports = Router({mergeParams: true})
    .get('/auth/login', async(req, res, next) => {
        var username = req.cookies.username;

        res.render('auth/login.ejs',  {
            'username': username,
            'error_message': error_message
        });
        error_message = null
        next();
    })
    .post('/auth/login', async(req, res, next) => {
        let username = req.body.username

        let response
        try {
            let querystring = "SELECT * FROM Customer WHERE username = :username LIMIT 1"
            let params = {
                "username": username
            }
            response = await req.db.query(querystring, params)
        } catch (error) {
            response = undefined
            console.log('throw: ' + error)
        }
        if (response === undefined || !response.length) {
            error_message = "This username doesn't exist"
            res.redirect('/auth/login');
        } else {
            res.cookie('username', username, { maxAge: 900000, httpOnly: true });
            res.redirect('/');    
        }
        next();
    })
