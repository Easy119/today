var http = require('http');
var express = require("express")
var server = express()
var multer = require('multer')
const fs = require("fs")
const pathLib = require("path")
var upload = multer({
    dest: 'uploads/',
    limits:{
        fileSize:1024 * 100
    }
})
var app = express();
app.all("*", function (req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Methods", "PUT,POST,GET,DELETE,OPTIONS");
    res.header("Content-Type", "multipart/form-data");
    res.header("Access-Control-Allow-Headers", "origin, content-type, accept, authorization")
    next()
})
app.use('/profile', upload.any(), function (req, res) {
    var newName = req.files[0].path + pathLib.parse(req.files[0].originalname).ext;
    console.log(newName)
    // var newName = req.files[0].originalname;
    // 修改 文件名字
    fs.rename(req.files[0].path, newName, function (err) {
        if (err)
            res.send('上传失败');
        else
            res.send('成功');
    })
})
// var url = 'blob:http://192.168.1.216:8080/e2b8e33d-e925-45af-a7b3-0ba54515a667'; //一张网络图片

app.listen(8089,function(){
    console.log("8089")
})
// server.get("/", function (req, respones) {
//     http.get(url, function (res) {
//         var chunks = []; //用于保存网络请求不断加载传输的缓冲数据
//         var size = 0; //保存缓冲数据的总长度
//         res.on('data', function (chunk) {
//             chunks.push(chunk); //在进行网络请求时，会不断接收到数据(数据不是一次性获取到的)，

//             //node会把接收到的数据片段逐段的保存在缓冲区（Buffer），

//             //这些数据片段会形成一个个缓冲对象（即Buffer对象），

//             //而Buffer数据的拼接并不能像字符串那样拼接（因为一个中文字符占三个字节），

//             //如果一个数据片段携带着一个中文的两个字节，下一个数据片段携带着最后一个字节，

//             //直接字符串拼接会导致乱码，为避免乱码，所以将得到缓冲数据推入到chunks数组中，

//             //利用下面的node.js内置的Buffer.concat()方法进行拼接


//             size += chunk.length; //累加缓冲数据的长度
//         });



//         res.on('end', function (err) {

//             var data = Buffer.concat(chunks, size); //Buffer.concat将chunks数组中的缓冲数据拼接起来，返回一个新的Buffer对象赋值给data

//             console.log(Buffer.isBuffer(data)); //可通过Buffer.isBuffer()方法判断变量是否为一个Buffer对象
//             var base64Img = data.toString('base64'); //将Buffer对象转换为字符串并以base64编码格式显示

//             //console.log(base64Img);　　 //进入终端terminal,然后进入index.js所在的目录，
//             respones.send(base64Img)
//             //在终端中输入node index.js

//             //打印出来的就是图片的base64编码格式，格式如下　　　　

//         });

//     });

// })
