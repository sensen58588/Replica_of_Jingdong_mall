package com.hxq.design.mapper;

import java.util.List;

import com.hxq.design.beans.Orders;

public interface OrdersMapper {
	public List<Orders> dealingOrderById(Orders order) throws Exception;//��ʾδ�����,������
	public int submitOrderById(Orders orders)throws Exception;//�����ύ,�������ݿ�
	public Orders dealedOrderById(Orders orders) throws Exception;//��ѯ��ʷ����
	public int createOrder(Orders orders)throws Exception;//���ɶ���
	public List<Orders> selectOrderInfo(Orders orders)throws Exception;
	public int deleteOrder(Orders orders) throws Exception;
	
}
