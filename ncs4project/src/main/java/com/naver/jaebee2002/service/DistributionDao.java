package com.naver.jaebee2002.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.naver.jaebee2002.entities.Balance;
import com.naver.jaebee2002.entities.Buy;
import com.naver.jaebee2002.entities.Pay;

public interface DistributionDao {
	int updateRow(Balance balance);
	int deleteRow(String vendcode);
	ArrayList<Balance> selectAll(Balance balance);
	ArrayList<Balance> balanceListYYYY(String yyyy);
	Balance selectOne(HashMap rollkey);
	void buyBalanceAdd(Buy buy);
	void buyBalanceSub(Buy buy);
	void payBalanceAdd(Pay pay);
	void payBalanceSub(Pay pay);
}
