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

import com.naver.jaebee2002.entities.Product;
import com.naver.jaebee2002.service.ProductDao;

@Controller
public class ProductController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/productinsertform", method = RequestMethod.GET)
	public String productInsertForm() {
		return "product/product_insert_form";
	}
	@RequestMapping(value = "/productsearch", method = RequestMethod.GET)
	public String productSearch(Model model) {
		ProductDao dao = sqlSession.getMapper(ProductDao.class);
		ArrayList<Product> products = dao.selectAll();
		model.addAttribute("products", products);
		return "product/product_search";
	}
	@RequestMapping(value = "/productinsert", method = RequestMethod.POST)
	public String salaryInsert(@ModelAttribute Product product) {
		ProductDao dao = sqlSession.getMapper(ProductDao.class);
		dao.insertRow(product);
		return "redirect:productsearch";
	}
	@RequestMapping(value = "/productupdateform", method = RequestMethod.GET)
	public String productUpdateForm(Model model, @RequestParam String code) {
		ProductDao dao = sqlSession.getMapper(ProductDao.class);
		Product product = dao.selectOne(code);
		model.addAttribute("product", product);
		return "product/product_update_form";
	}
	@RequestMapping(value = "/productupdate", method = RequestMethod.POST)
	public String updateInsert(@ModelAttribute Product product) {
		ProductDao dao = sqlSession.getMapper(ProductDao.class);
		dao.updateRow(product);
		return "redirect:productsearch";
	}
	@RequestMapping(value = "/productdelete", method = RequestMethod.GET)
	public String productDelete(@RequestParam String code) {
		ProductDao dao = sqlSession.getMapper(ProductDao.class);
		dao.deleteRow(code);
		return "redirect:productsearch";
	}
	@RequestMapping(value = "/productconfirm", method = RequestMethod.POST)
	@ResponseBody
	public int productConfirm(@RequestParam String code) {
		ProductDao dao = sqlSession.getMapper(ProductDao.class);
		int exists = 0;
		try {
			exists=dao.selectConfirm(code);
		} catch (Exception e) {
			System.out.println("error:"+e.getMessage());
		}
		return exists;
	}
}
