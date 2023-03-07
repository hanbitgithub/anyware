package com.aw.anyware.approval.service;

import java.util.ArrayList;

import com.aw.anyware.approval.vo.Approval;

public interface ApprovalService {
	
	public int selectListCount();
	public ArrayList<Approval> selectList();

}
