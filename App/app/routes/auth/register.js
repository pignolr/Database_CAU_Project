import { Router } from 'express'

let error_message = null

module.exports = Router({mergeParams: true})
    .get('/auth/register', async(req, res, next) => {
        var username = req.cookies.username;

        res.render('auth/register.ejs',  {
            'username': username,
            'error_message': error_message
        });
        error_message = null
        next();
    })
    .post('/auth/register', async(req, res, next) => {
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
        if (response !== undefined && response.length > 0) {
            error_message = "This username already exist"
            res.redirect('/auth/register');
        } else {
            try {
                let querystring = "INSERT INTO Customer (username) VALUES (:username);" 
                let params = {
                    "username": username
                }
                response = await req.db.query(querystring, params)
            } catch (error) {
                response = undefined
                console.log('throw: ' + error)
            }
            if (response === undefined) {
                error_message = "We can't add this username"
                res.redirect('/auth/register');
            } else {
                res.cookie('username', req.body.username, { maxAge: 900000, httpOnly: true });
                res.redirect('/');    
            }
        }
        next();
    })
