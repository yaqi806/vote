<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2019 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 老猫 <thinkcmf@126.com>
// +----------------------------------------------------------------------
namespace app\vote\model;

use app\admin\model\RouteModel;
use think\db\Query;
use think\Model;
use tree\Tree;

class PlayerModel extends Model
{

    protected $type = [
        'more' => 'array',
    ];

    /**
     * 生成分类 select树形结构
     * @param int $selectId   需要选中的分类 id
     * @param int $currentCid 需要隐藏的分类 id
     * @return string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getAllplayer()
    {
        $result = $this ->alias('p') ->join('mk_class c','c.c_id = p.p_classid','LEFT') ->join('mk_major m','m.m_id = p.p_maid','LEFT') ->where('p.p_isshow','1')->order("p.p_tnum DESC") ->paginate(10);
        return $result;
    }
    public function getAllplayer2()
    {
        $result = $this ->alias('p') ->join('mk_class c','c.c_id = p.p_classid','LEFT') ->join('mk_major m','m.m_id = p.p_maid','LEFT') ->where('p.p_isshow','0')->order("p.p_tnum DESC") ->paginate(10);
        return $result;
    }
    public function getLogs(){
        $result = db('plog') ->alias('l') ->join('mk_player p','l.l_pid = p.p_id','LEFT') ->join('mk_user2 u','u.u_openid = l.l_uopenid','LEFT') ->order("p.p_tnum DESC") ->paginate(10);
        return $result;
    }

}