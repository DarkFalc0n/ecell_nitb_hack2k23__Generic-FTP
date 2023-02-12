const OrderRoutes = require("express").Router();
const OrderController = require("../controllers/orderController")

OrderRoutes.post("/getallorders", OrderController.getOrders);
OrderRoutes.post("/getordersbyuser",OrderController.getOrdersByUser);
OrderRoutes.post("/createorder", OrderController.placeOrder);
OrderRoutes.post("/trackorder", OrderController.trackOrder);
OrderRoutes.post("/update",OrderController.updateOrder);
OrderRoutes.get("/getOrderByStatus", OrderController.getOrderByStatus);
OrderRoutes.get("/getOrdersByDriver", OrderController.getOrdersByDriver);
OrderRoutes.post("/getOrderById", OrderController.getOrderById);
OrderRoutes.post("/updateContent", OrderController.updateContent);

module.exports= OrderRoutes;