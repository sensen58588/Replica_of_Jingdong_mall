package com.hxq.design.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hxq.design.beans.DealInfo;
import com.hxq.design.mapper.DealInfoMapper;
import com.hxq.design.service.DealInfoServ;
@Service
public class DealInfoServImpl implements DealInfoServ {
	
	@Autowired
	private DealInfoMapper dealInfoMapper;
	
	public int insertIntodealInfo(DealInfo dealInfo) throws Exception {
		
		return dealInfoMapper.insertIntodealInfo(dealInfo);
	}

	public int updateDealInfo(DealInfo dealInfo) throws Exception {
		
		return dealInfoMapper.updateDealInfo(dealInfo);
	}

	public List<DealInfo> selectDealInfoByYear(DealInfo dealInfo)
			throws Exception {
		
		return dealInfoMapper.selectDealInfoByYear(dealInfo);
	}

	public List<DealInfo> selectDealInfoByMonth(DealInfo dealInfo)
			throws Exception {
	
		return dealInfoMapper.selectDealInfoByMonth(dealInfo);
	}

	public DealInfo selectDealInfoByDay(DealInfo dealInfo)
			throws Exception {
		
		return dealInfoMapper.selectDealInfoByDay(dealInfo);
	}

}
