package com.naver.jaebee2002.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class Salary {
	private String empno;
	private String dept;
	private String name;
	private String input_date;
	private String birth_date;
	private int partner;
	private int dependent20;
	private int dependent60;
	private int disabled;
	private int womanpower;
	private int pay;
	private int extra;
	private String yn;
	private String dept_name;
}
