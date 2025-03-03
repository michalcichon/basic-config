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
        key: req.body.key,
        value: req.body.value,
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

// Retrieve Configs from the database after given timestamp.
exports.findAfter = (req, res) => {
    Config.getAfter(req.params.timestamp, (err, data) => {
        if (err) {
            if (err.kind === "not_found") {
                res.status(404).send({
                    message: `Not found Config after timestamp ${req.params.timestamp}.`
            });
            } else {
                res.status(500).send({
                    message: "Error retrieving Configs after timestamp " + req.params.timestamp
                });
            }
        } else res.send(data);
      });
};
