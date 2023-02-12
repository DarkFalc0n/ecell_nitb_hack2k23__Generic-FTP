const User = require("../models/User");
const Order = require("../models/Order");
const jwt = require('jsonwebtoken');


exports.createUser = async (req, res) => {
    // jwt
    try {
        const { name, email, phoneNumber, password, lat, long } = req.body;
        const existingUser = await User.find({ email: email });
        console.log(existingUser)
        if (existingUser.length > 0) {
            res.status(401).json({ success: false, message: "User already exists" })
            return;
        }
        const user = new User({
            name: name,
            email: email,
            phoneNumber: phoneNumber,
            password: password,
            lat: lat,
            long: long
        });
        user.save();
        const token = jwt.sign({ id: user._id }, process.env.JWT_SECRET, { expiresIn: "1d" });
        res.status(200).json({ success: true, data: { token, user } });
    } catch (e) {
        console.log(e);
        res.status(500).json({ success: false, message: e });
    }
}

exports.signIn = async (req, res) => {
    const { email, password } = req.body;
    // console.og(us)
    try {
        const user = await User.findOne({ email });
        if (user === null) {
            res.status(400).send({ success: false, message: "User doesn't exist, please register first!" });
            return;
        }
        console.log(user)
        const isPasswordMatch = password === user.password;

        if (!isPasswordMatch) {
            return res.status(400).json({success: false, message: "Password not match"});
        }
        const token = jwt.sign({ userId: user._id }, process.env.JWT_SECRET, { expiresIn: '3d' },);
        res.status(200).json({ success: true, data: { user, token }, message: "Login success" });
    }
    catch (e) {
        console.log(e);
        res.status(500).json({ success: false, message: e });
    }
}
