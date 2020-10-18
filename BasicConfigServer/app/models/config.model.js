const sql = require("./db.js");

// constructor
const Config = function(config) {    
    this.key = config.key;
    this.value = config.value;
};

Config.create = (newConfig, result) => {
    sql.query("INSERT INTO config SET ?", newConfig, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(err, null);
            return;
        }

        console.log("created config: ", { id: res.insertId, ...newConfig });
        result(null, { id: res.insertId, ...newConfig });
    })
}

Config.getAll = result => {
    sql.query("SELECT * FROM config", (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(null, err);
            return;
        }
        console.log("configs: ", res);
        result(null, res);
    });
};

Config.getAfter = (timestamp, result) => {
    sql.query(`SELECT * FROM config WHERE updated_at > STR_TO_DATE('${timestamp}', '%Y-%m-%dT%H:%i:%s%.%#Z')`, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(null, err);
            return;
        }
        console.log("configs: ", res);
        result(null, res);
    });
};

module.exports = Config;
