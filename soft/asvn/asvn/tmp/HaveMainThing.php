<?php
	class HaveMainThing extends Model{
		public $table = 'warehouse_have_mainthing_header';
		public $noHvTable = 'warehouse_no_mainthing_header';
		public $warehouse_back_log = 'warehouse_back_log';
		public $goods_receipt = 'warehouse_goods_receipt';
		public $shopTable = 'shop';
		public $platformTable = 'platform';
		public $backGoodsTable = 'warehouse_have_mainthing_detail';
		public $nvbackGoodsTable = 'warehouse_no_mainthing_detail';
		public $orderDetailTable = 'order_detail';
		public $baseGoods = 'base_goods';
		public $baseSku = 'base_sku';
		public $tableRowsFiled = 'id,shop_id,tid,express_code,express_no,owner_id,back_express_no,back_express_code,back_warehouse_code,back_type,user_nick,mobile,order_no,m_thing_no,n_thing_no,refund_no,consignee,adtime,status,audit_status,is_mainthing,is_return_number,sender,is_split_single';
		public $logText = array();
		public $logArray = array();
		public $logStatus = array(
								'toexamine'=>'已审核',
								'tovoid'=>'已作废',
								'update'=>'编辑',
								'goods_update'=>'明细编辑',
								'processing'=>'处理中',
								'handle'=>'已处理',
								'back'=>'生成退货单',
								'change'=>'生成换货单',
								'rigister'=>'登记详情'
								);
		public $Operation = array(
							   '1'=>'已审核',
							   '2'=>'已审核',
							   '3'=>'已验收',
							   '4'=>'已验收',
							   '5'=>'作废',
							   '6'=>'部分验收',
							   );

		public function HaveRegister(){
			return $this->loadModel('Warehouse/HaveRegister');
		}

		public function ScanBack(){
			return $this->loadModel('Warehouse/ScanBack');
		}

		public function BusinessValue(){
			return $this->loadModel('Base/BusinessValue');
		}

		public function Stock(){
			return $this->loadModel('Stock/Stock');
		}

		public function listData($request)
		{
			$result = $this->_buildSql($request);
			$rowsAll = $this->db->getAll($result['sql'],$result['w_arr']);
	        $arr = array();
	        $platforms = $this->HaveRegister()->getPlateNames();
	        $shops = $this->HaveRegister()->getShopNames();
	        $warehouse = $this->HaveRegister()->getWarehouseNames();
	        $express = $this->HaveRegister()->getExpressNames();
	        $return_label = $this->ReturnLabelKeyList();

	       foreach ($rowsAll as $key => $rows) {

	        	$rows['platform_name'] = isset($platforms[$rows['platform_code']]) ? $platforms[$rows['platform_code']] : '';
	        	$rows['express_name'] = isset($express[$rows['express_code']]) ? $express[$rows['express_code']] : '';
	        	$rows['warehouse_name'] = isset($warehouse[$rows['warehouse_code']]) ? $warehouse[$rows['warehouse_code']] : '';
	        	$rows['back_warehouse_name'] = isset($warehouse[$rows['back_warehouse_code']]) ? $warehouse[$rows['back_warehouse_code']] : '';
	        	$rows['back_express_name'] = isset($express[$rows['back_express_code']]) ? $express[$rows['back_express_code']] : '';
	        	$rows['shop_name'] = isset($shops[$rows['shop_id']]) ? $shops[$rows['shop_id']] : '';
	        	$rows['return_label'] = isset($return_label[$rows['return_label']]) ? $return_label[$rows['return_label']]['value_name'] : '';
	        	$rows['consignee'] = $rows['consignee'];
				$arr[] = $rows;
	        }

	        return array('rows' => (empty($arr) ? array() : $arr), 'total' => $result['total']);

		}

	    /**
	     * 创建sql
	     * Enter description here ...
	     */
	    protected function _buildSql($request)
	    {
	    	$request['rows'] = !isset($request['rows']) && empty($request['rows']) ? 10 : $request['rows'];
		    $request['page'] = !isset($request['page']) && empty($request['page']) ? 1 : $request['page'];
	        $where = " where 1";
	        $w_arr = array();
			$in_table = "";

	        if (!empty($request['tid'])) {
				$in_table = ",{$this->backGoodsTable} AS bg";
	           $where .= " and m.order_no=bg.order_no and bg.tid=:tid";
	           $w_arr[':tid']=$request['tid'];
	        }
	        if (!empty($request['order_no'])) {
	           $where .= " and m.order_no=:order_no";
	           $w_arr[':order_no']=$request['order_no'];
	        }
	        if (!empty($request['m_thing_no'])) {
	           $where .= " and m.m_thing_no=:m_thing_no";
	           $w_arr[':m_thing_no']=$request['m_thing_no'];
	        }
	        if (!empty($request['back_express_no'])) {
	           $where .= " and m.back_express_no like :back_express_no";
	           $w_arr[':back_express_no']=$request['back_express_no']."%";
	        }
	        if (!empty($request['user_nick'])) {
	           $where .= " and m.user_nick=:user_nick";
	           $w_arr[':user_nick']=$request['user_nick'];
	        }
	        if (!empty($request['consignee'])) {
	           $where .= " and m.consignee=:consignee";
	           $w_arr[':consignee']=$request['consignee'];
	        }
	        if (!empty($request['express_code'])) {
	           $where .= " and m.express_code=:express_code";
	           $w_arr[':express_code']=$request['express_code'];
	        }
	        if (!empty($request['warehouse_code'])) {
	           $where .= " and m.warehouse_code=:warehouse_code";
	           $w_arr[':warehouse_code']=$request['warehouse_code'];
	        }
	        if (!empty($request['stratTime'])) {
	           $where .= " and m.stratTime>=:stratTime";
	           $w_arr[':stratTime']=$request['stratTime'];
	        }
	        if (!empty($request['endTime'])) {
	           $where .= " and m.endTime<=:endTime";
	           $w_arr[':endTime']=$request['endTime'];
	        }
	    	if (!empty($request['addtime_start'])) {
	           $where .= " and m.adtime>=:addtime_start";
	           $w_arr[':addtime_start']=$request['addtime_start'];
	        }
	        if (!empty($request['addtime_end'])) {
	           $where .= " and m.adtime<=:addtime_end";
	           $w_arr[':addtime_end']=$request['addtime_end'];
	        }
			if (!empty($request['receiving_time_start'])) {
	           $where .= " and m.receiving_time>=:receiving_time_start";
	           $w_arr[':receiving_time_start']=$request['receiving_time_start'];
	        }
	        if (!empty($request['receiving_time_end'])) {
	           $where .= " and m.receiving_time<=:receiving_time_end";
	           $w_arr[':receiving_time_end']=$request['receiving_time_end'];
	        }
	        
	        if (!empty($request['platform_code'])) {
	           $where .= " and m.platform_code=:platform_code";
	           $w_arr[':platform_code']=$request['platform_code'];
	        }
	        if (!empty($request['shop_ids'])) {
		       $shop_ids = array_map("intval", explode(',', $request['shop_ids']));
			   $shop_ids = implode(',',$shop_ids);
	           $where .= " and m.shop_id IN ({$shop_ids})";
	        }
        	if(isset($request['audit_status']) && $request['audit_status']!=""){
        		$where .= " and m.audit_status=:audit_status";
        		$w_arr[':audit_status']=$request['audit_status'];
        	}
        	if(isset($request['status']) && $request['status']!=""){
        		$where .= " and m.status=:status";
        		$w_arr[':status']=$request['status'];
        	}
        	if(isset($request['is_scan']) && $request['is_scan'] !=""){
        		$where .= " and m.is_scan=:is_scan";
        		$w_arr[':is_scan']=isset($request['is_scan']) ? $request['is_scan'] : '';
        	}
        	if(!empty($request['return_label'])){
        		$where .= " and m.return_label=:return_label";
        		$w_arr[':return_label']=$request['return_label'];
        	}

        	$where .= buildCommonWhere($request,array('shop' => array('field'=>'m.shop_id')));

        	$page_size = $request['rows'];

	        $sql = "SELECT count(m.id) FROM {$this->table} AS m{$in_table} {$where} ";
	        $total = $this->getDb()->getOne($sql,$w_arr);
	        $sql = "SELECT m.id,m.platform_code,m.shop_id,m.owner_id,m.tid,m.express_code,m.express_no,m.back_express_code,m.back_express_no,m.back_warehouse_code,m.warehouse_code,m.back_type,m.m_thing_no,m.status,m.audit_status,m.solve_times,m.user_nick,m.order_no,m.is_scan,m.is_return_number,m.consignee,m.adtime,m.return_label,m.receiving_time FROM {$this->table} AS m{$in_table} {$where} AND m.id<=(SELECT id FROM {$this->table} ORDER BY id DESC LIMIT ".($request['page']-1)*$page_size.",1) GROUP BY m.id ORDER BY m.id DESC LIMIT {$page_size}";
			return array('sql' => $sql, 'total'=>$total,'w_arr'=>$w_arr);
		}

		/*商品登记列表*/
		public function listDetailsData($request)
		{
			$result = $this->_buildDetailsSql($request);
	        $res = $this->db->selectLimitArr($result['sql'], $result['total'], $result['page'], $result['page_size'], $result['w_arr']);
	        $return_reason = $this->HaveRegister()->ReturnReason();
	        $data = $this->getHaveMainThing($request['register_id']);
	        $newskus = $this->loadModel('Base/Sku')->getSkus(null, $res, 'owner_id,sku,goods_no,sku_attr_vals', true);

	        foreach ($res as $key => $rows) {

	        	$rows['audit_status'] = isset($data[0]['audit_status']) ? $data[0]['audit_status'] : '';
	        	$rows['return_reason'] = isset($return_reason[$rows['return_reason']]['value_name']) ? $return_reason[$rows['return_reason']]['value_name'] : '';
	        	$rows['sku_attr_vals'] = isset($newskus[$rows['sku'].'_'.$rows['owner_id']]) ? $newskus[$rows['sku'].'_'.$rows['owner_id']]['sku_attr_val_names'] : '';
	        	$arr[] = $rows;
	        }

	        return array('rows' => (empty($arr) ? array() : $arr), 'total' => $result['total']);

		}

	    /**
	     * 创建登记详情sql
	     * Enter description here ...
	     */
	    protected function _buildDetailsSql($request)
	    {
	    	$request['rows'] = !isset($request['rows']) && empty($request['rows']) ? 10 : $request['rows'];
		    $request['page'] = !isset($request['page']) && empty($request['page']) ? 1 : $request['page'];
	        $where = " where 1 ";
	        $w_arr = array();
	        if (!empty($request['register_id'])) {
	           $where .= " and bg.register_id=".$request['register_id'];
	           $w_arr[':register_id'] = $request['register_id'];
	        }

	        $sql = "SELECT count(id) FROM {$this->backGoodsTable} AS bg {$where} ";
	        $total = $this->getDb()->getOne($sql,$w_arr);
	        $sql = "SELECT bg.id,bg.tid,bg.order_no,bg.sku,bg.goods_no,bg.num,bg.receipt_num,bg.return_reason,bg.ck_remarks,bg.kf_remarks,bg.is_gift,bg.owner_id,g.goods_name FROM {$this->backGoodsTable} AS bg,{$this->baseGoods} AS g {$where} AND bg.goods_id=g.goods_id ORDER BY solve_times DESC";
	        return array('sql' => $sql, 'total'=>$total, 'page'=>$request['page'], 'page_size'=>$request['rows'],'w_arr'=>$w_arr);
		}

		/*收货列表*/
		public function listReceiptData($request)
		{
			$result = $this->_buildReceiptSql($request);
			if(!$result){
				return array('rows' => array(), 'total' => 0);
			}
	        $res = $this->db->selectLimitArr($result['sql'], $result['total'], $result['page'], $result['page_size'], $result['w_arr']);
	        $newskus = $this->loadModel('Base/Sku')->getSkus(null, $res, 'owner_id,sku,goods_no,sku_attr_vals', true);

	        $arr = array();
	        foreach ($res as $key => $rows) {
	        	$rows['goods_no'] = isset($newskus[$rows['sku'].'_'.$rows['owner_id']]) ? $newskus[$rows['sku'].'_'.$rows['owner_id']]['goods_no'] : '';
	        	$goods_name = !empty($rows['goods_no']) ? $this->loadModel('Base/Goods')->getGoodsByCode($rows['goods_no'],$rows['owner_id']) : '';
				$rows['goods_name'] = !empty($goods_name) ? $goods_name[0]['goods_name'] : '';
				$rows['sku_attr_vals'] = isset($newskus[$rows['sku'].'_'.$rows['owner_id']]) ? $newskus[$rows['sku'].'_'.$rows['owner_id']]['sku_attr_val_names'] : '';
	        	$arr[] = $rows;
	        }

	        return array('rows' => (empty($arr) ? array() : $arr), 'total' => $result['total']);

		}

	    /**
	     * 创建收货详情sql
	     * Enter description here ...
	     */
	    protected function _buildReceiptSql($request)
	    {
	    	$request['rows'] = !isset($request['rows']) && empty($request['rows']) ? 10 : $request['rows'];
		    $request['page'] = !isset($request['page']) && empty($request['page']) ? 1 : $request['page'];
	        $where = " where 1 ";
	        $w_arr = array();
	        if (!empty($request['register_id'])) {
				$rows = $this->getHaveMainThing($request['register_id']);
				if($rows[0]['audit_status'] == 2 || $rows[0]['audit_status'] == 4){
					$register_no = $rows[0]['n_thing_no'];
				}else{
					$register_no = $rows[0]['m_thing_no'];
				}
				$where .= " and bg.register_no='".$register_no."'";
				$w_arr[':register_no']=$register_no;

	        }else{
					return false;
			}
	        $sql = "SELECT count(id) FROM {$this->goods_receipt} AS bg {$where} ";
	        $total = $this->getDb()->getOne($sql,$w_arr);
	        $sql = "SELECT bg.id,bg.sku,bg.num,bg.r_time,bg.owner_id FROM {$this->goods_receipt} AS bg {$where}";
	        return array('sql' => $sql, 'total'=>$total, 'page'=>$request['page'], 'page_size'=>$request['rows'],'w_arr'=>$w_arr);
		}

		/*日志列表*/
		public function listlogData($request)
		{
			$result = $this->_buildlogSql($request);
	        $res = $this->db->selectLimitArr($result['sql'], $result['total'], $result['page'], $result['page_size'], $result['w_arr']);
			$action_map = MC('WmsRecordModel','App/Model/Wms')->get_action_map();
	        foreach ($res as $key => $rows) {
				if (isset($action_map[$rows['type']])){
					$rows['type']=$action_map[$rows['type']];
				}else{
					$rows['type']=__($this->logStatus[$rows['type']]);
				}
				$rows['user_name'] = $rows['user_name'];
	        	$arr[] = $rows;
	        }

	        return array('rows' => (empty($arr) ? array() : $arr), 'total' => $result['total']);

		}

	    /**
	     * 创建日志sql
	     * Enter description here ...
	     */
	    protected function _buildlogSql($request)
	    {
	    	$request['rows'] = !isset($request['rows']) && empty($request['rows']) ? 10 : $request['rows'];
		    $request['page'] = !isset($request['page']) && empty($request['page']) ? 1 : $request['page'];
	        $where = " where 1 ";
	        $w_arr = array();
	        if (!empty($request['register_id'])) {
	           $where .= " and register_id=:register_id";
	           $w_arr[':register_id']=$request['register_id'];
	        }

	        $sql = "SELECT count(id) FROM {$this->warehouse_back_log} AS s {$where} ";
	        $total = $this->getDb()->getOne($sql,$w_arr);
	        $sql = "SELECT g.id,g.user_name,g.type,g.created,g.text FROM {$this->warehouse_back_log} AS g {$where} ORDER BY created DESC";
	        return array('sql' => $sql, 'total'=>$total, 'page'=>$request['page'], 'page_size'=>$request['rows'],'w_arr'=>$w_arr);
		}

		/*详情信息*/
		public function HaveMainThingDetails($params){
			if(!$params){
				$this->setError(1,__("数据加载失败"));
				return false;
			}
			$w_arr[':register_id']=$params['register_id'];
			$sql = "SELECT {$this->tableRowsFiled} FROM {$this->table} WHERE id=:register_id LIMIT 1";
			$rows = $this->db->getRow($sql,$w_arr);

			$warehouse = $this->HaveRegister()->getWarehouseNames();
	        $express = $this->HaveRegister()->getExpressNames();
			$rows['express_name'] = isset($express[$rows['express_code']]) ? $express[$rows['express_code']] : '';
        	$rows['back_warehouse_name'] = isset($warehouse[$rows['back_warehouse_code']]) ? $warehouse[$rows['back_warehouse_code']] : '';
        	$rows['back_express_name'] = isset($express[$rows['back_express_code']]) ? $express[$rows['back_express_code']] : '';

			return $rows;
		}

		/*审核*/
		public function ToExamine($params){
			if(!$params){
				$this->setError(1,__('审核失败'));
				return false;
			}
			$data = $this->getHaveMainThing($params['toid']);

			$data_detail = $this->getRegGoodsNumber($data[0]['m_thing_no'],'HZJ');
			if(empty($data_detail)){
				$this->setError(1,__('明细为空,审核失败'));
				return false;
			}

			try {
				$this->db->beginTransaction();

					$info = array('shop_id'=>$data[0]['shop_id'],'owner_id'=>$data[0]['owner_id']);
					$rel = MC('WmsEntryModel','App/Model/Wms')->add($data[0]['m_thing_no'],'INXS',$data[0]['back_warehouse_code'],$info);
					if(!$rel){
						$error = MC('WmsEntryModel','App/Model/Wms')->getError();
						if($error['code'] !=-10000){
							$this->setError(1,$error['msg']);
							$this->db->rollback();
							return false;
						}

					}

					$rel = $this->db->update($this->table,array('audit_status'=>$params['audit_status']),array('id'=>$params['toid']));
					if(!$rel){
						$this->setError(1,__('审核失败'));
						$this->db->rollback();
						return false;
					}

					if(isset($params['audit_status']) && $data[0]['audit_status'] !=$params['audit_status']){
						if(isset($this->Operation[$data[0]['audit_status']]) && isset($this->Operation[$params['audit_status']])){
							$this->logText[]=sprintf(__('状态 %s 修改为 %s '),__($this->Operation[$data[0]['audit_status']]),__($this->Operation[$params['audit_status']]));
						}
					}

					$this->logArray['type']='toexamine';
					$this->logArray['text']=$this->logText;
				$this->db->commit();
				return true;
			} catch (Exception $e) {
				$this->db->rollback();
				$this->setError(1,__('审核失败,').$e->getMessage());
				return false;
			}
		}

		/*操作检测*/
		public function checkOperation($params,$type=''){
			if(!isset($params['audit_status'])){
				$this->setError(1,__('操作失败'));
				return false;
			}

			if($params['audit_status'] !=0){
				$this->setError(1,sprintf(__('当前单据( %s ) %s ,操作失败'),$params['m_thing_no'],__($this->Operation[$params['audit_status']])));
				return false;
			}
			return true;
		}

		/*作废*/
		public function HvToVoid($params){
			if(!$params){
				$this->setError(1,__('操作失败'));
				return false;
			}
			$data = $this->getHaveMainThing($params['toid']);
			if($data[0]['audit_status'] == 6){
				$this->setError(1,__('部分验收不允许操作'));
				return false;
			}
			if($data[0]['audit_status'] == 3){
				$this->setError(1,__('已验收不允许操作'));
				return false;
			}

			/*检测是否已生成退换货单*/
			if($data[0]['is_return_number'] !=0){
				$rel = MC('RefundOpModel','App/Model/Order')->refund_cancel_by_have_mainthing($data[0]['refund_no']);
				if(!$rel){
					$msg = MC('RefundOpModel','App/Model/Order')->getErrorMsg();
					$this->setError(1,$msg);
					$this->db->rollback();
					return false;
				}
			}

			try {
				$this->db->beginTransaction();
					/*拆分单不取消WMS*/
					if($data[0]['is_split_single'] !=1){

						/*有主件*/
						if($data[0]['audit_status'] == 1){
							$order_no = $data[0]['m_thing_no'];
						}

						/*无主件已审核转有主件*/
						if($data[0]['audit_status'] == 2){
							$order_no = $data[0]['n_thing_no'];
						}
						/*取消已上传中间件*/
						if($data[0]['audit_status'] == 1 || $data[0]['audit_status'] == 2){
							$wms_flag = MC('WmsEntryModel','App/Model/Wms')->cancel($order_no,'INXS',$data[0]['back_warehouse_code']);
							if ($wms_flag === false){
								$err = MC('WmsEntryModel','App/Model/Wms')->getError();
								if($err['code']!=-10000){
									$this->setError(1,$err['msg']);
									$this->db->rollback();
									return false;
								}

							}
						}

					}

					$rel = $this->db->update($this->table,array('audit_status'=>4,'is_to_void'=>1),array('id'=>$params['toid']));
					if(!$rel){
						$this->setError(1,__('操作失败'));
						$this->db->rollback();
						return false;
					}
					$rel = $this->db->update($this->backGoodsTable,array('is_to_void'=>1),array('register_id'=>$params['toid']));
					if(!$rel){
						$this->setError(1,__('操作失败'));
						$this->db->rollback();
						return false;
					}
					if($data[0]['is_mainthing'] == 1){
						/*检测是否对接WMS*/
						// $isWms = $this->Stock()->getWmsConfig($noData[0]['back_warehouse_code']);
						$audit_status = 3;
						$rel = $this->db->update($this->noHvTable,array('status'=>1,'audit_status'=>$audit_status),array('no_master_number'=>$data[0]['n_thing_no']));
						if(!$rel){
							$this->setError(1,__('操作失败'));
							$this->db->rollback();
							return false;
						}
					}
					$this->logText[]=sprintf(__('有主件 %s 已作废'),$data[0]['m_thing_no']);
					$this->logArray['type']='tovoid';
					$this->logArray['text']=$this->logText;
				$this->db->commit();
				return true;

			} catch (Exception $e) {
				$this->db->rollback();
				$this->setError(1,__('操作失败'));
				return false;
			}

		}


		/*删除有主件登记单*/
		public function HaveMainThingDelete($ids){
			if(!$ids){
				$this->setError(1,__('操作失败'));
				return false;
			}
			$data = $this->getHaveMainThing($ids);
			foreach ($data as $key => $value) {
				$ck = $this->checkOperation($value,'delete');
				if(!$ck){
					$msg = $this->getErrorMsg();
					$this->setError(1,$msg);
					return false;
				}
			}

			$sids = array_map("intval", explode(',', $ids));
			$sids = implode(',',$sids);

			if(stripos($ids,',')){
				$c_where = "id IN ({$sids})";
				$g_where = "register_id IN ({$sids})";
			}else{
				$c_where = "id={$sids}";
				$g_where = "register_id={$sids}";
			}
			try {
				$this->db->beginTransaction();
					$sql = "DELETE FROM {$this->table} WHERE {$c_where}";
					$rel = $this->db->query($sql);
					if(!$rel){
						$this->setError(1,__('操作失败'));
						$this->db->rollback();
						return false;
					}
					$sql = "DELETE FROM {$this->backGoodsTable} WHERE {$g_where}";
					$rel = $this->db->query($sql);
					if(!$rel){
						$this->setError(1,__('操作失败'));
						$this->db->rollback();
						return false;
					}

				$this->db->commit();
				return true;
			} catch (Exception $e) {
				$this->db->rollback();
				$this->setError(1,__('操作失败'));
				return false;
			}
		}
		/*删除有主件登记单明细*/
		public function HaveDetailsDelete($params){
			if(!$params){
				$this->setError(1,__('操作失败'));
				return false;
			}

			$data = $this->getHaveMainThing($params['register_id']);
			$ck = $this->checkOperation($data[0],'delete');

			if(!$ck){
				$msg = $this->getErrorMsg();
				$this->setError(1,$msg);
				return false;
			}

			try {
				$this->db->beginTransaction();
					$limit = 5000;
					$ids = array_map("intval", explode(',', $params['ids']));
					$ids = implode(',',$ids);
					while (true) {
						$sql = "DELETE FROM {$this->backGoodsTable} WHERE id IN ({$ids}) LIMIT {$limit}";
						$rel = $this->db->execute($sql);

						if(!$rel || $rel<$limit){
							break;
						}
					}
				$this->db->commit();
				return true;
			} catch (Exception $e) {
				$this->db->rollback();
				$this->setError(1,__('操作失败'));
				return false;
			}
		}
		/*编辑*/
		public function UpdateWarehouseEdit($params){
			if(!$params){
				$this->setError(1,__('操作失败'));
				return false;
			}
			$id = $params['whid'];

			$data = $this->getHaveMainThing($id);
			$ck = $this->checkOperation($data[0]);

			if(!$ck){
				$msg = $this->getErrorMsg();
				$this->setError(1,$msg);
				return false;
			}

			if(isset($params['back_express_code']) && $data[0]['back_express_code'] !=$params['back_express_code']){
				$this->logText[]=sprintf(__('快递CODE %s 修改为 %s '),$data[0]['back_express_code'],$params['back_express_code']);
			}
			if(isset($params['back_warehouse_code']) && $data[0]['back_warehouse_code'] !=$params['back_warehouse_code']){
				$this->logText[]=sprintf(__('仓库code %s 修改为 %s '),$data[0]['back_warehouse_code'],$params['back_warehouse_code']);
			}
			if(isset($params['back_type']) && $data[0]['back_type'] !=$params['back_type']){
				$back_type = array('1'=>'退','2'=>'换');
				$this->logText[]=sprintf(__('退回类型 %s 修改为 %s '),$back_type[$data[0]['back_type']],$back_type[$params['back_type']]);
			}
			if(isset($params['back_express_no']) && $data[0]['back_express_no'] !=$params['back_express_no']){
				$ck_ex_no = $this->ScanBack()->checkExpressNumber($params['back_express_no']);
				if(!$ck_ex_no){
					$msg = $this->ScanBack()->getErrorMsg();
					$this->setError(1,$msg);
					return false;
				}
				$this->logText[]=sprintf(__('寄回快递单号 %s 修改为 %s '),$data[0]['back_express_no'],$params['back_express_no']);
			}
			$this->logArray['type']='update';
			$this->logArray['text']=$this->logText;
			unset($params['whid']);
			try {
				$this->db->beginTransaction();
					$rel = $this->db->update($this->table,$params,array('id'=>$id));
				$this->db->commit();
				return true;
			} catch (Exception $e) {
				$this->db->rollback();
				$this->setError(1,__('操作失败'));
				return false;
			}
		}

		/*明细编辑*/
		public function UpdateGoodsEdit($params){
			if(!$params){
				$this->setError(1,__('操作失败'));
				return false;
			}
			$id = $params['wid'];

			$data = $this->getDetails($id);

			$hv_row = $this->getOrderNoHvMainThing($data[0]['m_thing_no'],'HZJ');
			if($hv_row['audit_status']>=1){
				$this->setError(1,sprintf(__("当前有主件(%s)已审核(已验收),不允许操作"),$data[0]['m_thing_no']));
				return false;
			}

			/*检测数量*/
			if(isset($params['num']) && $data[0]['num'] !=$params['num']){
				$od_num = $this->HaveRegister()->getOrderGoodsNumber($data[0]['order_no']);
				if($params['num'] >$od_num){
					$this->setError(1,sprintf(__("当前有主件(%s)登记数量大于订单数量,不允许操作"),$data[0]['m_thing_no']));
					return false;
				}
				$gs_num = $this->HaveRegister()->getRegisterGoodsNumber($data[0]['order_no']);
				$back_total = $gs_num-$data[0]['num']+$params['num'];

				if($back_total >$gs_num){
					$this->setError(1,sprintf(__('交易号 %s 商品数量为: %s ,已登记数量: %s ,当前登记总数量: %s ,操作失败'),$data['tid'],$od_num,$gs_num,$back_total));
					return false;
				}
				$this->logText[]=sprintf(__('寄回数量 %s 修改为 %s '),$data[0]['num'],$params['num']);
			}

			/*获取全局参数*/
			$config = $this->loadModel('Home/Config')->getConfig('is_check_sku');
			if($config == 1){
				$orderSkus = $this->getOrderDetailSku($data[0]['order_no']);
				if(empty($orderSkus['skus'])){
					$this->setError(1,sprintf(__("当前订单(%s)没有明细"),$data[0]['order_no']));
					return false;
				}
				if(!in_array($params['sku'],$orderSkus['skus'])){
					$this->setError(1,sprintf(__("当前SKU(%s)与原订单(%s)不匹配"),$params['sku'],$data[0]['order_no']));
					return false;
				}
			}

			$this->logText[] = sprintf(__('商品( %s )'),$data[0]['sku']);
			if(isset($params['return_reason']) && $data[0]['return_reason'] !=$params['return_reason']){
				$return_reason = $this->HaveRegister()->ReturnReason();
				$this->logText[]=sprintf(__('寄回原因状态 %s 修改为 %s '),$return_reason[$data[0]['return_reason']][['value_name']],$return_reason[$params['return_reason']][['value_name']]);
			}
			if(isset($params['sku']) && $data[0]['sku'] !=$params['sku']){
				$this->logText[]=sprintf(__('SKU %s 修改为 %s '),$data[0]['sku'],$params['sku']);
			}
			
			$goods_remarks_type = $params['stype'] == 'ck'? 'ck_remarks' : 'kf_remarks';
			$this->logText[]=sprintf(__('备注: %s '),$params[$goods_remarks_type]);

			$this->logArray['type']='goods_update';
			$this->logArray['text']=$this->logText;
			unset($params['wid']);
			unset($params['stype']);
			unset($params['register_id']);
			$params = $this->loadModel('Home/FieldSettingsView')->SettingsDataHandle($params,0);

			try {
				$this->db->beginTransaction();
					$rel = $this->db->update($this->backGoodsTable,$params,array('id'=>$id));
				$this->db->commit();
				return true;
			} catch (Exception $e) {
				$this->db->rollback();
				$this->setError(1,__('操作失败'));
				return false;
			}
		}

		/*根据订单号获取明细SKU、数量集合*/
		public function getOrderDetailSku($order_no){
			if(!$order_no){
				return false;
			}
			$sql = "SELECT sku,num FROM {$this->orderDetailTable} WHERE order_no='{$order_no}'";
			$rows = $this->db->getAll($sql);
			$skus = array();
			$sku_nums = array();
			if(!empty($rows)){
				foreach($rows as $k=>$v){
					$skus[] = $v['sku'];
					$sku_nums[$v['sku']] = $v['num'];
				}
			}
			return array('skus'=>$skus,'sku_nums'=>$sku_nums);
		}

		/*客服编辑*/
		public function UpdateService($params){
			if(!$params){
				return false;
			}
			$id = $params['svid'];
			$data = $this->getHaveMainThing($id);

			if(isset($params['status']) && $data[0]['status'] !=$params['status']){
				$status = array('0'=>'未处理','1'=>'处理中','2'=>'已处理');
				$this->logText[]=sprintf(__('处理状态 %s 修改为 %s '),$status[$data[0]['status']],$status[$params['status']]);
			}

			unset($params['svid']);
			$params['solve_times'] = date("Y-m-d H:i:s",time());
			try {
				$this->db->beginTransaction();
					$rel = $this->db->update($this->table,$params,array('id'=>$id));
				$this->db->commit();

				$this->logArray['type']=$params['status'] == 1 ? 'processing' : 'handle';
				$this->logArray['text']=$this->logText;
				return true;
			} catch (Exception $e) {
				$this->db->rollback();
				return false;
			}
		}

		/*根据ID获取登记单信息*/
		public function getHaveMainThing($dids){
			if(!$dids){
				return false;
			}
			$ids = array_map("intval", explode(',', $dids));
			$ids = implode(',',$ids);

			if(stripos($ids,',')){
				$num = substr_count($ids,',')+1;
				$where = "id IN ({$ids}) LIMIT {$num}";
			}else{
				$where = "id={$ids} LIMIT 1";
			}
			$sql = "SELECT {$this->tableRowsFiled} FROM {$this->table} WHERE {$where}";
			$result = $this->db->getAll($sql);

			return $result;
		}
		/*根据oms订单号获取有主件详情*/
		public function getOrderNoHvthing($order_no){
			if(!$order_no){
				$this->setError(1,__('无效的oms订单号'));
				return false;
			}
			$order_arr = array();
			if(is_array($order_no)){
				foreach($order_no as $k=>$v){
					$order_arr[$v]=$v;
				}
				$order_nos = "'".implode("','",$order_arr)."'";
			}else{
				if(strpos($order_no,',')){
					$order_nos = explode(',',$order_no);
					foreach($order_nos as $k=>$v){
						$order_arr[$v]=$v;
					}
					$order_nos = "'".implode("','",$order_arr)."'";
				}else{
					$order_nos="'".$order_no."'";
				}
			}
			$sql = "SELECT {$this->tableRowsFiled} FROM {$this->table} WHERE order_no IN ({$order_nos}) AND is_to_void=0";
			$rows = $this->db->getAll($sql);

			return $rows;
		}
		/*根据有主件单号获取明细*/
		public function getHvDetails($order_no){
			if(!$order_no){
				return false;
			}
			$order_arr = array();
			if(is_array($order_no)){
				foreach($order_no as $k=>$v){
					$order_arr[$v]=$v;
				}
				$order_nos = "'".implode("','",$order_arr)."'";
			}else{
				if(strpos($order_no,',')){
					$order_nos = explode(',',$order_no);
					foreach($order_nos as $k=>$v){
						$order_arr[$v]=$v;
					}
					$order_nos = "'".implode("','",$order_arr)."'";
				}else{
					$order_nos="'".$order_no."'";
				}
			}
			
			$sql = "SELECT id,m_thing_no,goods_no,sku,num FROM {$this->backGoodsTable} WHERE m_thing_no IN ({$order_nos}) AND is_to_void=0";
			$rows = $this->db->getAll($sql);

			return $rows;
		}

		/*根据ID获取明细*/
		public function getDetails($dids){
			if(!$dids){
				return false;
			}
			$ids = array_map("intval", explode(',', $dids));
			$ids = implode(',',$ids);

			if(stripos($ids,',')){
				$num = substr_count($ids,',')+1;
				$where = "id IN ({$ids}) LIMIT {$num}";
			}else{
				$where = "id={$ids} LIMIT 1";
			}
			$sql = "SELECT id,num,sku,order_no,m_thing_no,return_reason,ck_remarks,kf_remarks,custom_fields_1,custom_fields_2,custom_fields_3,custom_fields_4,custom_fields_5,custom_fields_6 FROM {$this->backGoodsTable} WHERE {$where}";
			$result = $this->db->getAll($sql);

			return $result;
		}

		/*根据SKU、货主ID获取商品信息*/
		public function getOneGoods($sku,$owner_id){
			if(!$sku || !$owner_id){
				return false;
			}
			$w_arr[':sku']=$sku;
			$w_arr[':owner_id']=$owner_id;
			$sql = "SELECT goods_id FROM {$this->baseSku} WHERE sku=:sku AND owner_id=:owner_id LIMIT 1";
			$rows = $this->db->getRow($sql,$w_arr);

			return $rows;
		}

		/*检测是否已生成退换货单
		*$order_no 单据号
		*$ck_type 0 有主件检测 1无主件检测
		*/
		public function checkReturnNumber($order_no,$ck_type=0){
			if(!$order_no){
				$this->setError(1,__('请填写正确的单据号'));
				return false;
			}
			$ck_filed = $ck_type == 0 ?'m_thing_no' : 'n_thing_no';
			$w_arr[':order_no'] = $order_no;
			$sql = "SELECT id,tid,refund_no FROM {$this->table} WHERE {$ck_filed}=:order_no AND is_return_number!=0 LIMIT 1";
			$rows = $this->db->getRow($sql,$w_arr);

			return empty($rows) ? 'empty' : $rows;
		}

		/*根据单据号获取SKU、数量集合*/
		public function getRegisterSkus($order_no){
			if(!$order_no){
				return false;
			}
			$w_arr[':order_no'] = $order_no;
			$sql = "SELECT sku,num FROM {$this->backGoodsTable} WHERE m_thing_no=:order_no";
			$result = $this->db->getAll($sql,$w_arr);

			return $result;
		}

		/*根据ID获取SKU、数量集合*/
		public function getRefundSkus($register_id,$back_type){
			if(!$register_id){
				return false;
			}
			$w_arr[':register_id'] = $register_id;
			$sql = "SELECT plat_tid,sku,num FROM {$this->backGoodsTable} WHERE register_id=:register_id";
			$rows = $this->db->getAll($sql,$w_arr);
			$data = array();
			if($rows){
				foreach ($rows as $k => $v) {
					$v['refund_reason'] = $back_type;
					$data[]=$v;
				}
			}

			return $data;
		}
		/*退换单
		*refund_type 退单 20 换货单 30
		*/
		public function ReturnGoods($id,$refund_type){
			if(!$id || !$refund_type){
				$this->setError(1,__('操作失败(退换单类型错误)'));
				return false;
			}
			$rows = $this->getHaveMainThing($id);

			$order_no = $rows[0]['order_no'];
			$m_thing_no = $rows[0]['audit_status'] == 2 ? $rows[0]['n_thing_no'] : $rows[0]['m_thing_no'];
			$return_number = $refund_type == 20 ? 1 : 2;
			$refund_info = array('refund_from'=>1,'m_thing_no'=>$m_thing_no,'refund_type'=>$refund_type,'warehouse_code'=>$rows[0]['back_warehouse_code']);
			$refund_detail=$this->getRefundSkus($id,$rows[0]['back_type']);
			try {
				$this->db->beginTransaction();
				$ret = MC('RefundOpModel','App/Model/Order')->create_refund($order_no,$refund_info,$refund_detail);
				if(!$ret){
					$msg = MC('RefundOpModel','App/Model/Order')->getError();
					$this->setError(1,$msg['msg']);
					$this->db->rollback();
					return false;
				}
				$rel = $this->db->update($this->table,array('is_return_number'=>$return_number,'refund_no'=>$ret['refund_no']),array('id'=>$id));
				if(!$rel){
					$this->setError(1,__('操作失败(主件退换单号更新失败)'));
					$this->db->rollback();
					return false;
				}
				$logtype = $refund_type == 20 ? 'back' : 'change';
				$this->logText[] = $refund_type == 20 ? __('生成退货单') : __('生成换货单');

				$this->logArray['type']=$logtype;
				$this->logArray['text']=$this->logText;
				$this->db->commit();
				return true;

			} catch (Exception $e) {
				$this->db->rollback();
				$this->setError(1,__('操作失败'));
				return false;
			}
		}

		/*退单生成登记单*/
		public function RefundRegister($order,$user_name){
			if(!$order){
				$this->setError(1,__('操作失败'));
				return false;
			}

			/*是否已生成登记单*/
			$refund_type = !empty($order['refund_type']) ? $order['refund_type'] == 20 ? 1 : ($order['refund_type'] == 30 ? 2 : 0) : 0;
			$refund_no = !empty($order['refund_no']) ? $order['refund_no'] : '';
			$back_warehouse_code = !empty($order['warehouse_code']) ? $order['warehouse_code'] : '';

			$re_data = $this->checkOmsOrderRegister($order['order_no'],$refund_type);

			if(!empty($re_data)){
				$this->db->update($this->table,array('refund_no'=>$refund_no),array('id'=>$data['id']));
				return array('m_thing_no'=>$re_data['m_thing_no']);
			}

			$goodsNum = $order['goods_total'] ? $order['goods_total'] : 0;
			$already_back_total = $this->HaveRegister()->getRegisterGoodsNumber($order['order_no']);
			$back_total=$already_back_total;
			foreach ($order['detail'] as $k => $v) {
				$back_total+= $v['num'];
			}

			if($back_total >$goodsNum){
				$this->setError(1,sprintf(__('商品数量为: %s ,已登记数量: %s ,当前总数量: %s ,操作失败'),$goodsNum,$already_back_total,$back_total));
				return false;
			}

			$check = $this->loadModel('Home/Config')->getConfig('is_warehouse_mainthing');
			/*有主件信息*/
			$data['platform_code'] = !empty($order['platform_code']) ? $order['platform_code'] : '';
			$data['plat_tid']= $data['platform_code'].'_'.$order['tid'];
			$data['shop_id'] = !empty($order['shop_id']) ? $order['shop_id'] : '';
			$data['order_no'] = !empty($order['order_no']) ? $order['order_no'] : '';
			$data['refund_no'] = $refund_no;
			$data['tid'] = !empty($order['tid']) ? $order['tid'] : '';
			$data['back_type'] = $refund_type;
			$data['is_return_number'] = $data['back_type'];
			$data['back_warehouse_code'] = $back_warehouse_code;
			$data['user_nick'] = !empty($order['user_nick']) ? $order['user_nick'] : '';
			$data['consignee'] = !empty($order['consignee']) ? $order['consignee'] : '';
			$data['sender'] = !empty($order['refund_person']) ? $order['refund_person'] : '';
			$data['phone'] = !empty($order['phone']) ? $order['phone'] : '';
			$data['mobile'] = !empty($order['mobile']) ? $order['mobile'] : '';
			$data['address'] = !empty($order['address']) ? $order['address'] : '';
			$data['express_code'] = !empty($order['express_code']) ? $order['express_code'] : '';
			$data['express_no'] = !empty($order['express_no']) ? $order['express_no'] : '';
			$data['user_name'] = !empty($user_name) ? $user_name : $_SESSION[APP_NAME]['user_name'];
			$data['owner_id'] = !empty($order['owner_id']) ? $order['owner_id'] : '';
			$data['adtime'] = date('Y-m-d H:i:s',time());
			$data['audit_status'] = $check == 1 ? 0 : 2;
			$data['status'] = $check == 1 ? 0 : 2;

			$rand = $this->HaveRegister()->RandNum();
			$data['m_thing_no'] = 'HZJ'.$rand;
			$rel = $this->db->insertEx($this->table,$data,array(),0,0,1,'order_no');
			if(!$rel){
				$this->setError(1,__('操作失败'));
				$this->db->rollback();
				return false;
			}

			$register_id = $this->db->lastInsertId();
			/*有主件明细*/
			if(!isset($order['detail']) || empty($order['detail'])){
				$this->setError(1,__('明细为空'));
				return false;
			}
			$detail = array();
			$detailArray = array();

			foreach ($order['detail'] as $k => $v) {
				$detail['register_id'] = $register_id;
				$detail['m_thing_no'] = $data['m_thing_no'];
				$detail['order_no'] = $v['order_no'];
				$detail['shop_id'] = $data['shop_id'];
				$detail['tid'] = $v['tid'];
				$detail['plat_tid'] = $v['plat_tid'];
				$detail['goods_no'] = $v['goods_no'];
				$detail['sku'] = $v['sku'];
				$detail['num'] = $v['num'];
				$detail['return_reason'] = $v['refund_reason'];
				$detail['owner_id'] = $data['owner_id'];

				$goods = $this->getOneGoods($v['sku'],$data['owner_id']);
				$detail['goods_id'] = $goods['goods_id'];

				$detailArray[] = $detail;
			}

			$rel = $this->db->insertEx($this->backGoodsTable,$detailArray,array(),0,0,1,'order_no');
			if(!$rel){
				$this->setError(1,__('有主件生成失败'));
				$this->db->rollback();
				return false;
			}

			/*检测是否启用*/
			if(!$check){

				$info = array();
				
				$rel = MC('WmsEntryModel','App/Model/Wms')->add($data['m_thing_no'],'INXS',$data['back_warehouse_code'],$info);
				if(!$rel){
					$error = MC('WmsEntryModel','App/Model/Wms')->getError();
					if($error['code'] !=-10000){
						$this->setError(1,$msg);
						$this->db->rollback();
						return false;
					}
				}
				
			}
			$this->logText[]=sprintf(__('交易号( %s ),生成虚单'),$order['tid']);

			$this->insertLog($register_id,'back',$this->logText,$user_name);

			return array('m_thing_no'=>$data['m_thing_no'],'back_warehouse_code'=>$data['back_warehouse_code']);

		}
		/*检测当前订单号是否已登记
		*$order_no  oms订单号
		*$refund_type 退换类型
		*/
		public function checkOmsOrderRegister($order_no,$refund_type){
			if(!$order_no){
				$this->setError(1,__('订单号不存在'));
				return false;
			}
			$sql = "SELECT id,m_thing_no,back_express_code,back_express_no,back_warehouse_code FROM {$this->table} WHERE order_no='{$order_no}' AND back_type={$refund_type} AND is_to_void=0 LIMIT 1";
			$rows = $this->db->getRow($sql);

			return $rows;
		}

		/*根据主件类型获取登记单信息
		*$order_no 主件单号
		*$noType 主件类型
		*/
		public function getOrderNoHvMainThing($order_no,$noType){
			if(!$order_no){
				return false;
			}
			$noType = $noType == 'HZJ' ? 'm_thing_no' : 'n_thing_no';
			$w_arr[':order_no'] = $order_no;
			$sql = "SELECT id,audit_status,back_warehouse_code,is_mainthing FROM {$this->table} WHERE {$noType}=:order_no";
			$rows = $this->db->getRow($sql,$w_arr);

			return $rows;
		}

		/*退单作废*/
		public function RefundToVoid($order_no){
			if(!$order_no){
				$this->setError(1,__('没有作废的主件单号(为空)'));
				return false;
			}
			$sbtr = substr($order_no,0,3);
			/*主件类型*/
			$noType = array('HZJ'=>1,'WZJ'=>1);
			if(!array_key_exists($sbtr,$noType)){
				$this->setError(1,__('主件单据类型错误'));
				return false;
			}
			$data = $this->getOrderNoHvMainThing($order_no,$sbtr);
			if(!$data){
				$this->setError(1,__('未生成主件单号'));
				return false;
			}
			if($data['audit_status'] == 3){
				$this->setError(1,__('已验收,不允许操作'));
				return false;
			}

			/*取消已上传中间件*/
			if($data['audit_status'] == 1 || $data['audit_status'] == 2){
				$wms_flag = MC('WmsEntryModel','App/Model/Wms')->cancel($order_no,'INXS',$data['back_warehouse_code']);
				if ($wms_flag === false){
					$err = MC('WmsEntryModel','App/Model/Wms')->getError();
					if($err['code'] !=-10000){
						$this->setError(1,$err['msg']);
						return false;
					}

				}
			}

			$rel = $this->db->update($this->table,array('audit_status'=>4,'is_to_void'=>1),array('id'=>$data['id']));
			if(!$rel){
				$this->setError(1,__('操作失败(主单更新失败)'));
				return false;
			}
			$rel = $this->db->update($this->backGoodsTable,array('is_to_void'=>1),array('register_id'=>$data['id']));
			if(!$rel){
				$this->setError(1,__('操作失败(明细更新失败)'));
				return false;
			}
			if($data['is_mainthing'] == 1){
				$rel = $this->db->update($this->noHvTable,array('status'=>1,'audit_status'=>0),array('no_master_number'=>$data['n_thing_no']));
				if(!$rel){
					$this->setError(1,__('操作失败(无主件状态更新失败)'));
					return false;
				}
			}
			$this->logText[]=sprintf(__('主件单号( %s ),作废'),$order_no);

			$this->insertLog($data['id'],'tovoid',$this->logText);
			return true;
		}

		/*验收*/
		public function CheckBeforeAcceptance($order_no,$warehouse_code,$owner_id){
			if(!$order_no){
				$this->setError(1,__('验收失败'));
				return false;
			}
			try {
				$this->db->beginTransaction();

				$skus = $this->getRegisterSkus($order_no);
				$rel = $this->Stock()->addStocks($owner_id,$warehouse_code,$skus,$order_no,'XT');
				if(!$rel){
					$msg = $this->Stock()->getErrorMsg();
					$this->db->rollback();
					$this->setError(1,$msg);
					return false;
				}
				$rel = $this->db->update($this->table,array('audit_status'=>3),array('m_thing_no'=>$order_no));
				if(!$rel){
					$this->setError(1,__('验收失败'));
					$this->db->rollback();
					return false;
				}
				$params['register_no'] = $order_no;
				$params['r_time'] = date('Y-m-d H:i:s',time());
			 	$params['owner_id'] = $owner_id;
			 	$params['detail'] = $skus;

			 	/*收货明细*/
				$rel = $this->newGoodsReceiptDetail($params);
				if($rel === false){
					$this->setError(1,__('验收失败'));
					$this->db->rollback();
					return false;
				}

				$this->db->commit();
				return true;

			} catch (Exception $e) {
				$this->db->rollback();
				$this->setError(1,__('验收失败'));
				return false;
			}

		}

		/*根据主件单号、类型获取登记明细*/
		public function getRegGoodsNumber($hvOrder_no,$type){
			if(!$hvOrder_no || !$type){
				return false;
			}
			if($type == 'HZJ'){
				$sql = "SELECT id,sku,num,receipt_num FROM {$this->backGoodsTable} WHERE m_thing_no='{$hvOrder_no}'";
			}
			if($type == 'WZJ'){
				$sql = "SELECT id,sku,num,receipt_num FROM {$this->nvbackGoodsTable} WHERE sub_number='{$hvOrder_no}'";
			}
			$rows = $this->db->getAll($sql);

			return $rows;
		}

		/*根据主件单号获取收货明细*/
		public function getGoodsReceiptDetail($register_no){
			if(!$register_no){
				return false;
			}
			$sql = "SELECT sku,num FROM {$this->goods_receipt} WHERE register_no='{$register_no}'";
			$rows = $this->db->getAll($sql);

			return $rows;
		}

		/*中间件验收*/
		public function MiddlewareAcceptance($params){
			if(!$params || empty($params['order_no'])){
				$this->setError(1,__('没有有效主件单号'));
				return false;
			}
			$sbtr = substr($params['order_no'],0,3);
			/*主件类型*/
			$noType = array('HZJ'=>1,'WZJ'=>1);
			if(!array_key_exists($sbtr,$noType)){
				$this->setError(1,__('主件单据类型错误'));
				return false;
			}
			$fType = $sbtr == 'HZJ' ? 'm_thing_no' : 'no_master_number';
			$f_filed = $sbtr == 'HZJ' ? 'n_thing_no,is_mainthing,audit_status' : 'no_master_number,status,audit_status';
			$f_table = $sbtr == 'HZJ' ? $this->table : $this->noHvTable;
			$sql = "SELECT {$f_filed} FROM {$f_table} WHERE {$fType}='{$params['order_no']}' LIMIT 1";
			$rows = $this->db->getRow($sql);

			if(empty($rows)){
				$this->setError(1,__('没有有效主件单号'));
				return false;
			}

			if($rows['audit_status'] == 3 && $sbtr=='HZJ' || $rows['audit_status'] == 2 && $sbtr=='WZJ'){
				$this->setError(1,sprintf(__("主件单据(%s)已经验收"),$params['order_no']));
				return false;
			}


			/*已登记数量*/
			$rg_num_total = 0;
			$rg_data = $this->getRegGoodsNumber($params['order_no'],$sbtr);
			if(!empty($rg_data)){
				foreach($rg_data as $key=>$value){
					$rg_num_total+=$value['num'];
				}
			}
			/*已收货数量*/
			$re_num = 0;
			$re_sku_num = array();
			$re_data = $this->getGoodsReceiptDetail($params['order_no']);
			if(!empty($re_data)){
				foreach($re_data as $key=>$value){
					$re_num+=$value['num'];
					// $re_sku_num[$value['sku']]+=$value['num'];
				}
			}
			/*WMS即将回传数量*/
			$wms_hc_num = 0;
			if(!empty($params['detail'])){
				foreach($params['detail'] as $key=>$value){
					$wms_hc_num+=$value['num'];
				}
			}

			$re_num_total = $wms_hc_num+$re_num;

			// if($re_num_total > $rg_num_total){
				// $this->setError(1,sprintf(__("主件单据(%s)登记数量为({$rg_num_total}),已收货回传数量({$re_num}),WMS当前即将回传数量为({$wms_hc_num})"),$params['order_no']));
				// return false;
			// }

			if($re_num_total>=$rg_num_total){
				$hv_audit_status = 3;
				$nv_audit_status = 2;
			}else{
				$hv_audit_status = 6;
				$nv_audit_status = 4;
			}

			/*验收增加库存*/
			$this->db->beginTransaction();

			$hv_text_audit_status = $hv_audit_status == 6 ? '部分验收' : '已经验收';
			$nv_text_audit_status = $nv_audit_status == 4 ? '部分验收' : '已经验收';
			$ys_text = $sbtr == 'HZJ' ? sprintf(__('有主件( %s )%s'),$params['order_no'],__($hv_text_audit_status)) : sprintf(__('无主件( %s )验收%s'),$params['order_no'],__($nv_text_audit_status));

			$isWms = $this->Stock()->getWmsConfig($params['warehouse_code']);
			if($isWms['wms_stock_mode'] == 1){
				$rel = $this->Stock()->addStocks($params['owner_id'],$params['warehouse_code'],$params['detail'],$params['order_no'],'XT',$ys_text);
				if(!$rel){
					$msg = $this->Stock()->getErrorMsg();
					$this->setError(1,$msg);
					$this->db->rollback();
					return false;
				}
			}

			/*更新验收状态*/
			if($sbtr == 'HZJ'){
				if($rows['audit_status'] !=6 || $hv_audit_status !=6){
					$rel = $this->db->update($this->table,array('audit_status'=>$hv_audit_status,'receiving_time'=>$params['wms_shipping_time']),"{$fType}='{$params['order_no']}' AND audit_status!={$hv_audit_status}");
					if($rel === false){
						$this->setError(1,__('验收失败(更新验收状态失败或已验收,001)'));
						$this->db->rollback();
						return false;
					}

					/*如果当前有主件是由无主件转过来,则需回打标记*/

					if($rows['is_mainthing'] == 1){
						$rel = $this->db->update($this->noHvTable,array('audit_status'=>$nv_audit_status,'receiving_time'=>$params['wms_shipping_time']),"no_master_number='{$rows['n_thing_no']}' AND audit_status!={$nv_audit_status}");
						if($rel === false){
							$this->setError(1,__('验收失败(更新验收状态失败或已验收,002)'));
							$this->db->rollback();
							return false;
						}
					}
				}

			}else{
				if($rows['audit_status'] !=4 || $nv_audit_status !=4){
					$rel = $this->db->update($this->noHvTable,array('audit_status'=>$nv_audit_status,'receiving_time'=>$params['wms_shipping_time']),"{$fType}='{$params['order_no']}' AND audit_status!={$nv_audit_status}");
					if($rel === false){
						$this->setError(1,__('验收失败(更新验收状态失败或已验收,003)'));
						$this->db->rollback();
						return false;
					}

					/*如果当前无主件已转有主件,则需回打标记*/
					if($rows['status'] == 3){
						$rel = $this->db->update($this->table,array('audit_status'=>$hv_audit_status,'receiving_time'=>$params['wms_shipping_time']),"n_thing_no='{$rows['no_master_number']}' AND audit_status!={$hv_audit_status}");
						if($rel === false){
							$this->setError(1,__('验收失败(更新验收状态失败或已验收,004)'));
							$this->db->rollback();
							return false;
						}
					}
				}
			}

			/*收货明细*/
			$rel = $this->newGoodsReceiptDetail($params);
			if($rel === false){
				$this->setError(1,__('验收失败(收货明细)'));
				$this->db->rollback();
				return false;
			}
			/*均摊明细*/
			$rel = $this->ShareDetail($params,$rg_data,$sbtr);
			if($rel === false){
				$this->setError(1,__('验收失败(均摊明细)'));
				$this->db->rollback();
				return false;
			}
			$this->db->commit();
			return true;
		}

		/*新增收货明细*/
		public function newGoodsReceiptDetail($params){
			if(!$params){
				return false;
			}
			$data = array();
			$row = array();
			$register_no = isset($params['order_no']) ? $params['order_no'] : '';
			foreach ($params['detail'] as $key => $value) {
				
				$data[$value['sku']]['register_no'] = isset($params['order_no']) ? $params['order_no'] : '';
				$data[$value['sku']]['wms_order_no'] = isset($value['wms_order_no']) ? $value['wms_order_no'] : '';
				$data[$value['sku']]['sku'] = $value['sku'];

				$data[$value['sku']]['num']+= $value['num'];

				$data[$value['sku']]['r_time'] = isset($params['wms_shipping_time']) ? $params['wms_shipping_time'] : '';
				$data[$value['sku']]['owner_id'] = isset($params['owner_id']) ? $params['owner_id'] : '';

			 }
			 
			 $filed = 'num,r_time';
			 $rel = $this->db->insertEx($this->goods_receipt,$data,array(),1,1,2,$filed);

			 if($rel === false){
			 	return false;
			 }
			 return true;
		}
		/*分摊明细*/
		public function ShareDetail($params,$rg_data,$sbtr){
			if(empty($params)){
				return false;
			}

			$r_rg_data = array();
			$r_detail_array = array();
			$receipt_num = array();

			foreach($rg_data as $rk=>$rv){
				$r_rg_data[$rv['sku']][] = $rv;
			}

			foreach($params['detail'] as $rtk=>$rtv){
				$r_detail_array[$rtv['sku']] = $rtv;
			}

			$s_table = $sbtr == 'HZJ' ? $this->backGoodsTable : $this->nvbackGoodsTable;
			/*
			echo '<hr/>r_rg_data<xmp>'.var_export($r_rg_data,true).'</xmp>';//die;
			echo '<hr/>r_detail_array<xmp>'.var_export($r_detail_array,true).'</xmp>';
			echo '<hr/>s_table<xmp>'.var_export($s_table,true).'</xmp>';
			die;*/
			foreach($r_detail_array as $_sku=>$sub){
				$find_r_rg_data = $r_rg_data[$_sku];
				if (empty($find_r_rg_data)){
					continue;
				}
				if (count($find_r_rg_data)>1){
					$ft_obj = MC('PaymentFtModel','App/Model/Common');
					$ft_arr = $ft_obj->ft_cust($sub['num'],$find_r_rg_data,'num','ft_num',0);
					if ($ft_arr === false){
						$err = $ft_obj->getError();
						return $this->setError(-1,$err['msg']);
					}
					foreach($ft_arr as $sub_ft){
						$receipt_num = $sub_ft['ft_num']+$sub_ft['receipt_num'];
						$sql = "update {$s_table} set receipt_num = {$receipt_num} where id={$sub_ft['id']}";
						//echo $sql."<br/>";
						$this->getDb()->execute($sql);				
					}
				}else{
					$row = $find_r_rg_data[0];
					$receipt_num = $row['receipt_num']+$sub['num'];
					$sql = "update {$s_table} set receipt_num = {$receipt_num} where id={$row['id']}";
					//echo $sql."<br/>";
					$this->getDb()->execute($sql);
				}
			}
			return true;
		}

		/*日志*/
		public function insertLog($register_id,$type,$text,$user_name=''){
			if(!$register_id || !$text){
				return false;
			}
			if(!empty($text)){
				if(is_array($text)){
					$text = implode(';',$text);
				}
				$hvData = $this->getHaveMainThing($register_id);
				$data['register_id'] = $register_id;
				$data['register_no'] = $hvData[0]['m_thing_no'];
				$data['user_name'] = empty($user_name) ? $_SESSION[APP_NAME]['user_name'] : $user_name;
				$data['created'] = date('Y-m-d H:i:s',time());
				$data['type'] = $type;
				$data['text'] = $text;

				$rel = $this->db->insert($this->warehouse_back_log,$data);
				if(!$rel){
					return false;
				}
				return $rel;
			}
			return true;
		}

		/*退件标签*/
		public function ReturnLabel(){
			$rel = $this->BusinessValue()->getValues('B15');
			if(!empty($rel)){
				return $rel;
			}
			return '';
		}

		/*退件标签CODE为键值列表*/
		public function ReturnLabelKeyList(){
			$list = $this->ReturnLabel();
			$data = array();
			if(!empty($list)){
				foreach ($list as $key => $value) {
					$data[$value['value_code']] = $value;
				}
			}
			return $data;
		}

		/*退件标签保存*/
		public function ReturnLabelSave($params){
			if(!$params){
				$this->setError(1,__('操作失败'));
				return false;
			}
			if(empty($params['return_label'])){
				$this->setError(1,__('标签不能为空'));
				return false;
			}
			try {
				$this->db->beginTransaction();
					$rel = $this->db->update($this->table,array('return_label'=>$params['return_label']),array('id'=>$params['r_label_id']));
					if(!$rel){
						$this->setError(1,__('操作失败'));
						$this->db->rollback();
						return false;
					}
				$this->db->commit();
				return true;

			} catch (Exception $e) {
				$this->db->rollback();
				$this->setError(1,__('操作失败'));
				return false;
			}
		}

		/*定时器审核*/
		public function TimeAudit(){
			try {
				$limit = 1000;
				while (true) {
					$sql = "SELECT id,shop_id,owner_id,m_thing_no,back_warehouse_code FROM {$this->table} WHERE audit_status=0 LIMIT 1000";
					$rows = $this->db->getAll($sql);
					if(empty($rows)){
						echo __('没有要审核的数据');
						return;
					}
					$this->db->beginTransaction();
						$idsArr = array();
						foreach ($rows as $key => $value) {
							$idsArr[] = $value['id'];

							$info = array('shop_id'=>$value['shop_id'],'owner_id'=>$value['owner_id']);
							$rel = MC('WmsEntryModel','App/Model/Wms')->add($value['m_thing_no'],'INXS',$value['back_warehouse_code'],$info);
							if(!$rel){
								$error = MC('WmsEntryModel','App/Model/Wms')->getError();
								if($error['code'] !=-10000){
									echo __('有主件').$value['m_thing_no'].'----'.$error['msg']."\n";
									continue;
								}
							}

						}
						$ids = implode(',',$idsArr);
						$sql = "UPDATE {$this->table} SET audit_status=1 WHERE id IN ({$ids})";
						$rel = $this->db->execute($sql);

					$this->db->commit();
					if($rel<$limit){
						return;
					}
				}
				echo __('无主件审核完成');
				return;

			} catch (Exception $e) {
				$this->db->rollback();
				echo __('操作失败');
				return;
			}
		}
		/*批量分摊验收数据*/
		public function ShareHvAcceptanceData($params){
			$i=0;
			$page_size = 100;
			if(isset($params['order_no'])){
				if(strpos($params['order_no'],',')){
					$ex_r_arr = explode(',',$params['order_no']);
					$ex_r_arr = array_unique($ex_r_arr);
					$order_nos = "'".implode("','",$ex_r_arr)."'";
				}else{
					$order_nos = "'".$params['order_no']."'";
				}

				
				$sql = "SELECT m_thing_no FROM {$this->table} WHERE audit_status IN (3,6) AND m_thing_no IN ({$order_nos})";
				$rg_rows = $this->db->getAll($sql);
				if(empty($rg_rows)){
					break;
				}
				
				$rg_arr = array();
				foreach($rg_rows as $k=>$v){
					$rg_arr[] = $v['m_thing_no'];
				}
				$rg_nos = "'".implode("','",$rg_arr)."'";
				/*获取收货明细*/
				$sql = "SELECT register_no,sku,num FROM {$this->goods_receipt} WHERE register_no IN ({$rg_nos})";
				$rec_rows = $this->db->getAll($sql);
				if(empty($rec_rows)){
					echo '第'.$i.'页,收货明细为空<br/>';
					continue;
				}
				$rec_arr = array();
				foreach($rec_rows as $reck=>$recv){
					$rec_arr[$recv['register_no']][] = $recv;
				}

				/*获取登记明细*/
				$sql = "SELECT id,m_thing_no,sku,num,receipt_num FROM {$this->backGoodsTable} WHERE m_thing_no IN ({$rg_nos})";
				$rgd_rows = $this->db->getAll($sql);

				if(empty($rgd_rows)){
					echo '第'.$i.'页,登记明细为空<br/>';
					continue;
				}
				$rgd_arr = array();
				foreach($rgd_rows as $rgdk=>$rgdv){
					$rgd_arr[$rgdv['m_thing_no']][] = $rgdv;
				}
				
				foreach($rgd_arr as $key=>$value){
					if(isset($rec_arr[$key])){
						$rel = $this->ShareDetail($rec_arr[$key],$value,'HZJ');
						if($rel === false){
							echo $this->getErrorMsg().'</br>';
						}
						echo '有主件'.$key.'均摊完成<br/>';
						continue;
					}
					echo '<span style=color:red;>有主件'.$key.'收货明细不存在</span><br/>';
				}
				return true;
			}
			while(true){
				$i++;
				$sql = "SELECT m_thing_no FROM {$this->table} WHERE audit_status IN (3,6) AND id>=(SELECT id FROM {$this->table} WHERE audit_status IN (3,6) LIMIT ".($i-1)*$page_size.",1) LIMIT {$page_size}";
				$rg_rows = $this->db->getAll($sql);
				if(empty($rg_rows)){
					break;
				}
				
				$rg_arr = array();
				foreach($rg_rows as $k=>$v){
					$rg_arr[] = $v['m_thing_no'];
				}
				$rg_nos = "'".implode("','",$rg_arr)."'";
				/*获取收货明细*/
				$sql = "SELECT register_no,sku,num FROM {$this->goods_receipt} WHERE register_no IN ({$rg_nos})";
				$rec_rows = $this->db->getAll($sql);
				if(empty($rec_rows)){
					echo '第'.$i.'页,收货明细为空<br/>';
					continue;
				}
				$rec_arr = array();
				foreach($rec_rows as $reck=>$recv){
					$rec_arr[$recv['register_no']][] = $recv;
				}

				/*获取登记明细*/
				$sql = "SELECT id,m_thing_no,sku,num,receipt_num FROM {$this->backGoodsTable} WHERE m_thing_no IN ({$rg_nos})";
				$rgd_rows = $this->db->getAll($sql);

				if(empty($rgd_rows)){
					echo '第'.$i.'页,登记明细为空<br/>';
					continue;
				}
				$rgd_arr = array();
				foreach($rgd_rows as $rgdk=>$rgdv){
					$rgd_arr[$rgdv['m_thing_no']][] = $rgdv;
				}
				
				foreach($rgd_arr as $key=>$value){
					if(isset($rec_arr[$key])){
						$rel = $this->ShareDetail($rec_arr[$key],$value,'HZJ');
						if($rel === false){
							echo $this->getErrorMsg().'</br>';
						}
						echo '有主件'.$key.'均摊完成<br/>';
						continue;
					}
					echo '<span style=color:red;>有主件'.$key.'收货明细不存在</span><br/>';
				}
			}
			return true;
		}
	}