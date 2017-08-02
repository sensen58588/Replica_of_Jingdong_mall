package com.hxq.design.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hxq.design.beans.Goods;
import com.hxq.design.mapper.GoodsMapper;
import com.hxq.design.service.GoodsServ;
@Service
public class GoodsServImpl implements GoodsServ{
	@Autowired
	private GoodsMapper goodsmapper;
	
	public int insertIntoGoods(Goods goods) throws Exception {

		return goodsmapper.insterintoGoods(goods);
	}

	public Goods selectGoodsAllInfoById(int goodsId) throws Exception {
		
		return goodsmapper.selectGoodsAllInfoById(goodsId);
	}

	public List<Goods> selectGoodsSomeInfoByLike(String value) throws Exception {
		
		return goodsmapper.selectGoodsSomeInfoByLike(value);
	}

	public int updateGoodsNumber(Goods goods) throws Exception {
		
		return goodsmapper.updateGoodsNumber(goods);
	}

	public int updateGoodsInfo(Goods goods) throws Exception {
		
		return goodsmapper.updateGoodsInfo(goods);
	}

	public int uploadGoodsPic(Goods goods) throws Exception {
		
		return goodsmapper.uploadGoodsPic(goods);
	}

	

}
