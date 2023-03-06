package com.aw.anyware.board.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aw.anyware.board.model.dao.NoticeDao;
import com.aw.anyware.board.model.vo.Notice;
import com.aw.anyware.common.model.vo.PageInfo;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private NoticeDao nDao;
	
	@Override
	public int selectListCount() {
		return nDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		return nDao.selectList(sqlSession, pi);
	}

	@Override
	public int insertNotice(Notice n) {
		return 0;
	}

	@Override
	public int increaseCount(int NoticeNo) {
		return 0;
	}

	@Override
	public Notice selectNotice(int NoticeNo) {
		return null;
	}

	@Override
	public int deleteNotice(int NoticeNo) {
		return 0;
	}

	@Override
	public int updateNotice(Notice n) {
		return 0;
	}

}
