/**
 * @author lb
 */
$.extend({
    isEmpty:function(str){
        if(str===undefined || str==null){
            return true;
        }
        str=$.trim(str);
        if(str==""){
            return true;
        }
        return false;
    },
    isEmail:function(email){
        if (email.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)){
            return true;
        }else{
            return false;
        }
    },
    isPhone:function(phone){
        if(!(/^1[3|4|5|7|8|9][0-9]\d{4,8}$/.test(phone))){
            return false;
        }else{
            return true;
        }
    },
    //获得url参数
    GET:function(param){
        var url=document.URL;
        var paramList=url.split("?")[1];
        if(paramList){
            var arr=paramList.split("&");
            for(var i=0;i<arr.length;i++){
                var arr2=arr[i].split("=");
                if(arr2[0]==param){
                    return arr2[1];
                }
            }
        }
        return false;
    },
    //获取ie版本
    getIE:function(){
        if ( $.browser.msie ){
            return $.browser.version;
        }
    },
    //获得系统类型
    getSystem:function(){
        var appVersion = window.navigator.appVersion;   //客户端信息
        if(appVersion.toLocaleLowerCase().indexOf("android")>-1){
            return "android";
        }
        if(appVersion.toLocaleLowerCase().indexOf("iphone")>-1){
            return "iphone";
        }
        if(appVersion.toLocaleLowerCase().indexOf("windows")>-1){
            return "windows";
        }
        return appVersion;
    },
    /*
     * 生成范围随机数
     * min：最小范围
     * max：最大范围，如省略为生成0～min之间随机数
     */
    getRandom:function(min,max,no){
        var _max=max || min;
        var _min=max?min:0;
        var n=parseInt(Math.random()*(_max-_min+1)+_min);
        if(n==no){
            n= $.getRandom(min,max,no);
        }
        return n;
    }
});
/**
 * @param options 确认框
 * title:标题
 * content：内容(html标签)
 * speed:速度
 * className:弹出额外className
 * bj:显示背景
 * bjClassName:背景额外className
 * opacity:背景透明度
 * bjClick：点击背景事件(默认关闭),true/false/function()
 * ok:点击成功按钮事件(默认关闭)
 * closed:点击关闭按钮事件（默认关闭）
 * cance:点击取消按钮事件（默认关闭）
 * okName:确认按钮名称
 * cancelName:取消按钮名称
 * closeShow: 右上关闭按钮显示
 * closeName:关闭按钮名称
 * uniqueness：是否唯一，true（默认），false
 * call:显示后回调函数
 */
