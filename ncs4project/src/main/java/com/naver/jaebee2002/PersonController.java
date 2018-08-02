package com.naver.jaebee2002;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.naver.jaebee2002.entities.Person;
import com.naver.jaebee2002.service.PersonDao;

@Controller
public class PersonController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/person", method = RequestMethod.GET)
	public String person() {
		return "person";
	}
	@RequestMapping(value = "/personinsert", method = RequestMethod.POST)
	public String personInsert(Model model, @ModelAttribute Person person) {
		PersonDao dao = sqlSession.getMapper(PersonDao.class);
		dao.insertRow(person);
		model.addAttribute("msg", "clear");
		return "member/member_result";
	}
}
