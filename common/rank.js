import jsonp from "./jsonp"
import {commonParams,options} from "./config"
export function getData() {
    const url = "https://c.y.qq.com/v8/fcg-bin/fcg_myqq_toplist.fcg";
    const data = Object.assign({}, commonParams, {
        platform: h5,
        notice: 0,
        needNewCode: 1,
        uin: 0
    })
    return jsonp(url,data,options)
}