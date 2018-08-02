package com.naver.jaebee2002;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.naver.jaebee2002.entities.User;
import com.naver.jaebee2002.service.UserDao;

@Controller
public class UserController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private User user;
	
	@RequestMapping(value = "/userinsertform", method = RequestMethod.GET)
	public String userInsertForm() {
		return "member/user_insert_form";
	}
	@RequestMapping(value = "/userconfirm", method = RequestMethod.POST)
	@ResponseBody
	public int userConfirm(@RequestParam String code) {
		UserDao dao = sqlSession.getMapper(UserDao.class);
		int exists = 0;
		try {
			exists=dao.selectConfirm(code);
		} catch (Exception e) {
			System.out.println("error:"+e.getMessage());
		}
		return exists;
	}
	@RequestMapping(value = "/userinsert", method = RequestMethod.POST)
	public String userInsert(@ModelAttribute User user) {
		UserDao dao = sqlSession.getMapper(UserDao.class);
		try {
			int result = dao.insertRow(user);
			System.out.println(result);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "member/user_insert_form";
	}
	@RequestMapping(value = "/usersearch", method = RequestMethod.GET)
	public String userSearch(Model model) {
		UserDao dao = sqlSession.getMapper(UserDao.class);
		ArrayList<User> users = dao.selectAll();
		model.addAttribute("users",users);
		return "member/user_search";
	}
	@RequestMapping(value = "/userupdateform", method = RequestMethod.GET)
	public String userUpdateForm(Model model, @RequestParam String code) {
		UserDao dao = sqlSession.getMapper(UserDao.class);
		User user = dao.selectOne(code);
		model.addAttribute("user", user);
		return "member/user_update_form";
	}
}
