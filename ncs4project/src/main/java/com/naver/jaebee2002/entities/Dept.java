package com.naver.jaebee2002.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class Dept {
	private String code;
	private String name;
}
