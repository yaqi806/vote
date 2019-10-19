const _TYPE_WECHAT = "wechat";
const _TYPE_ALIPAY = "alipay";
window.yAjax = {};
window.yWindow = {};
window.yValidate = {};

Date.prototype.format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "H+": this.getHours(), //小时
        "m+": this.getMinutes(), //分
        "s+": this.getSeconds(), //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds() //毫秒
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
};

window.yTerminal = (function (win, doc) {
    var UA = navigator.userAgent,
        isAndroid = /android|adr/gi.test(UA),
        isIos = /iphone|ipod|ipad/gi.test(UA) && !isAndroid, // 据说某些国产机的UA会同时包含 android iphone 字符
        isMobile = isAndroid || isIos;  // 粗略的判断

    return {
        isAndroid: isAndroid,
        isIos: isIos,
        isMobile: isMobile,

        isNewsApp: /NewsApp\/[\d\.]+/gi.test(UA),
        isWechat: /MicroMessenger/gi.test(UA),
        isAlipay: /AlipayClient/gi.test(UA),
        isQQ: /QQ\/\d/gi.test(UA),
        isYixin: /YiXin/gi.test(UA),
        isWeibo: /Weibo/gi.test(UA),
        isTXWeibo: /T(?:X|encent)MicroBlog/gi.test(UA),

        tapEvent: isMobile ? 'tap' : 'click',

        agent: function () {
            var ua = window.navigator.userAgent.toLowerCase();
            //判断是不是微信
            if (ua.match(/MicroMessenger/i) == 'micromessenger') {
                return _TYPE_WECHAT;
            }
            //判断是不是支付宝
            if (ua.match(/AlipayClient/i) == 'alipayclient') {
                return _TYPE_ALIPAY;
            }
            return null;
        },

        /**
         * 缩放页面
         */
        fixScreen: function () {
            var metaEl = doc.querySelector('meta[name="viewport"]'),
                metaCtt = metaEl ? metaEl.content : '',
                matchScale = metaCtt.match(/initial\-scale=([\d\.]+)/),
                matchWidth = metaCtt.match(/width=([^,\s]+)/);

            if (!metaEl) { // REM
                var docEl = doc.documentElement,
                    maxwidth = docEl.dataset.mw || 750, // 每 dpr 最大页面宽度
                    dpr = isIos ? Math.min(win.devicePixelRatio, 3) : 1,
                    scale = 1 / dpr,
                    tid;

                docEl.removeAttribute('data-mw');
                docEl.dataset.dpr = dpr;
                metaEl = doc.createElement('meta');
                metaEl.name = 'viewport';
                metaEl.content = fillScale(scale);
                docEl.firstElementChild.appendChild(metaEl);

                var refreshRem = function () {
                    var width = docEl.getBoundingClientRect().width;
                    if (width / dpr > maxwidth) {
                        width = maxwidth * dpr;
                    }
                    var rem = width / 16;
                    docEl.style.fontSize = rem + 'px';
                };

                win.addEventListener('resize', function () {
                    clearTimeout(tid);
                    tid = setTimeout(refreshRem, 300);
                }, false);
                win.addEventListener('pageshow', function (e) {
                    if (e.persisted) {
                        clearTimeout(tid);
                        tid = setTimeout(refreshRem, 300);
                    }
                }, false);

                refreshRem();
            } else if (isMobile && !matchScale && ( matchWidth && matchWidth[1] != 'device-width' )) { // 定宽
                var width = parseInt(matchWidth[1]),
                    iw = win.innerWidth || width,
                    ow = win.outerWidth || iw,
                    sw = win.screen.width || iw,
                    saw = win.screen.availWidth || iw,
                    ih = win.innerHeight || width,
                    oh = win.outerHeight || ih,
                    ish = win.screen.height || ih,
                    sah = win.screen.availHeight || ih,
                    w = Math.min(iw, ow, sw, saw, ih, oh, ish, sah),
                    scale = w / width;

                if (scale < 1) {
                    metaEl.content = metaCtt + ',' + fillScale(scale);
                }
            }

            function fillScale(scale) {
                return 'initial-scale=' + scale + ',maximum-scale=' + scale + ',minimum-scale=' + scale + ',user-scalable=no';
            }
        },

        /**
         * 转href参数成键值对
         * @param href {string} 指定的href，默认为当前页href
         * @returns {object} 键值对
         */
        getSearch: function (href) {
            href = href || win.location.search;
            var data = {}, reg = new RegExp("([^?=&]+)(=([^&]*))?", "g");
            href && href.replace(reg, function ($0, $1, $2, $3) {
                data[$1] = $3;
            });
            return data;
        }
    };
})(window, document);

/**
 * 1. 请求的类型  type get post
 * 2. 请求地址  url
 * 3. 是异步的还是同步的  async false true
 * 4. 请求内容的格式  contentType
 * 5. 传输的数据  data json对象
 *
 * 6.响应成功处理函数  success function
 * 7.响应失败的处理函数  error function
 *
 * 这些都是动态参数 参数对象 options
 **/
