module.exports = app => {
    const config = require("../controllers/config.controller.js");
  
    // Create a new Config
    app.post("/config", config.create);
  
    // Retrieve all Config
    app.get("/config", config.findAll);
  };