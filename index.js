var express = require('express');

var app = express();
var mysql = require('./db.js');
var bodyParser = require('body-parser');
var handlebars = require('express-handlebars').create({defaultLayout: 'main'});

app.engine('handlebars', handlebars.engine);
app.set('view engine', 'handlebars');

// http://stackoverflow.com/a/27855234
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

require('./routes')(app);

app.listen(4001);
console.log("Listening on port 4001");