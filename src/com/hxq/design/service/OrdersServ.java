package com.hxq.design.service;

import java.util.List;

import com.hxq.design.beans.Orders;

public interface OrdersServ {
	public List<Orders> dealingOrderById(Orders orders) throws Exception;//��ʾδ�����,������
	public int submitOrderById(Orders order)throws Exception;//�����ύ
	public Orders dealedOrderById(Orders orders) throws Exception;//��ѯ��ʷ����
	public int createOrder(Orders order)throws Exception;//���ɶ���
	public List<Orders> selectOrderInfo(Orders orders)throws Exception;
	public int deleteOrder(Orders orders) throws Exception;//ɾ������
}
