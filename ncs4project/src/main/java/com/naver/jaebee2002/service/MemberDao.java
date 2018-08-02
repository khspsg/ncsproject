package com.naver.jaebee2002.service;

import java.util.ArrayList;

import com.naver.jaebee2002.entities.Member;

public interface MemberDao {
	int selectConfirm(String email);
	Member selectOne(String email);
	int insertRow(Member member);
	int updateRow(Member member);
	int deleteRow(String email);
	ArrayList<Member> selectAll();
	Member login(String email);
	void updatePassword(Member member);
}
