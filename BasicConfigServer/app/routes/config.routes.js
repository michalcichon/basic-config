module.exports = app => {
    const config = require("../controllers/config.controller.js");
  
    // Create a new Config
    app.post("/config", config.create);
  
    // Retrieve all Configs
    app.get("/config", config.findAll);

    // Get all Configs after given timestamp
    app.get("/config/:timestamp", config.findAfter);
  };