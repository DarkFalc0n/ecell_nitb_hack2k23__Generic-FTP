const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const DriverSchema = new Schema({
    name: {
        type: String,
        required: true
    },
    email: {
        type: String,
        required: true
    },
    phoneNumber: {
        type:Number,
        required: true
    },
    password: {
        type: String,
        required: true
    },
    licenseNumber: {
        type: String,
        required: true
    },
    driverId: {
        type: String,
        required: true
    },
    vehicleNumber: {
        type: String,
        required: true
    },
    lat: {
        type: String,
        required: true
    },
    long: {
        type: String,
        required: true
    },
});
module.exports = mongoose.model("Driver", DriverSchema);
