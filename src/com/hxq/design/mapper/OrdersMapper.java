package com.hxq.design.mapper;

import java.util.List;

import com.hxq.design.beans.Orders;

public interface OrdersMapper {
	public List<Orders> dealingOrderById(Orders order) throws Exception;//显示未付款订单,处理订单
	public int submitOrderById(Orders orders)throws Exception;//订单提交,更新数据库
	public Orders dealedOrderById(Orders orders) throws Exception;//查询历史订单
	public int createOrder(Orders orders)throws Exception;//生成订单
	public List<Orders> selectOrderInfo(Orders orders)throws Exception;
	public int deleteOrder(Orders orders) throws Exception;
	
}
