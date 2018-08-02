package com.naver.jaebee2002.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class Pay {
	private int seq;
	private String vendcode;
	private String vendname;
	private String yyyy;
	private String mm;
	private String dd;
	private int no;
	private int hang;
	private int amount;
	private int beforeamount;
	private int total;
	private String payway;
	private String beforepayway;
	private String memo;
	private String balancecolumn;
	private String paycolumn;
	private String paywaycolumn;
}
