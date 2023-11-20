const dotenv = require('dotenv');
dotenv.config();
const {
    PORT,
    MONGODB_URI
} = process.env;
module.exports = {
    port: PORT,
    MONGODB_URI: MONGODB_URI
}