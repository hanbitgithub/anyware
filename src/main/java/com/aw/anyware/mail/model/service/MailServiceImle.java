package com.aw.anyware.mail.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aw.anyware.mail.model.dao.MailDao;

@Service
public class MailServiceImle implements MailService {
	
	@Autowired
	private SqlSessionTemplate sqlSesison;
	
	@Autowired
	private MailDao mDao;

	@Override
	public int selectListCount() {
		return 0;
	}

}
