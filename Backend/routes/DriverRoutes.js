const DriverRoutes = require("express").Router();

const DriverController = require("../controllers/DriverController");

DriverRoutes.post("/create", DriverController.createDriver);
DriverRoutes.get("/get", DriverController.getDrivers);
DriverRoutes.post("/update", DriverController.UpdateDriver);

module.exports = DriverRoutes;