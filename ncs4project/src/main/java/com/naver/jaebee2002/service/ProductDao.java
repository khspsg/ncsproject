package com.naver.jaebee2002.service;

import java.util.ArrayList;

import com.naver.jaebee2002.entities.Buy;
import com.naver.jaebee2002.entities.Product;

public interface ProductDao {
	int insertRow(Product product);
	int updateRow(Product product);
	int deleteRow(String code);
	int selectConfirm(String code);
	ArrayList<Product> selectAll();
	Product selectOne(String code);
	void buyProductAdd(Buy buy);
	void buyProductStockSub(Buy buy);
}
