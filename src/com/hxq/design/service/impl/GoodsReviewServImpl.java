package com.hxq.design.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hxq.design.beans.GoodsReview;
import com.hxq.design.mapper.GoodsReviewMapper;
import com.hxq.design.service.GoodsReviewServ;

@Service
public class GoodsReviewServImpl implements GoodsReviewServ {
	@Autowired
	private GoodsReviewMapper goodsReviewMapper;
	
	public int insertIntoReview(GoodsReview goodsReview) throws Exception {
		
		return goodsReviewMapper.insertIntoReview(goodsReview);
	}

	public List<GoodsReview> selectReviewById(int goodsId) throws Exception {
		// TODO Auto-generated method stub
		return goodsReviewMapper.selectReviewById(goodsId);
	}

}
