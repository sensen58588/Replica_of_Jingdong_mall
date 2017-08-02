package com.hxq.design.service;

import java.util.List;

import com.hxq.design.beans.ShoppingCar;


public interface ShoppingCarServ {
	public int addGoodsToMyCar(ShoppingCar shoppingCar) throws Exception;//添加到购物车
	public int addAgain(ShoppingCar shoppingCar) throws Exception;
	public List<ShoppingCar> selectShoppingCarByUserName(ShoppingCar shoppingCar) throws Exception;
	public int updateShoppingCarAddOne(ShoppingCar shoppingCar) throws Exception;//购买数量加一
	public int updateShoppingCarDelOne(ShoppingCar shoppingCar) throws Exception;//购买数量减一
	public ShoppingCar selectShoppingCarByUnAndGd(ShoppingCar shoppingCar)throws Exception;
	public int deleteGoods()throws Exception;//删除购物车里数量为0的记录
	public int deleteDoneGoods(ShoppingCar shoppingCar)throws Exception;//删除已完成订单商品
}
