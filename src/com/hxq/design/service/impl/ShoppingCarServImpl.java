package com.hxq.design.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hxq.design.beans.ShoppingCar;
import com.hxq.design.mapper.ShoppingCarMapper;
import com.hxq.design.service.ShoppingCarServ;

@Service
public class ShoppingCarServImpl implements ShoppingCarServ{
	@Autowired
	private ShoppingCarMapper shoppingCarMapper;
	
	public int addGoodsToMyCar(ShoppingCar shoppingCar) throws Exception {
		return shoppingCarMapper.addGoodsToMyCar(shoppingCar);
		
	}

	public int addAgain(ShoppingCar shoppingCar) throws Exception {
		return shoppingCarMapper.addAgain(shoppingCar);
		
	}

	public List<ShoppingCar> selectShoppingCarByUserName(ShoppingCar shoppingCar)
			throws Exception {
		
		return shoppingCarMapper.selectShoppingCarByUserName(shoppingCar);
	}

	public int updateShoppingCarAddOne(ShoppingCar shoppingCar)
			throws Exception {
		
		return shoppingCarMapper.updateShoppingCarAddOne(shoppingCar);
	}

	public int updateShoppingCarDelOne(ShoppingCar shoppingCar)
			throws Exception {
		
		return shoppingCarMapper.updateShoppingCarDelOne(shoppingCar);
	}

	public ShoppingCar selectShoppingCarByUnAndGd(ShoppingCar shoppingCar)
			throws Exception {
		
		return shoppingCarMapper.selectShoppingCarByUnAndGd(shoppingCar);
	}

	public int deleteGoods() throws Exception {
		
		return shoppingCarMapper.deleteGoods();
	}

	public int deleteDoneGoods(ShoppingCar shoppingCar) throws Exception {
		
		return shoppingCarMapper.deleteDoneGoods(shoppingCar);
	}

}
