const Driver = require("../models/Driver");

exports.createDriver = async (req, res) => {
    try {
        const driver = await Driver.create(req.body);
        res.status(201).json({
            success: true,
            data: 
                driver
            
        });
    } catch (err) {
        res.status(400).json({
            success: false,
            message: err
        });
    }
}

exports.getDrivers = async (req, res) => {
    try {
        const drivers = await Driver.find();
        res.status(200).json({
            success: true,
            data: drivers
        });
    } catch (err) {
        res.status(400).json({
            success: false,
            message: err
        });
    }
}

exports.UpdateDriver = async (req, res) => {
    try {
        const { id, lat, long } = req.body;
        var driver = await Driver.findById(id);
        if (!driver) {
            res.status(400).json({
                success: false,
                message: "Driver not found"
            });
        }
        
        driver = await Driver.findByIdAndUpdate(id, {lat, long});
        res.status(200).json({
            success: true,
            data: {...driver._doc, lat, long}
        });
    } catch (error) {
        res.status(400).json({
            success: false,
            message: err
        });
    }
}