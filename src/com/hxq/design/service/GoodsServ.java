package com.hxq.design.service;

import java.util.List;

import com.hxq.design.beans.Goods;

public interface GoodsServ {
	public int insertIntoGoods(Goods goods) throws Exception;
	public Goods selectGoodsAllInfoById(int goodsId)throws Exception;
	public List<Goods> selectGoodsSomeInfoByLike(String value)throws Exception;
	public int updateGoodsNumber(Goods goods) throws Exception;
	public int updateGoodsInfo(Goods goods) throws Exception;
	public int uploadGoodsPic(Goods goods)throws Exception;
	
}
