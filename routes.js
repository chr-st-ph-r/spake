module.exports = function(app) {
    var quotes = require("./controllers/quotes");
    app.get("/quotes", quotes.findAll);
}