package com.naver.jaebee2002;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EventController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/store", method = RequestMethod.GET)
	public String store() {
		return "event/store";
	}
	@RequestMapping(value = "/movieevent", method = RequestMethod.GET)
	public String movieevent() {
		return "event/movieevent";
	}
	@RequestMapping(value = "/preview", method = RequestMethod.GET)
	public String preview() {
		return "event/preview";
	}
	@RequestMapping(value = "/adiscount", method = RequestMethod.GET)
	public String adiscount() {
		return "event/affiliatediscount";
	}
}
