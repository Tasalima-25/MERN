const jwt  = require("jsonwebtoken")
const SECRET = require("./config")

function authenticateUser(req,res,next)
{
    if(req.url == "/users/sign-up" || req.url == "/users/sign-in")
   {
     next()
   }
   else
   {
    let token =req.headers.token
    if(!token)
    {
      res.send("token is invalid !")
    }
    try{
    let payload=jwt.verify(token,SECRET)
    req.headers.email=payload.email
    req.headers.uid=payload.uid
    next()
    }catch(ex)
    {
      res.send("Token invalid....")
    }
   }
}
module.exports=authenticateUser