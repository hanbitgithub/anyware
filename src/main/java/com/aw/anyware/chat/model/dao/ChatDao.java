package com.aw.anyware.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.aw.anyware.member.model.vo.Member;

@Repository
public class ChatDao {

	public ArrayList<Member> selectDept(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("");
	}

}
