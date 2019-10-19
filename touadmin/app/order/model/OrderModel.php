<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2019 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 老猫 <catmant@thinkcmf.com>
// +----------------------------------------------------------------------
namespace app\order\model;

use think\Model;

class OrderModel extends Model
{

    protected $type = [
        'more' => 'array',
    ];

    /**
     * 关联 user表
     * @return \think\model\relation\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo('app\user\model\UserModel', 'user_id')->setEagerlyType(1);
    }
    
    public function items()
    {
        return $this->hasMany('OrderItemModel', 'order_id')->order('goods_price desc');
    }

}