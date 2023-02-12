// Dependencies
const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const WebSocket = require('ws');

require("dotenv").config()
// Env 
const PORT = process.env.PORT;
const MONGO = process.env.MONGO_URI;

const app = express();



app.use(cors())
// Routes
const UserRoutes = require("./routes/UserRoutes");
const OrderRoutes = require("./routes/OrderRoutes");
const DriverRoutes = require("./routes/DriverRoutes");

app.use(express.json());
app.use("/user", UserRoutes);
app.use("/order", OrderRoutes);
app.use("/driver", DriverRoutes);
app.get('/', (req, res)=>{
    res.send("Smart Waste Management API")
})
app.listen(PORT || 8000, ()=>{
    console.log("Smart Waste management API");
    mongoose.connect(MONGO, (e)=> {
        // console.log(e)
        console.log("Mongo DB connected successfully")
    })
});