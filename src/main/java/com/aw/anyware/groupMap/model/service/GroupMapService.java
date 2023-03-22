package com.aw.anyware.groupMap.model.service;

import java.util.ArrayList;

import com.aw.anyware.common.model.vo.PageInfo;
import com.aw.anyware.groupMap.model.vo.GroupMap;

public interface GroupMapService {

	ArrayList<GroupMap> selectMemberList();

	ArrayList<GroupMap> ajaxSelectMemberList(int memberNo);

	int selectSearchCount(String keyword);

	ArrayList<GroupMap> searchMemberList(PageInfo pi, String keyword);

}
