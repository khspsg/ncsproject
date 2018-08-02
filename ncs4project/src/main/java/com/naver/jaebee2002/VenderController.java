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

import com.naver.jaebee2002.entities.Vender;
import com.naver.jaebee2002.service.VenderDao;

@Controller
public class VenderController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/venderinsertform", method = RequestMethod.GET)
	public String venderInsertForm() {
		return "vender/vender_insert_form";
	}
	@RequestMapping(value = "/venderconfirm", method = RequestMethod.POST)
	@ResponseBody
	public int venderConfirm(@RequestParam String code) {
		VenderDao dao = sqlSession.getMapper(VenderDao.class);
		int exists = 0;
		try {
			exists=dao.selectConfirm(code);
		} catch (Exception e) {
			System.out.println("error:"+e.getMessage());
		}
		return exists;
	}
	@RequestMapping(value = "/venderinsert", method = RequestMethod.POST)
	public String venderInsert(@ModelAttribute Vender vender) {
		VenderDao dao = sqlSession.getMapper(VenderDao.class);
		dao.insertRow(vender);
		return "redirect:vendersearch";
	}
	@RequestMapping(value = "/vendersearch", method = RequestMethod.GET)
	public String venderSearch(Model model) {
		VenderDao dao = sqlSession.getMapper(VenderDao.class);
		ArrayList<Vender> venders = dao.selectAll();
		model.addAttribute("venders", venders);
		return "vender/vender_search";
	}
	@RequestMapping(value = "/venderupdateform", method = RequestMethod.GET)
	public String venderUpdateForm(Model model, @RequestParam String code) {
		VenderDao dao = sqlSession.getMapper(VenderDao.class);
		Vender vender = dao.selectOne(code);
		model.addAttribute("vender", vender);
		return "vender/vender_update_form";
	}
	@RequestMapping(value = "/venderupdate", method = RequestMethod.POST)
	public String updateInsert(@ModelAttribute Vender vender) {
		VenderDao dao = sqlSession.getMapper(VenderDao.class);
		dao.updateRow(vender);
		return "redirect:vendersearch";
	}
	@RequestMapping(value = "/venderdelete", method = RequestMethod.GET)
	public String venderDelete(@RequestParam String code) {
		VenderDao dao = sqlSession.getMapper(VenderDao.class);
		dao.deleteRow(code);
		return "redirect:vendersearch";
	}
}
