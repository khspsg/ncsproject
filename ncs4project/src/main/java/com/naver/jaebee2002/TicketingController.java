package com.naver.jaebee2002;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TicketingController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/ticketingform", method = RequestMethod.GET)
	public String ticketingForm() {
		return "ticketing/ticketing_form";
	}
	@RequestMapping(value = "/schedule", method = RequestMethod.GET)
	public String schedule() {
		return "ticketing/schedule";
	}
}
