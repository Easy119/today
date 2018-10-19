var express = require("express");
var http = require("http");
var fs = require("fs");
var app = express();

for (var port = 1000; port < 1100; port++) {
    http.createServer(function (req, res) {
        fs.readFile("./index.html", function (err, data) {
            if (err) {

            } else {
                res.writeHead(200, {
                    "Content-Type": "text/html;charset=UTF-8"
                });
                res.write(data)
                res.end();
            }
        })
    }).listen(port,"127.0.0.1")
}