package com.hxq.design.mapper;

import java.util.List;

import com.hxq.design.beans.DealInfo;

public interface DealInfoMapper {
	public int insertIntodealInfo(DealInfo dealInfo)throws Exception;//插入
	public int updateDealInfo(DealInfo dealInfo) throws Exception;//更新
	public List<DealInfo> selectDealInfoByYear(DealInfo dealInfo)throws Exception;//按年查找
	public List<DealInfo> selectDealInfoByMonth(DealInfo dealInfo) throws Exception;//按月查找
	public DealInfo selectDealInfoByDay(DealInfo dealInfo) throws Exception;//按天查找
	
	
}
