package com.hxq.design.service;

import java.util.List;

import com.hxq.design.beans.GoodsReview;

public interface GoodsReviewServ {
	public int insertIntoReview(GoodsReview goodsReview)throws Exception;//��������
	public List<GoodsReview> selectReviewById(int goodsId) throws Exception;//��������
}
