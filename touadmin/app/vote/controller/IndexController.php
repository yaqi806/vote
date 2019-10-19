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
class IndexController extends HomeBaseController
{
    public function index()
    {
    	$playerModel = new PlayerModel();
    	$playerarr = $playerModel->getAllplayer();
		$page = $playerarr->render();
		$this->assign('playerarr', $playerarr);
		$this->assign('page', $page);
        return $this->fetch(':index');
    }
    public function shenhe(){
    	$playerModel = new PlayerModel();
    	$playerarr = $playerModel->getAllplayer2();
		$page = $playerarr->render();
		$this->assign('playerarr', $playerarr);
		$this->assign('page', $page);
    	return $this ->fetch(':shenhe');
    }
    public function log(){
    	$playerModel = new PlayerModel();
    	$playerarr = $playerModel->getLogs();
    	$page = $playerarr->render();
    	$this->assign('playerarr', $playerarr);
		$this->assign('page', $page);
    	return $this ->fetch(':log');
    }
}
