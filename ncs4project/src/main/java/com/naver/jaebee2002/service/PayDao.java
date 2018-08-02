package com.naver.jaebee2002.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.naver.jaebee2002.entities.Pay;

public interface PayDao {
	int selectSequenceNo(Pay pay);
	void insertRow(Pay pay);
	void deleteRow(Pay pay);
	void updateRow(Pay pay);
	ArrayList<Pay> selectAll(HashMap buysearch);
	ArrayList<Pay> selectPaySearch(HashMap buysearch);
	Pay selectRow(int seq);
}
