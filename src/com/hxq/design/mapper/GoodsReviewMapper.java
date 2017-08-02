package com.hxq.design.mapper;

import java.util.List;

import com.hxq.design.beans.GoodsReview;

public interface GoodsReviewMapper {
	
	public int insertIntoReview(GoodsReview goodsReview)throws Exception;
	public List<GoodsReview> selectReviewById(int goodsId) throws Exception;
}
