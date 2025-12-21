const express = require ("express")
const router= express.Router()
const pool=require ("../database/db")

router.get("/",(request,response) => {
    let sql="select * from students"
    pool.query(sql,(error,data) => {
        response.send(data)
    })    
})

router.post("/",(request,response) => {
    let {name,email,course}  = request.body
    let sql="insert into students values (?,?,?)"
    pool.query(sql,[name,email,course] ,(error,data)=> {
        response.send(data)
    })
})

router.put("/",(request,response) => {
    let {name,email}  = request.body
    let sql="update students set email = ? where name = ?"
    pool.query(sql,[email,name] ,(error,data)=> {
        response.send(data)
    }) 
})

router.delete("/",(request,response)=> {
     let {email}  = request.body
    let sql="delete from students where email=?"
    pool.query(sql,[email] ,(error,data)=> {
        response.send(data)
    }) 
})

module.exports=router