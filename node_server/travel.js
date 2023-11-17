const mongoose = require('mongoose');

let dataSchema = new mongoose.Schema({
    'travelDestiny': {
        required: true,
        type: String
    },
    'travelDescription': {
        required: true,
        type: String
    },
    'travelPrice': {
        required: true,
        type: String
    },
});

module.exports = mongoose.model("viagens", dataSchema);