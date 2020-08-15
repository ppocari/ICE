package com.will.ice.resource.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ResourceServiceImpl implements ResourceService {

	@Autowired
	private ResourceDAO dao;
	
	@Override
	public List<ResManageVO> selectResManager(ResManageSearchVO rmsVo) {
		return dao.selectResManage(rmsVo);
	}
	
	@Override
	public int insertResManage(ResManageVO rmVo) {
		return dao.insertResManage(rmVo);
	}

	@Override
	public ResManageVO selectResManageOne(int resNo) {
		return dao.selectResManageOne(resNo);
	}

	@Override
	public int updateResource(ResManageVO rmVo) {
		return dao.updateResource(rmVo);
	}

	@Override
	public int deleteResManage(int resNo) {
		return dao.deleteResManage(resNo);
	}

	@Override
	public int selectTotalRecord() {
		return dao.selectTotalRecord();
	}

	@Override
	public List<ResKindVo> selectResKind() {
		return dao.selectResKind();
	}

	@Override
	public List<ResReserveVO> selectReserveResNo(int resNo) {
		return dao.selectReserveResNo(resNo);
	}

	@Override
	public ResKindVo selectReserveKind(int rkNo) {
		return dao.selectReserveKind(rkNo);
	}

	@Override
	public List<ResReserveVO> selectStartAvailableHour(ResReserveVO rsVo) {
		return dao.selectStartAvailableHour(rsVo);
	}

	@Override
	public ResReserveVO selectEndAvailableHour(ResReserveVO rsVo) {
		return dao.selectEndAvailableHour(rsVo);
	}

	@Override
	public int insertResReserve(ResReserveVO rsVo) {
		return dao.insertResReserve(rsVo);
	}

	@Override
	public List<ResReserveVO> selectReserve(ResReserveSearchVO rss) {
		return dao.selectReserve(rss);
	}


	@Override
	public int selectReserveCount() {
		return dao.selectReserveCount();
	}

	@Override
	public int updateConfirmReserve(ResKindVo rkVo) {
		return dao.updateConfirmReserve(rkVo);
	}

	@Override
	public int updateNoReasonReserve(ResKindVo rkVo) {
		return dao.updateNoReasonReserve(rkVo);
	}


}
