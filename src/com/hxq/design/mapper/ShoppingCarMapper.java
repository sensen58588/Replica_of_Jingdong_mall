package com.hxq.design.mapper;

import java.util.List;

import com.hxq.design.beans.ShoppingCar;

public interface ShoppingCarMapper {
	public int addGoodsToMyCar(ShoppingCar shoppingCar) throws Exception;
	public int addAgain(ShoppingCar shoppingCar) throws Exception;
	public List<ShoppingCar> selectShoppingCarByUserName(ShoppingCar shoppingCar) throws Exception;
	public int updateShoppingCarAddOne(ShoppingCar shoppingCar) throws Exception;
	public int updateShoppingCarDelOne(ShoppingCar shoppingCar) throws Exception;
	public ShoppingCar selectShoppingCarByUnAndGd(ShoppingCar shoppingCar)throws Exception;
	public int deleteGoods()throws Exception;
	public int deleteDoneGoods(ShoppingCar shoppingCar)throws Exception;
}
