const express = require("express")
var request = require('request');
let server = express();
const bodyParser = require("body-parser");
server.use(bodyParser.json())
//设置请求头
server.all("*", function(req, res, next) {
	res.header("Access-Control-Allow-Origin", "*");
	res.header("Access-Control-Allow-Methods", "PUT,POST,GET,DELETE,OPTIONS");
	res.header("Content-Type", "application/json;charset=utf-8");
	res.header("Access-Control-Allow-Headers", "origin, content-type, accept, authorization")
	next()
})
server.post("/detail", function (req,res) {
    let id  = req.body.item_id;
    let sign = req.body.sign;
    console.log(sign)
    request(`http://hws.m.taobao.com/d/modulet/v5/WItemMouldDesc.do?id=${id}&f=${sign}`, function (error, response, body) {
        if (!error && response.statusCode == 200) {
            res.send(body)
        }
    })
})
server.post("/detailStr",function(req,res){
    let id  =req.body.item_id;
    console.log(id);
    let url = `https://h5api.m.taobao.com/h5/mtop.taobao.detail.getdetail/6.0/?jsv=2.4.8&appKey=12574478&t=1539943946517&sign=52eb65531345aceda512397132813d79&api=mtop.taobao.detail.getdetail&v=6.0&dataType=jsonp&ttid=2017%40taobao_h5_6.6.0&AntiCreep=true&type=jsonp&callback=mtopjsonp2&data=%7B%22itemNumId%22%3A%22${id}%22%7D`;
    request(url, function (error, response, body) {
        if (!error && response.statusCode == 200) {
            let objStr = body.substring(body.indexOf("(")+1,body.lastIndexOf(")"))
            let objUrl = JSON.parse(objStr).data.item.moduleDescUrl;
            res.send(`{"ok": true, "msg": "${objUrl}"}`)
        }
    })
})

server.listen("8888",function(){
    console.log("8888")
})
