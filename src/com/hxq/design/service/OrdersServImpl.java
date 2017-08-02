package com.hxq.design.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hxq.design.beans.Orders;
import com.hxq.design.mapper.OrdersMapper;
@Service
   public class OrdersServImpl implements OrdersServ {
	@Autowired
	private OrdersMapper ordermapper;
	public List<Orders> dealingOrderById(Orders orders) throws Exception{
		
		return ordermapper.dealingOrderById(orders);
	}

	public int submitOrderById(Orders order) throws Exception {
		
		return ordermapper.submitOrderById(order);
	}

	public Orders dealedOrderById(Orders orders) throws Exception {
		
		return ordermapper.dealedOrderById(orders);
	}

	public int createOrder(Orders order) throws Exception {
		
		return ordermapper.createOrder(order);
	}

	public List<Orders> selectOrderInfo(Orders orders) throws Exception {
		
		return ordermapper.selectOrderInfo(orders);
	}

	public int deleteOrder(Orders orders) throws Exception {
		
		return ordermapper.deleteOrder(orders);
	}

}
