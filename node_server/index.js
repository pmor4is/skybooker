const express = require("express");
const cors = require("cors");
const app = express();
const port = require("./config");
const Travel = require("./models/travel");
const connectDatabase = require("./connect-mongo-db");

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({
    extended: true
}));
connectDatabase();

// POST API
app.post("/api/add_travel", async (req, res) => {
    console.log("Result", req.body);
    let data = Travel(req.body);
    try {
        let dataToStore = await data.save();
        res.status(200).json(dataToStore);
    } catch (error) {
        res.status(400).json({
            'status': error.message,
        })
    }
})

// GET API
app.get('/api/get_travel', async (req, res) => {
    try {
        let data = await Travel.find();
        res.status(200).json(data);
    } catch (error) {
        res.status(500).json(error.message)
    }
})

// Método para buscar um objeto específico
app.get('/api/get_travel/:id', async (req, res) => {
    try {
        let data = await Travel.findById(req.params.id);
        res.status(200).json(data);

    } catch (error) {
        res.status(500).json(error.message)
    }
})

// UPDATE API
app.put("/api/update/:id", async (req, res) => {
    let id = req.params.id;
    let updatedData = req.body;
    let options = { new: true };
    try {
        const data = await Travel.findByIdAndUpdate(id, updatedData, options);
        res.send(data);
    } catch (error) {
        res.send(error.message);
    }
})

// DELETE API
app.delete("/api/delete/:id", async (req, res) => {
    let id = req.params.id;
    try {
        const data = await Travel.findByIdAndDelete(id);
        res.json({
            'status': "Deleted the product ${data.productName} from database",
        });
    } catch (error) {
        res.json(error.message);
    }
})

// Inicia o servidor
app.listen(port, () => {
    console.log("listening on port: " + port);
})