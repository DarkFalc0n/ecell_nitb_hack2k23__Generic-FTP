const User = require("../models/User");
const Order = require("../models/Order");
const jwt = require('jsonwebtoken');
const Driver = require("../models/Driver");
const WebSocket = require('ws');
var server = null;
try {
 server = new WebSocket("wss://demo.piesocket.com/v3/channel_1230?api_key=VCXCEuvhGcBDP7XhiJJUDvR1e1D3eiVjgZ9VRiaV&notify_self");
} catch(e){
    console.log(e);
}

exports.placeOrder = async (req, res) => {
    // jwt
    try {
        const { userId,lat, long, type } = req.body;
        const user = await User.findOne({ _id: userId });
        console.log(userId, user)
        if (user === null) {
            res.status(400).send({ success: false, message: "User doesn't exist, please register first!" });
            return;
        }
        const order = new Order({
            user: userId,
            lat: lat,
            long: long,
            type: type
        });
        order.save();
        const drivers = await Driver.find({});
        console.log(drivers)
        for(let i=0; i<drivers.length; i++){

            server.send("newpickup:"+drivers[i]._id+":"+order._id);
        }
        res.status(200).json({ success: true, data: order });
    } catch (e) {
        res.status(500).json({ success: false, message: e });
    }
}

exports.trackOrder = async (req, res) => {
    try {
        const { id } = req.body;
        const order = await Order.findOne({ _id: id });
        if(order==null){
            res.status(400).json({ success: false, message: "Order not found" });
            return;
        }
        res.status(200).json({ success: true, data: order });
    } catch (error) {
        res.status(500).json({ success: false, message: e });
    }
}

exports.getOrders = async (req, res) => {
    try {
        const ordersall = await Order.find();
        res.status(200).json({ success: true, data: ordersall });
    } catch (error) {
        res.status(500).json({ success: false, message: e });
    }
}
//accept order
exports.updateOrder = async (req, res) => {
    try {
        const { id } = req.query;
        const order = await Order.findOne({ _id: id });
        if(order==null){
            res.status(400).json({ success: false, message: "Order not found" });
            return;
        }
        order.status = req.body.status;
        order.driver = req.body.driver;
        // order.content = req.body.content;
        order.save();
        res.status(200).json({ success: true, data: order });
    } catch (error) {
        res.status(500).json({ success: false, message: e });
    }
}

exports.getOrdersByUser = async (req, res) => {
    try {
        const { id } = req.body;
        const Orders = await Order.find({ user: id });
        res.status(200).json({ success: true, data: Orders });
    } catch (error) {
        res.status(500).json({ success: false, message: e });
    }
}
exports.getOrderByStatus = async (req, res) => {
    try {
        const { status } = req.query;
        console.log(status)
        const orders = await Order.find({status});
        res.status(200).json({success: true, data: orders});
    }
    catch (e) {
        res.status(500).json({ success: false, message: e });
    }
}

exports.getOrdersByDriver = async (req, res) => {
    try {
        const { id } = req.body;
        const ScheduledOrders = await Order.find({ driver: id, status: 1 });
        const CompletedOrders = await Order.find({ driver: id, status: 2 });
        res.status(200).json({ success: true, data: {
            ScheduledOrders,
            CompletedOrders
        } });
    } catch (error) {
        res.status(500).json({ success: false, message: e });
    }
},
exports.getOrderById = async (req, res) => {
    try {
        const { id } = req.body;
        const order = await Order.findById(id);
        console.log(id)
        if(order==null){
            res.status(400).json({ success: false, message: "Order not found" });
            return;
        }
        res.status(200).json({ success: true, data: order });
    } catch (error) {
        res.status(500).json({ success: false, message: e });
    }
}
exports.updateContent = async (req, res) => {
    try {
        const {id, content} = req.body;
        const order = await Order.findById(id);
        if(order==null){
            res.status(400).json({ success: false, message: "Order not found" });
            return;
        }
        order.content = content;
        order.save();
        res.status(200).json({ success: true, data: order });
    }
    catch (e) {
        res.status(500).json({ success: false, message: e });
    }
}