(function(){
    $.fn.confirm = function(options){
        var defaults = {
            title:false,
            icon:true,
            iconClass:false,
            content:"",
            speed:200,
            className:false,
            bj:true,
            bjClassName:false,
            opacity:0.7,
            bjClick:false,
            ok:function(){$.confirm.close();},
            closed:function(){$.confirm.close();},
            cancel:function(){$.confirm.close();},
            okName:"确定",
            cancelName:"取消",
            closeShow:false,
            closeName:"",
            uniqueness:true,
            call:false
        }
        var options = $.extend(defaults, options);
        this.each(function(){
            if(options.uniqueness){
                $(".tempConfirmShade").remove();
                $(".tempConfirm").remove();
            }
            var _this=$(this);
            var bj,pop,buttonBox;
            var title=false;
            var closeButton=false;
            var cancelButton=false;
            var okButton=false;
            if(options.bj){
                bj =$('<div class="tempConfirmShade"></div>').appendTo("body");
                if(options.bjClassName){
                    bj.addClass(options.bjClassName);
                }

            }
            pop=$('<div class="tempConfirm"></div>').appendTo("body");
            if(options.icon){
                var icon=$('<div class="tempConfirmIcon"></div>').appendTo(pop);
                if(options.iconClass){
                    icon.addClass(options.iconClass);
                }
            }
            if(options.closeShow){
                closeButton=$('<a class="tempConfirmCloes" href="javascript:void(0)">'+options.closeName+'</a>').appendTo(pop);
            }
            if(options.title!==false){
                title=$('<div class="tempConfirmTitle">'+options.title+'</div>').appendTo(pop);
            }

            pop.append('<div class="tempConfirmContents">'+options.content+'</div>');
            if(options.okName || options.cancelName){
                buttonBox=$('<div class="tempConfirmButtonBox"></div>').appendTo(pop);
                if(options.buttonClass){
                    buttonBox.addClass(options.buttonClass);
                }
                if(options.okName){
                    okButton=$('<a href="javascript:void(0)">'+options.okName+'</a>').appendTo(buttonBox);
                }
                if(options.cancelName){
                    cancelButton=$('<a href="javascript:void(0)">'+options.cancelName+'</a>').appendTo(buttonBox);
                }
                if(options.okName==false || options.cancelName==false){
                    buttonBox.addClass("butOne");
                }
            }

            if(options.bj){
                bj.fadeTo(options.speed,options.opacity,function(){
                    pop.css({"top":($(window).height()-pop.outerHeight(true))/2,"left":($(window).width()-pop.outerWidth(true))/2}).fadeIn(options.speed,function(){
                        if($.isFunction(options.bjClick)){
                            bj.click(function(){
                                options.bjClick();
                            });
                        }else if(options.bjClick){
                            bj.click(function(){
                                $(document).confirm.close();
                            });
                        }
                        if($.isFunction(options.call)){
                            options.call();
                        }
                    });

                });
            }else{
                pop.css({"top":($(window).height()-pop.outerHeight(true))/2,"left":($(window).width()-pop.outerWidth(true))/2}).fadeIn(options.speed,function(){
                    if($.isFunction(options.call)){
                        options.call();
                    }
                });
            }
            if(closeButton){
                closeButton.on("click",function(){
                    options.closed();
                });
            }
            if(okButton){
                okButton.on("click",function(){
                    options.ok();
                });
            }
            if(cancelButton){
                cancelButton.on("click",function(){
                    options.cancel();
                });
            }
            $.fn.confirm.close=function(fn){
                if(bj){
                    bj.fadeOut(options.speed);
                }
                pop.fadeOut(options.speed,function(){
                    if($.isFunction(fn)){
                        fn();
                    }
                    if(bj){
                        bj.remove();
                    }
                    pop.remove();
                });
            }
            $.fn.confirm.refresh=function(fn){
                pop.animate({"top":($(window).height()-pop.outerHeight(true))/2,"left":($(window).width()-pop.outerWidth(true))/2},options.speed,function(){
                    if($.isFunction(fn)){
                        fn();
                    }
                });
            }
        });
    }
    $.extend({
        confirm:function(options){
            $(window).confirm(options);
        }
    })
    $.confirm.close=function(fn){
        $.fn.confirm.close(fn);
    }
    $.confirm.refresh=function(fn){
        $.fn.confirm.refresh(fn);
    }
})(jQuery);
/**
 * 提示信息
 * @param options
 *      msg:信息内容
 *      closeTime:显示时间 默认2000,-1为不消失
 *      speed:淡入淡出速度，默认400
 *      p: position对象相对位置(有dom时起作用),T:顶部(默认)，D：底部，L：左，R：右
 *      excursion:相对位置偏移，默认：10px
 *      bj:是否有背景，true:是,false:否(默认)
 *      bjClick:点击背景是否关闭msg，true:是,false:否(默认)
 *      opacity:背景透明度，0-1，默认(0.7)
 *      uniqueness:是否唯一，true:是,false:否(默认)
 *      call:显示后回调函数
 *      closed:关闭后回调函数
 */
