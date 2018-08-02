package com.naver.jaebee2002.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class SalaryRoll {
	private String yyyy;
	private String mm;
	private String empno;
	private String dept;
	private String name;
	private int partner;
	private int dependent20;
	private int dependent60;
	private int disabled;
	private int womanpower;
	private int pay12;
	private int sumpay;
	private int incomededuction;
	private int incomeamount;
	private int personaldeduction;
	private int annuityinsurance;
	private int specialdeduction;
	private int standardamount;
	private int calculatedtax;
	private int incometaxdeduction;
	private int decidedtax;
	private int simpletax;
	private int finalpay;
}
