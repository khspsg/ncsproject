package com.naver.jaebee2002.service;

import java.util.ArrayList;

import com.naver.jaebee2002.entities.User;

public interface UserDao {
	int selectConfirm(String code);
	int insertRow(User user);
	User selectOne(String code);
	ArrayList<User> selectAll();
}