yAjax.request = function (options) {

    if (!options || typeof options != 'object') {
        return false;
    }

    /*请求的类型*/
    var type = options.type || 'get';
    /*默认get*/
    /*请求地址 */
    var url = options.url || location.pathname;
    /*当前的地址*/
    /*是异步的还是同步的 */
    var async = (options.async === false) ? false : true;
    /*默认异步*/
    /*请求内容的格式 */
    var contentType = options.contentType || "text/html";

    /*传输的数据 */
    var data = options.data || {};
    /*｛name:'',age:''｝*/
    /*在提交的时候需要转成 name=xjj 这种格式*/

    var dataStr = '';
    /*数据字符串*/

    for (var key in data) {
        dataStr += key + '=' + data[key] + '&';
    }

    dataStr = dataStr && dataStr.slice(0, -1);

    /*ajax 编程*/
    var xhr = new XMLHttpRequest();

    /*请求行*/
    /*(type=='get'?url+'?'+dataStr:url)判断当前的请求类型*/
    xhr.open(type, (type == 'get' ? url + '?' + dataStr : url), async);

    /*请求头*/
    if (type == 'post') {
        if (contentType == "json") {
            xhr.setRequestHeader('Content-Type', 'application/json');
        }
        else {
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        }
    } else if(type == "put"){
        xhr.setRequestHeader('Content-Type', "application/json;charset=UTF-8");
    }
    xhr.setRequestHeader('Client-Type', 'I');
    /*请求主体*/
    /*需要判断请求类型*/
    xhr.send(type == 'get' ? null : contentType == "json" ? JSON.stringify(data) : dataStr);

    /*监听响应状态的改变  响应状态*/
    xhr.onreadystatechange = function () {
        var result = '';
        var contentType = xhr.getResponseHeader('Content-Type') || "";
        /*请求响应完成并且成功*/
        if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 201)) {
            /*如果我们服务器返回的是xml*/
            if (contentType.indexOf('xml') > -1) {
                result = xhr.responseXML;
            }
            /*如果我们的服务器返回的是json字符串*/
            else if (contentType.indexOf('json') > -1) {
                /*转化json对象*/
                result = JSON.parse(xhr.responseText);
            }
            /*否则的话他就是字符串*/
            else {
                result = xhr.responseText;
            }
            /*success*/
            options.success && options.success(result);
        }
        /*计时请求xhr.status不成功  他也需要的响应完成才认作是一个错误的请求*/
        else if (xhr.readyState == 4) {
            /*如果我们服务器返回的是xml*/
            if (contentType.indexOf('xml') > -1) {
                result = xhr.responseXML;
            }
            /*如果我们的服务器返回的是json字符串*/
            else if (contentType.indexOf('json') > -1) {
                /*转化json对象*/
                result = JSON.parse(xhr.responseText);
            }
            /*否则的话他就是字符串*/
            else {
                result = xhr.responseText;
            }
            /*error*/
            options.error && options.error(result);
            if (xhr.status == 401 || xhr.status == 403) {
                /*authorize*/
                options.authorize && options.authorize();
            }
        }
    }
};

yAjax.post = function (options) {
    options.type = 'post';
    yAjax.request(options);
};

yAjax.get = function (options) {
    options.type = 'get';
    yAjax.request(options);
};

yWindow.return = function () {
    window.history.go(-1);
};

yWindow.close = function () {
    var type = yTerminal.agent();
    switch (type) {
        case _TYPE_WECHAT:
            WeixinJSBridge.call('closeWindow');
            break;
        case _TYPE_ALIPAY:
            AlipayJSBridge.call('closeWebview');
            break;
        default:
            window.close();
            break;
    }
};

yValidate.checkEmpty = function (obj) {
    return (obj == null
    || obj == undefined
    || obj == "");

};

/**
 * 非空
 * @param obj
 * @returns {boolean}
 */
yValidate.checkNotEmpty = function (obj) {
    return !yValidate.checkEmpty(obj);

};

function formatMoney(s, n) {
    n = n > 0 && n <= 20 ? n : 2;
    s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
    var l = s.split(".")[0].split("").reverse(),
        r = s.split(".")[1];
    t = "";
    for (i = 0; i < l.length; i++) {
        t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
    }
    return t.split("").reverse().join("") + "." + r;
}

function setText(id, val) {
    document.getElementById(id).innerText = val;
}

function setHtml(id, val) {
    document.getElementById(id).innerHTML = val;
}

function setValue(id, val) {
    document.getElementById(id).value = val;
}

function playSound(uri) {
    var body = document.querySelector("body");
    var audio = document.getElementById("audioSrc");
    if (null == document.querySelector("audio") || null == document.getElementById("audioSrc")) {
        audio = document.createElement("audio");
        audio.id = "audioSrc";
        audio.src = uri;
        audio.hidden = true;
        body.appendChild(audio);
    }

    //从1s开始播放
    audio.currentTime = 1;
    audio.play();
    // document.addEventListener('WeixinJSBridgeReady', function () {
    //     //从1s开始播放
    //     audio.currentTime = 1;
    //     audio.play();
    // }, false);
}

function getStorage(k) {
    return sessionStorage && sessionStorage.getItem(k) || localStorage && localStorage.getItem(k) || ("" && console.log("获取缓存失败"));
}

function setStorage(k, v) {
    sessionStorage && sessionStorage.setItem(k, v) || localStorage && localStorage.setItem(k, v) || console.log("设置缓存失败");
}

function guid() {
    /**
     * @returns {string}
     * @constructor
     */
    function S4() {
        return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
    }

    return (S4() + S4() + "-" + S4() + "-" + S4() + "-" + S4() + "-" + S4() + S4() + S4());
}

//默认自动适配屏幕
yTerminal.fixScreen();
