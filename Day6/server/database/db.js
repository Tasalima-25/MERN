const mysql=require("mysql2")

const pool=mysql.createPool({
    host:"localhost",
    user:"root",
    password:"manager",
    database:"api_test"
})

module.exports=pool
