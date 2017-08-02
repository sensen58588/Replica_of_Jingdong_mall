package com.hxq.design.service;

import java.util.List;

import com.hxq.design.beans.ShoppingCar;


public interface ShoppingCarServ {
	public int addGoodsToMyCar(ShoppingCar shoppingCar) throws Exception;//��ӵ����ﳵ
	public int addAgain(ShoppingCar shoppingCar) throws Exception;
	public List<ShoppingCar> selectShoppingCarByUserName(ShoppingCar shoppingCar) throws Exception;
	public int updateShoppingCarAddOne(ShoppingCar shoppingCar) throws Exception;//����������һ
	public int updateShoppingCarDelOne(ShoppingCar shoppingCar) throws Exception;//����������һ
	public ShoppingCar selectShoppingCarByUnAndGd(ShoppingCar shoppingCar)throws Exception;
	public int deleteGoods()throws Exception;//ɾ�����ﳵ������Ϊ0�ļ�¼
	public int deleteDoneGoods(ShoppingCar shoppingCar)throws Exception;//ɾ������ɶ�����Ʒ
}
