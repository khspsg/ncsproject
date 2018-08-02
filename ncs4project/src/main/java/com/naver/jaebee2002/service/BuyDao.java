package com.naver.jaebee2002.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.naver.jaebee2002.entities.Buy;

public interface BuyDao {
	int selectSequenceNo(Buy buy);
	void insertRow(Buy buy);
	void deleteRow(Buy buy);
	ArrayList<Buy> selectAll(HashMap buysearch);
	ArrayList<Buy> selectBuySearch(HashMap buysearch);
	Buy selectRow(int seq);
	void updateRow(Buy buy);
}
