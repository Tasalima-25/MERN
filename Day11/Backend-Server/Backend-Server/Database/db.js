const mysql2 = require("mysql2")
const pool = mysql2.createPool({
    host:"localhost",
    user:"root",
    password:"manager",
    database:"user_test"
})

module.exports = pool