package com.aw.anyware.approval.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.aw.anyware.approval.vo.Approval;

@Repository
public class ApprovalDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.insert("approvalMapper.insertTpl");
		//return sqlSession.selectOne("approvalMapper.selectListCount");
	}
	
	public ArrayList<Approval> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectList");
	}

}
