var express = require("express");  
var fs = require('fs');
var app = express();  

app.use(express.static("public"));

app.get('/', function(req, res){
	fs.readFile('public/html/main.html', function(error,data){
		res.writeHead(200,{'Content-Type':'text/html'});
		res.end(data);
	});
});

app.get('/donation', function(req, res){
	fs.readFile('public/html/donation.html', function(error,data){
		res.writeHead(200,{'Content-Type':'text/html'});
		res.end(data);
	});
});

app.get('/index', function(req, res){
	fs.readFile('public/html/index.html', function(error,data){
		res.writeHead(200,{'Content-Type':'text/html'});
		res.end(data);
	});
});


app.listen(8080, function(){
	console.log('Server Start');
});
