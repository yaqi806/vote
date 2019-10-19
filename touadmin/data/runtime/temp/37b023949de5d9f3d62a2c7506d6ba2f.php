<?php /*a:2:{s:57:"C:\cyq\touadmin\public/themes/simplemall/vote\\index.html";i:1569220897;s:59:"C:\cyq\touadmin\public/themes/simplemall/public\header.html";i:1557192482;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <!-- Set render engine for 360 browser -->
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- HTML5 shim for IE8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->


    <link href="/touadmin/public/themes/simplemall/public/assets/themes/<?php echo cmf_get_admin_style(); ?>/bootstrap.min.css" rel="stylesheet">
    <link href="/touadmin/public/themes/simplemall/public/assets/simpleboot3/css/simplebootadmin.css" rel="stylesheet">
    <link href="/touadmin/public/static/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        form .input-order {
            margin-bottom: 0px;
            padding: 0 2px;
            width: 42px;
            font-size: 12px;
        }

        form .input-order:focus {
            outline: none;
        }

        .table-actions {
            margin-top: 5px;
            margin-bottom: 5px;
            padding: 0px;
        }

        .table-list {
            margin-bottom: 0px;
        }

        .form-required {
            color: red;
        }
    </style>
    <script type="text/javascript">
        //全局变量
        var GV = {
            ROOT: "/touadmin/public/",
            WEB_ROOT: "/touadmin/public/",
            JS_ROOT: "static/js/",
            APP: '<?php echo app('request')->module(); ?>'/*当前应用名*/
        };
    </script>
    <script src="/touadmin/public/themes/simplemall/public/assets/js/jquery-1.10.2.min.js"></script>
    <script src="/touadmin/public/static/js/wind.js"></script>
    <script src="/touadmin/public/themes/simplemall/public/assets/js/bootstrap.min.js"></script>
    <script>
        Wind.css('artDialog');
        Wind.css('layer');
        $(function () {
            $("[data-toggle='tooltip']").tooltip({
                container:'body',
                html:true,
            });
            $("li.dropdown").hover(function () {
                $(this).addClass("open");
            }, function () {
                $(this).removeClass("open");
            });
        });
    </script>
    <?php if(APP_DEBUG): ?>
        <style>
            #think_page_trace_open {
                z-index: 9999;
            }
        </style>
    <?php endif; ?>
</head>
<body>
<div class="wrap">
    <ul class="nav nav-tabs">
        <li class="active"><a><?php echo lang('USER_INDEXADMIN_INDEX1'); ?></a></li>
    </ul>
    <form class="well form-inline margin-top-20" method="post" action="<?php echo url('vote/adminIndex/index'); ?>">
        用户ID：
        <input class="form-control" type="text" name="uid" style="width: 200px;" value="<?php echo input('request.uid'); ?>"
               placeholder="请输入用户ID">
        关键字：
        <input class="form-control" type="text" name="keyword" style="width: 200px;" value="<?php echo input('request.keyword'); ?>"
               placeholder="姓名/班级/编号">
        <input type="submit" class="btn btn-primary" value="搜索"/>
        <a class="btn btn-danger" href="<?php echo url('vote/adminIndex/index'); ?>">清空</a>
    </form>
    <form method="post" class="js-ajax-form">
        <table class="table table-hover table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>姓名</th>
                <th>选手编号</th>
                <th>投票数量</th>
                <th>选手班级</th>
                <th>选手专业</th>
                <th>选手头像</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <?php 
                $user_statuses=array("0"=>lang('USER_STATUS_BLOCKED'),"1"=>lang('USER_STATUS_ACTIVATED'),"2"=>lang('USER_STATUS_UNVERIFIED'));
             if(is_array($playerarr) || $playerarr instanceof \think\Collection || $playerarr instanceof \think\Paginator): if( count($playerarr)==0 ) : echo "" ;else: foreach($playerarr as $key=>$vo): ?>
                <tr>
                    <td><?php echo $vo['p_id']; ?></td>
                    <td><?php echo $vo['p_name']; ?></td>
                    <td><?php echo $vo['p_num']; ?></td>
                    <td><?php echo $vo['p_tnum']; ?></td>
                    <td><?php echo $vo['c_name']; ?></td>
                    <td><?php echo $vo['m_name']; ?></td>
                    <td><img width="25" height="25" src="<?php echo $vo['p_photo']; ?>"/></td>
                    <td>
                                <a class="btn btn-xs btn-warning js-ajax-dialog-btn"
                                   href="<?php echo url('vote/adminIndex/jinyong',array('id'=>$vo['p_id'])); ?>"
                                   data-msg="<?php echo lang('BLOCK_USER_CONFIRM_MESSAGE'); ?>"><?php echo lang('BLOCK_USER'); ?></a>
                    </td>
                </tr>
         <?php endforeach; endif; else: echo "" ;endif; ?>
            </tbody>
        </table>
        <div class="pagination"><?php echo $page; ?></div>
    </form>
</div>
<script src="/touadmin/public/static/js/admin.js"></script>
</body>
</html>