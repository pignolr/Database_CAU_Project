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
async function query(queryString){
    let connection;
    // let returnValues = {
    //     error: "Not connected",
    //     results: undefined
    // };
    try {
        connection = await mySql.createConnection({
            host: 'localhost',
            user: 'root',
            password: 'password',
            database: 'Conseil_voyage'
        })

        await connection.connect()
        return new Promise(function(resolve, reject) {
            connection.query(queryString, function(error, results, fields) {
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
