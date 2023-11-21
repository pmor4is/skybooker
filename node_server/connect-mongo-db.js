const mongoose = require('mongoose');

const connectDatabase = async () => {
    try {
        mongoose.set('strictQuery', true);
        await mongoose.connect(process.env.MONGODB_URI)
        console.log("Connect to MongoDB successfully")
    } catch (error) {
        console.log("Connect failed " + error.message )
    }
}

module.exports = connectDatabase