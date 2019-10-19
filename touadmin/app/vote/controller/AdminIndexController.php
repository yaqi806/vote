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
namespace app\vote\controller;

use cmf\controller\HomeBaseController;
use app\vote\model\PlayerModel;
use think\Db;
use think\db\Query;
class AdminIndexController extends HomeBaseController
{
    public function index()
    {
    	$content = hook_one('vote_admin_index_view');

        if (!empty($content)) {
            return $content;
        }
    	$data = $this->request->param();
    	$playerarr = Db::name('player')
    		->alias('p') 
    		->join('mk_class c','c.c_id = p.p_classid','LEFT')
    		->join('mk_major m','m.m_id = p.p_maid','LEFT')
            ->where(function (Query $query) {
                $data = $this->request->param();
                if (!empty($data['uid'])) {
                    $query->where('p.p_id', intval($data['uid']));
                }

                if (!empty($data['keyword'])) {
                    $keyword = $data['keyword'];
                    $query->where('p.p_name|c.c_name|p.p_num', 'like', "%$keyword%");
                }
				$query->where('p.p_isshow','1');
            })->order("p.p_tnum DESC")
            ->paginate(10);
        $page = $playerarr->render();
		$this->assign('playerarr', $playerarr);
		$this->assign('page', $page);
        return $this->fetch(':index');
    }

	public function jinyong()
    {
        $id = input('param.id', 0, 'intval');
        if ($id) {
            $result = Db::name("player")->where("p_id", $id)->setField('p_isshow', 0);
            if ($result) {
                $this->success("禁用成功！", "adminIndex/index");
            } else {
                $this->error('禁用失败,选手不存在,或者是管理员！');
            }
        } else {
            $this->error('数据传入失败！');
        }
    }

    /**
     * 本站用户启用
     * @adminMenu(
     *     'name'   => '本站用户启用',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '本站用户启用',
     *     'param'  => ''
     * )
     */
	public function qiyong()
    {
        $id = input('param.id', 0, 'intval');
        if ($id) {
            Db::name("player")->where("p_id" , $id)->setField('p_isshow', 1);
            $this->success("启用成功！", '');
        } else {
            $this->error('数据传入失败！');
        }
    }

    public function index2()
    {
        $content = hook_one('vote_admin_index_view');

        if (!empty($content)) {
            return $content;
        }
        $data = $this->request->param();
        $playerarr = Db::name('player')
            ->alias('p') 
            ->join('mk_class c','c.c_id = p.p_classid','LEFT')
            ->join('mk_major m','m.m_id = p.p_maid','LEFT')
            ->where(function (Query $query) {
                $data = $this->request->param();
                if (!empty($data['uid'])) {
                    $query->where('p.p_id', intval($data['uid']));
                }

                if (!empty($data['keyword'])) {
                    $keyword = $data['keyword'];
                    $query->where('p.p_name|c.c_name|p.p_num', 'like', "%$keyword%");
                }
                $query->where('p.p_isshow','0');
            })->order("p.p_tnum DESC")
            ->paginate(10);
        $page = $playerarr->render();
        $this->assign('playerarr', $playerarr);
        $this->assign('page', $page);
        return $this->fetch(':shenhe');
    }
    public function logs()
    {
        $content = hook_one('vote_admin_index_view');

        if (!empty($content)) {
            return $content;
        }
        $data = $this->request->param();
        $playerarr = Db::name('plog')
            ->alias('l') 
            ->join('mk_player p','l.l_pid = p.p_id','LEFT') 
            ->join('mk_user2 u','u.u_openid = l.l_uopenid','LEFT')
            ->join('mk_class c','c.c_id = p.p_classid','LEFT')
            ->join('mk_major m','m.m_id = p.p_maid','LEFT')
            ->where(function (Query $query) {
                $data = $this->request->param();
                if (!empty($data['uid'])) {
                    $query->where('p.p_id', intval($data['uid']));
                }

                if (!empty($data['keyword'])) {
                    $keyword = $data['keyword'];
                    $query->where('p.p_name|u.u_nickname|p.p_num|c.c_name', 'like', "%$keyword%");
                }
            })->order("u.u_openid DESC")
            ->paginate(10);
        $page = $playerarr->render();
        $this->assign('playerarr', $playerarr);
        $this->assign('page', $page);
        return $this->fetch(':log');
    }
}
