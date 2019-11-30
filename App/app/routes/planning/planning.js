import { Router } from 'express'
import moment from 'moment'

module.exports = Router({mergeParams: true})
    .get('/planning', async(req, res, next) => {
        let username = req.cookies.username;
        if (username === undefined) {
            res.redirect("/auth/login")
            return next();
        }
        let week = +req.query.week | 0;

        let responseSchedule = [];
        let schedule = [];
        let response;
        let startOfWeek = moment().startOf('isoweek').subtract(1, 'days').add(week, 'weeks');
        let days = []
        try {
            let querystring = "SELECT Schedule.*, Monument.name FROM Schedule JOIN Monument ON Monument.id = Schedule.id_monument WHERE id_client = (SELECT id FROM Customer WHERE username = :username Limit 1) and DATE(date_from) = DATE(:date) ORDER BY date_from;"
            for (let day = 0; day < 7; day++) {
                let params = {
                    "username": username,
                    "date": startOfWeek.add(1, 'days').format('YYYY-MM-DD'),
                }
                days.push(startOfWeek.format('ddd, MM-DD'));
                response = await req.db.query(querystring, params)    
                responseSchedule.push(response)
            }
        } catch (error) {
            responseSchedule = undefined
            console.log('throw: ' + error)
        }

        if (responseSchedule !== undefined) {
            for (let day = 0; day < responseSchedule.length; day++) {
                schedule.push([]);
                for (let hour = 0; hour < 24; hour++) {
                    schedule[day].push([]);
                    schedule[day][hour][0] = null;
                    schedule[day][hour][1] = null;
                }
                for (let i = 0; i < responseSchedule[day].length; i++) {
                    let date_from = moment(responseSchedule[day][i].date_from)
                    let date_to = moment(responseSchedule[day][i].date_to)
                    var duration = moment.duration(date_to.diff(date_from));
                    var size_cell = duration.asMinutes() / 30;
                    let hour = parseInt(date_from.format('HH'), 10);
                    let minute = parseInt(date_from.format('mm'), 10);
                    schedule[day][hour][minute === 0 ? 0 : 1] = {
                        "name": responseSchedule[day][i].name,
                        "size": size_cell,
                        "id_schedule": responseSchedule[day][i].id,
                        "id_monument": responseSchedule[day][i].id_monument
                    }
                }
            }
        }

        res.render('planning/planning.ejs',  {
            'username': username,
            'week': week,
            'days': days,
            'schedule': schedule
        });
        return next();
    })
