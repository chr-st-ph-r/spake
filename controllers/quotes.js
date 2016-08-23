var mysql = require("../db.js");

exports.findAll = function(req, res, next) {
    mysql.pool.query(
        "SELECT * FROM quote",
        function(err, result) {
            if (err) {
                console.log(err);
                return;
            }
            
            res.send(result);
        }
    );
}

exports.findById = function(req, res, next) {
    mysql.pool.query(
        "SELECT * WHERE id=?",
        [req.params.id],
        function(err, result) {
            if (err) {
                console.log(err);
                return;
            }
            
            res.send(result);
        }
    );
}

exports.add = function(req, res, next) {
    mysql.pool.query(
        "INSERT INTO quote (quote, author, quoter) VALUES (?,?,?)",
        [req.body.quote, req.body.author, req.body.quoter],
        function(err, result) {
            if (err) {
                console.log(err);
                return;
            }
            
            res.send('boom');
        }
    );
}