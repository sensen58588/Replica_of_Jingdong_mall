package com.hxq.design.service;

import java.util.List;

import com.hxq.design.beans.DealInfo;

public interface DealInfoServ {
	
	public int insertIntodealInfo(DealInfo dealInfo)throws Exception;//����
	public int updateDealInfo(DealInfo dealInfo) throws Exception;//����
	public List<DealInfo> selectDealInfoByYear(DealInfo dealInfo)throws Exception;//�������
	public List<DealInfo> selectDealInfoByMonth(DealInfo dealInfo) throws Exception;//���²���
	public DealInfo selectDealInfoByDay(DealInfo dealInfo) throws Exception;//�������
}
