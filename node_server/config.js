const dotenv = require('dotenv');
dotenv.config();
const {
    PORT,
    mongoURL
} = process.env;
module.exports = {
    port: PORT,
    urlConnection: mongoURL
}