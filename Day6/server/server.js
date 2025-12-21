const express = require ("express")
const app = express()
const studentsdata=require("./routes/students") //import

app.use(express.json())
app.use("/students",studentsdata)

app.listen(4000,() => {
    console.log ("server started")
})
