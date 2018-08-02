package com.naver.jaebee2002.service;

import java.util.ArrayList;

import com.naver.jaebee2002.entities.Vender;

public interface VenderDao {
	int selectConfirm(String code);
	void insertRow(Vender vender);
	int updateRow(Vender vender);
	int deleteRow(String code);
	ArrayList<Vender> selectAll();
	Vender selectOne(String code);
}
