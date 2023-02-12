const Schema = require("mongoose").Schema;

const OrderSchema = new Schema({
    user: {
        type: Schema.Types.ObjectId,
        ref: "User"
    },
    // 0: pending, 1: Scheduled, 2: Completed
    status: {
        type: Number,
        default: 0
    },
    lat: {
        type: String,
        required: true
    },

    long: {
        type: String,
        required: true
    },
    type: {
        type: String,
        enum: ["paper", "plastic", "glass", "metal", "organic", "e-waste"],
    },
    scheduledOn: {
        type: Date,
        default: null
    },
    completedOn: {
        type: Date,
        default: null
    },
    driver: {
        type: Schema.Types.ObjectId,
        ref: "Driver",
        default: null
    },
    content: {
        type: Object,
        default: null
    }

});

module.exports = require("mongoose").model("Order", OrderSchema);
