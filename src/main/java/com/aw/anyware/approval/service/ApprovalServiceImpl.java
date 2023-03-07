package com.aw.anyware.approval.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aw.anyware.approval.dao.ApprovalDao;
import com.aw.anyware.approval.vo.Approval;

@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ApprovalDao aDao;
	
	@Override
	public int selectListCount() {
		return aDao.selectListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Approval> selectList() {
		return aDao.selectList(sqlSession);
	}


}
