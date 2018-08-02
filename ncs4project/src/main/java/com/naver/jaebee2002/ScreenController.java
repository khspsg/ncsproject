package com.naver.jaebee2002;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ScreenController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/currentscreenform", method = RequestMethod.GET)
	public String currentscreenForm() {
		return "movie/currentscreen";
	}
	@RequestMapping(value = "/trailer", method = RequestMethod.GET)
	public String trailer() {
		return "movie/trailer";
	}
}
