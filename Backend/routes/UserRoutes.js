const UserRoutes = require("express").Router();
const UserController = require("../controllers/UserController");

UserRoutes.post("/register", UserController.createUser);
UserRoutes.post("/signin", UserController.signIn);

module.exports= UserRoutes;