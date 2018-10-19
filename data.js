const express = require("express")
const server = express()
const cheerio = require("cheerio")
const superagent = require("superagent-charset")
const url = "https://buyshow.taobao.com/#/material/mPicEvaluation?_k=s97iz0"
const data_zao = ["goods_87","goods_99","goods_94","goods_107","goods_111","goods_108","goods_110","goods_113","goods_112","goods_360"]
server.get("/", function (req, res, next) {
    superagent.get(url).charset('gbk').end(function (err, data) {
        if (err) {
            return err
        }
        // var $ = cheerio.load(data.text)
        // console.log($)
        var arr = []
        // $(".prefectgoods-container .index-goods-box").each(item => {
        //     var get_name = $(item).find("h3 a").text;
        //     var get_time = $(item).find(".qijia").text;
        //     var get_des = $(item).find(".box-sub-tag-ct li")[1].text;
        //     var new_buyer = new buyer(get_name,get_time,get_des);
        //     arr.push(new_buyer)
        // });
        // res.send(JSON.stringify(arr))'
        res.send(data)
    })
})

function buyer(name, time, des) {
    var obj = {}
    obj.name = name;
    obj.name = time;
    obj.name = des;
    return obj
}
server.listen("1129", function () {
    console.log("run spot 1129")
})