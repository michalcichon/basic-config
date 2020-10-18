const Config = require("../models/config.model.js");

// Create and Save a new Config
exports.create = (req, res) => {
    // Validate request
    if (!req.body) {
        res.status(400).send({
            message: "Content can not be empty!"
        });
    }

    console.log("Body: ", req.body);

    // Create a Config
    const config = new Config({
        email: req.body.key,
        name: req.body.value,
    });

    // Save Config in the database
    Config.create(config, (err, data) => {
        if (err)
            res.status(500).send({
                message:
                    err.message || "Some error occurred while creating the Config."
            });
        else res.send(data);
    });
};

// Retrieve all Configs from the database.
exports.findAll = (req, res) => {
    Config.getAll((err, data) => {
        if (err)
            res.status(500).send({
                message:
                    err.message || "Some error occurred while retrieving configs."
            });
        else res.send(data);
    });
};
