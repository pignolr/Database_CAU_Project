module.exports = {
    query: query
}

const mySql = require('mysql')

/**
 * executes the specified sql query and provides a callback which is given
 * with the results in a DataResponseObject
 *
 * @param queryString
 * @param callback - takes a DataResponseObject
 */
async function query(queryString, params){
    let connection;

    try {
        connection = await mySql.createConnection({
            host: 'mysql',
            user: 'user',
            password: 'password',
            database: 'Conseil_voyage'
        })

        await connection.connect()

        connection.config.queryFormat = function (query, values) {
            if (!values) return query;
            return query.replace(/\:(\w+)/g, function (txt, key) {
                if (values.hasOwnProperty(key)) {
                    return this.escape(values[key]);
                }
                return txt;
            }.bind(this));
        };

        return new Promise(function(resolve, reject) {
            connection.query(queryString, params, function(error, results, fields) {
                if (error) {
                    reject(error)
                } else {
                    resolve(results)
                }
            })
        })
    } finally {
        if (connection && connection.end) {
            connection.end();
        }
    }
}