(function(){
    $.fn.msg = function(options){
        var defaults = {
            msg:'',
            closeTime:2000,
            speed:300,
            p:'T',
            excursion:10,
            bj:false,
            bjClick:false,
            opacity:0.7,
            uniqueness:true,
            call:false,
            closed:false
        }
        var options = $.extend(defaults, options);
        $.fn.msg.closeAll=function(){
            $(".tempMsg,.tempMsgBj").remove();
        }
        this.each(function(){
            if(options.uniqueness){
                $.fn.msg.closeAll();
            }
            var _this=$(this);
            var _left=0;    //弹出坐标x
            var _top=0;     //弹出坐标y
            var _msg=$('<div class="tempMsg"></div>').appendTo("body");
            var _bj=false;
            if(options.bj){
                _bj=$('<div class="tempMsgBj"></div>').appendTo("body");
            }
            _msg.append(options.msg);
            var _width = _msg.outerWidth();
            var _height = _msg.outerHeight();
            var _window=$(window);
            if(_this.is('body') || _this.is(_window) || _this.is(document)){
                _left = (_window.width()-_width)/2+_window.scrollLeft();
                _top = (_window.height()-_height)/2+_window.scrollTop();
            }else{
                switch (options.p){
                    case "R":
                        _top = _this.offset().top+(_this.height()-_height)/2;
                        _left = _this.offset().left + _this.outerWidth(true)+options.excursion;
                        break;
                    case "L":
                        _top = _this.offset().top+(_this.height()-_height)/2;
                        _left = _this.offset().left - _width - options.excursion;
                        break;
                    case "D":
                        _left = _this.offset().left + (_this.outerWidth(true)-_width)/2;
                        _top = _this.offset().top+_this.outerHeight(true)+options.excursion;
                        break;
                    default :
                        _left = _this.offset().left + (_this.outerWidth(true)-_width)/2;
                        _top = _this.offset().top-_height-options.excursion;
                }
            }
            _msg.css({"left":_left,"top":_top});
            if(options.bj){
                _bj.fadeTo(options.speed,options.opacity);
                if(options.bjClick){
                    _bj.bind("click",function(){
                        $.fn.msg.close(_msg,_bj);
                    })
                }
                if($.isFunction(options.bjClick)){
                    _bj.bind("click",function(){
                        options.bjClick();
                    });
                }else if(options.bjClick){
                    _bj.bind("click",function(){
                        $.fn.msg.close(_msg,_bj);
                    })
                }
            }
            _msg.fadeIn(options.speed,function(){
                if($.isFunction(options.call)){
                    options.call(_msg,_bj);
                }
                if(options.closeTime>-1){
                    setTimeout(function(){$.fn.msg.close(_msg,_bj)},options.closeTime);
                }
            });
        });
        $.fn.msg.close=function(msg,bj){
            if(msg){
                if(bj){
                    bj.fadeTo(options.speed,0,function(){
                        bj.remove();
                    });
                }
                msg.fadeOut(options.speed,function(){
                    msg.remove();
                    if($.isFunction(options.closed)){
                        options.closed();
                    }
                });
            }else{

            }

        }
    };
    $.extend({
        msg:function(options){
            $(window).msg(options);
        }
    })
    $.msg.close=function(msg,bj){
        $.fn.msg.close(msg,bj);
    }
    $.msg.closeAll=function(){
        $.fn.msg.closeAll();
    }
})(jQuery);

/*
 *   显示板
 */
$.fn.counter = function(options){
    var defaults = {
        frequency:190,
        time:3000,
        digit:7,
        auto:0,
        autoTime:500
    }
    var options = $.extend(defaults, options);
    this.each(function(){
        var _this=$(this);
        var _number=parseInt(options.number);
        var _n=parseInt(_number/options.frequency);
        var _time=parseInt(options.time/options.frequency);
        var i=0;
        var str0='';
        for(var i=0;i<options.digit;i++){
            str0+='0';
        }
        setNumber(i);
        function setNumber(num){
            if(num>=_number){
                if(options.auto>0){
                    setTimeout(function(){
                        num+=options.auto;
                        setNumber(num);
                    },options.autoTime);
                }else{
                    num=_number;
                }
            }else{
                setTimeout(function(){
                    num+=_n;
                    setNumber(num);
                },_time);
            }
            show(num);
        }
        function show(num){
            var s=(str0+num).slice(-options.digit);
            var str='';
            for(var i=0;i<7;i++){
                str+='<i>'+ s.charAt(i)+'</i>'
            }
            _this.html(str)
        }
    });
};

/*
 *   跑马灯
 *  speed:速度，默认600ms
 *  time:间隔时间 默认5000
 */
$.fn.marquee = function(options){
    var defaults = {
        speed:400,
        time:3000
    }
    var options = $.extend(defaults, options);
    this.each(function(){
        var _this=$(this);
        var _div=_this.find(".currents");

        var _ul=_this.find("ul");
        var _height=_ul.children("li:first").outerHeight(true);
        var _len=_ul.find("li").size();
        var _butUp=_this.find(".butUp");
        var _butDown=_this.find(".butDown");
        if(_len*_height>_div.height()){
            var trundle;
            _butUp.show();
            _butDown.show();
            if(options.time>0){
                trundle=setInterval(function(){
                    wheelGo(1);
                },options.time);
            }
            _butUp.on("click",function(){
                wheelGo(1);
            });
            _butDown.on("click",function(){
                wheelGo(-1);
            });
            _this.hover(
                function(){
                    clearInterval(trundle);
                },
                function(){
                    if(options.time>0){
                        trundle=setInterval(function(){
                            wheelGo(1);
                        },options.time);
                    }
                }
            );
        }
        function wheelGo(d){
            var _top=0;
            if(d==1){
                _top=-_height;
            }else{
                _ul.prepend(_ul.find("li:last"));
                _ul.css("top",-_height);
            }
            _ul.stop().animate({"top":_top},options.speed,function(){
                if(d==1){
                    _ul.append(_ul.find("li:first"));
                    _ul.css("top",0);
                }
            });
        }
    });
};
