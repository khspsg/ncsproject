package com.naver.jaebee2002;

import java.awt.Font;
import java.io.File;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.entity.StandardEntityCollection;
import org.jfree.chart.labels.PieSectionLabelGenerator;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.PiePlot;
import org.jfree.data.general.DefaultPieDataset;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.jaebee2002.entities.Balance;
import com.naver.jaebee2002.entities.Buy;
import com.naver.jaebee2002.entities.BuySearchBean;
import com.naver.jaebee2002.entities.Pay;
import com.naver.jaebee2002.entities.Product;
import com.naver.jaebee2002.entities.Vender;
import com.naver.jaebee2002.service.BuyDao;
import com.naver.jaebee2002.service.DistributionDao;
import com.naver.jaebee2002.service.PayDao;
import com.naver.jaebee2002.service.ProductDao;
import com.naver.jaebee2002.service.VenderDao;

@Controller
public class Distribution {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private Balance balance;
	@Autowired
	private Buy buy;
	@Autowired
	private Product product;
	@Autowired
	private BuySearchBean buysearchbean;
	@Autowired
	private Pay pay;
	
	@RequestMapping(value = "/balancesearchform", method = RequestMethod.GET)
	public String balanceSearchForm() {
		return "balance/balance_search";
	}
	@RequestMapping(value = "/balancesearch", method = RequestMethod.GET)
	public ModelAndView balanceSearch(Model model, @RequestParam String yyyy) {
		balance.setYyyy(yyyy);
		DistributionDao dao = sqlSession.getMapper(DistributionDao.class);
		ArrayList<Balance> balances = dao.selectAll(balance);
		model.addAttribute("y",balance.getYyyy());
		ModelAndView mav = new ModelAndView("balance/balance_search");
		mav.addObject("balances", balances);
		return mav;
	}
	@RequestMapping(value = "/balancedetail", method = RequestMethod.GET)
	public String balanceDetail(Model model, @RequestParam String yyyy, @RequestParam String vendcode) {
		DistributionDao dao = sqlSession.getMapper(DistributionDao.class);
		HashMap rollkey = new HashMap();
		rollkey.putIfAbsent("yyyy", yyyy);
		rollkey.putIfAbsent("vendcode", vendcode);
		Balance balance = dao.selectOne(rollkey);
		model.addAttribute("balance", balance);
		return "balance/balance_detail";
	}
	@RequestMapping(value = "/balanceupdateform", method = RequestMethod.GET)
	public String balanceUpdateForm(Model model, @RequestParam String yyyy, @RequestParam String vendcode) {
		DistributionDao dao = sqlSession.getMapper(DistributionDao.class);
		HashMap rollkey = new HashMap();
		rollkey.putIfAbsent("yyyy", yyyy);
		rollkey.putIfAbsent("vendcode", vendcode);
		Balance balance = dao.selectOne(rollkey);
		model.addAttribute("balance", balance);
		return "balance/balance_update_form";
	}
	@RequestMapping(value = "/balanceupdate", method = RequestMethod.POST)
	public String balanceUpdate(@ModelAttribute Balance balance, RedirectAttributes redirectAttributes) {
		DistributionDao dao = sqlSession.getMapper(DistributionDao.class);
		dao.updateRow(balance);
//		redirectAttributes.addAttribute("yyyy","");
		return "redirect:balancesearchform";
	}
	@RequestMapping(value = "/buyinsertform", method = RequestMethod.GET)
	public String buyinsertForm(Model model, @ModelAttribute Buy buy, @ModelAttribute("buys") ArrayList<Buy> buys, @ModelAttribute("buysearchbean") BuySearchBean buysearchbean, @ModelAttribute("redirectchk") String redirectchk) {
		ProductDao prodao = sqlSession.getMapper(ProductDao.class);
		VenderDao vendao = sqlSession.getMapper(VenderDao.class);
		BuyDao buydao = sqlSession.getMapper(BuyDao.class);
		ArrayList<Product> products = prodao.selectAll();
		ArrayList<Vender> venders = vendao.selectAll();
		model.addAttribute("products",products);
		model.addAttribute("venders",venders);
		model.addAttribute("buy",buy);
		HashMap buysearch = new HashMap();
		buysearch.put("vendcode", buy.getVendcode());
		buysearch.put("yyyy", buy.getYyyy());
		buysearch.put("mm", buy.getMm());
		buysearch.put("dd", buy.getDd());
		if(redirectchk.equals("insert")) {
			buys = buydao.selectAll(buysearch);
		}
//		ArrayList<Buy> buys = buydao.selectAll(buysearch);
		model.addAttribute("buys", buys);
		model.addAttribute("vn", buysearchbean.getSearchvender());
		model.addAttribute("y", buysearchbean.getSearchyyyy());
		model.addAttribute("m", buysearchbean.getSearchmm());
		model.addAttribute("d", buysearchbean.getSearchdd());
		return "distribution/buy_insert_form";
	}
	@RequestMapping(value = "/buynew", method = RequestMethod.POST)
	@ResponseBody
	public Buy buyNew(@RequestParam String vendcode) {
		BuyDao dao = sqlSession.getMapper(BuyDao.class);
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		String date = sm.format(new Date());
		buy.setVendcode(vendcode);
		buy.setYyyy(date.substring(0, 4));
		buy.setMm(date.substring(5,7));
		buy.setDd(date.substring(8,10));
		buy.setNo(dao.selectSequenceNo(buy));
		buy.setHang(1);
		return buy;
	}
	@RequestMapping(value = "/buyinsert", method = RequestMethod.POST)
	public String buyInsert(@ModelAttribute Buy buy, RedirectAttributes redirectAttributes) {
		BuyDao dao = sqlSession.getMapper(BuyDao.class);
		ProductDao prodao = sqlSession.getMapper(ProductDao.class);
		DistributionDao disdao = sqlSession.getMapper(DistributionDao.class);
		dao.insertRow(buy);
		buy.setProcolumn("buy"+buy.getMm());
		prodao.buyProductAdd(buy);
		buy.setBalancecolumn("balance"+buy.getMm());
		buy.setDealcolumn("deal"+buy.getMm());
		disdao.buyBalanceAdd(buy);
		buy.setHang(buy.getHang() + 1);
		redirectAttributes.addFlashAttribute("buy",buy);
		redirectAttributes.addFlashAttribute("redirectchk","insert");
		return "redirect:buyinsertform";
	}
	@RequestMapping(value = "/productselected", method = RequestMethod.POST)
	@ResponseBody
	public Product productSelected(@RequestParam String procode) {
		ProductDao dao = sqlSession.getMapper(ProductDao.class);
		product = dao.selectOne(procode);
		return product;
	}
	@RequestMapping(value = "/buysearch", method = RequestMethod.GET)
	public String buySearch(Model model, @ModelAttribute("buysearchbean") BuySearchBean buysearchbean, RedirectAttributes redirectAttributes) {
		BuyDao dao = sqlSession.getMapper(BuyDao.class);
		HashMap buysearch = new HashMap();
		buysearch.put("vendcode", buysearchbean.getSearchvender());
		buysearch.put("yyyy", buysearchbean.getSearchyyyy());
		buysearch.put("mm", String.format("%02d", Integer.parseInt(buysearchbean.getSearchmm())));
		buysearch.put("dd", String.format("%02d", Integer.parseInt(buysearchbean.getSearchdd())));
		ArrayList<Buy> buys;
		if(buysearchbean.getSearchdd().equals("0")) {
			buys = dao.selectBuySearch(buysearch);
		}else {
			buys = dao.selectAll(buysearch);
		}
		redirectAttributes.addFlashAttribute("buys", buys);
		redirectAttributes.addFlashAttribute("buysearchbean", buysearchbean);
		redirectAttributes.addFlashAttribute("redirectchk", "search");
		return "redirect:buyinsertform";
	}
	@RequestMapping(value = "/buydetail", method = RequestMethod.POST)
	@ResponseBody
	public Buy buyDetail(@RequestParam int seq) {
		BuyDao dao = sqlSession.getMapper(BuyDao.class);
		buy = dao.selectRow(seq);
		return buy;
	}
	@RequestMapping(value = "/buyupdate", method = RequestMethod.POST)
	public String buyUpdate(@ModelAttribute Buy buy, RedirectAttributes redirectAttributes) {
		BuyDao dao = sqlSession.getMapper(BuyDao.class);
		ProductDao prodao = sqlSession.getMapper(ProductDao.class);
		DistributionDao disdao = sqlSession.getMapper(DistributionDao.class);
		buysearchbean.setSearchvender(buy.getVendcode());
		buysearchbean.setSearchyyyy(buy.getYyyy());
		buysearchbean.setSearchmm(buy.getMm());
		buysearchbean.setSearchdd(buy.getDd());
		dao.updateRow(buy);
		buy.setProcolumn("buy"+buy.getMm());
		buy.setBalancecolumn("balance"+buy.getMm());
		buy.setDealcolumn("deal"+buy.getMm());
		prodao.buyProductStockSub(buy);
		prodao.buyProductAdd(buy);
		disdao.buyBalanceSub(buy);
		disdao.buyBalanceAdd(buy);
		redirectAttributes.addFlashAttribute("buysearchbean", buysearchbean);
		return "redirect:buysearch";
	}
	@RequestMapping(value = "/buydelete", method = RequestMethod.POST)
	public String buyDelete(@ModelAttribute Buy buy, RedirectAttributes redirectAttributes) {
		BuyDao dao = sqlSession.getMapper(BuyDao.class);
		ProductDao prodao = sqlSession.getMapper(ProductDao.class);
		DistributionDao disdao = sqlSession.getMapper(DistributionDao.class);
		buysearchbean.setSearchvender(buy.getVendcode());
		buysearchbean.setSearchyyyy(buy.getYyyy());
		buysearchbean.setSearchmm(buy.getMm());
		buysearchbean.setSearchdd(buy.getDd());
		dao.deleteRow(buy);
		buy.setProcolumn("buy"+buy.getMm());
		buy.setBalancecolumn("balance"+buy.getMm());
		buy.setDealcolumn("deal"+buy.getMm());
		prodao.buyProductStockSub(buy);
		disdao.buyBalanceSub(buy);
		redirectAttributes.addFlashAttribute("buysearchbean", buysearchbean);
		return "redirect:buysearch";
	}
	@RequestMapping(value = "/payinsertform", method = RequestMethod.GET)
	public String payInsertForm(Model model, @ModelAttribute Pay pay, @ModelAttribute("buysearchbean") BuySearchBean buysearchbean, @ModelAttribute("pays") ArrayList<Pay> pays, @ModelAttribute("redirectchk") String redirectchk) {
		PayDao paydao = sqlSession.getMapper(PayDao.class);
		VenderDao vendao = sqlSession.getMapper(VenderDao.class);
		ArrayList<Vender> venders = vendao.selectAll();
		model.addAttribute("venders",venders);
		model.addAttribute("pay",pay);
		HashMap buysearch = new HashMap();
		buysearch.put("vendcode", pay.getVendcode());
		buysearch.put("yyyy", pay.getYyyy());
		buysearch.put("mm", pay.getMm());
		buysearch.put("dd", pay.getDd());
		if(redirectchk.equals("insert")) {
			pays = paydao.selectAll(buysearch);
		}
		model.addAttribute("pays",pays);
		model.addAttribute("vn", buysearchbean.getSearchvender());
		model.addAttribute("y", buysearchbean.getSearchyyyy());
		model.addAttribute("m", buysearchbean.getSearchmm());
		model.addAttribute("d", buysearchbean.getSearchdd());
		return "distribution/pay_insert_form";
	}
	@RequestMapping(value = "/paynew", method = RequestMethod.POST)
	@ResponseBody
	public Pay payNew(@RequestParam String vendcode) {
		PayDao dao = sqlSession.getMapper(PayDao.class);
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		String date = sm.format(new Date());
		pay.setVendcode(vendcode);
		pay.setYyyy(date.substring(0, 4));
		pay.setMm(date.substring(5,7));
		pay.setDd(date.substring(8,10));
		pay.setNo(dao.selectSequenceNo(pay));
		pay.setHang(1);
		return pay;
	}
	@RequestMapping(value = "/payinsert", method = RequestMethod.POST)
	public String payInsert(@ModelAttribute Pay pay, RedirectAttributes redirectAttributes) {
		PayDao dao = sqlSession.getMapper(PayDao.class);
		DistributionDao disdao = sqlSession.getMapper(DistributionDao.class);
		dao.insertRow(pay);
		pay.setHang(pay.getHang() + 1);
		pay.setBalancecolumn("balance"+pay.getMm());
		pay.setPaycolumn("pay"+pay.getMm());
		pay.setPaywaycolumn(pay.getPayway()+pay.getMm());
		disdao.payBalanceAdd(pay);
		redirectAttributes.addFlashAttribute("pay",pay);
		redirectAttributes.addFlashAttribute("redirectchk","insert");
		return "redirect:payinsertform";
	}
	@RequestMapping(value = "/paysearch", method = RequestMethod.GET)
	public String paySearch(Model model, @ModelAttribute("buysearchbean") BuySearchBean buysearchbean, RedirectAttributes redirectAttributes) {
		PayDao dao = sqlSession.getMapper(PayDao.class);
		HashMap buysearch = new HashMap();
		buysearch.put("vendcode", buysearchbean.getSearchvender());
		buysearch.put("yyyy", buysearchbean.getSearchyyyy());
		buysearch.put("mm", String.format("%02d", Integer.parseInt(buysearchbean.getSearchmm())));
		buysearch.put("dd", String.format("%02d", Integer.parseInt(buysearchbean.getSearchdd())));
		ArrayList<Pay> pays;
		if(buysearchbean.getSearchdd().equals("0")) {
			pays = dao.selectPaySearch(buysearch);
		}else {
			pays = dao.selectAll(buysearch);
		}
		redirectAttributes.addFlashAttribute("pays", pays);
		redirectAttributes.addFlashAttribute("buysearchbean", buysearchbean);
		redirectAttributes.addFlashAttribute("redirectchk", "search");
		return "redirect:payinsertform";
	}
	@RequestMapping(value = "/paydetail", method = RequestMethod.POST)
	@ResponseBody
	public Pay payDetail(@RequestParam int seq) {
		PayDao dao = sqlSession.getMapper(PayDao.class);
		pay = dao.selectRow(seq);
		return pay;
	}
	@RequestMapping(value = "/payupdate", method = RequestMethod.POST)
	public String payUpdate(@ModelAttribute Pay pay, RedirectAttributes redirectAttributes) {
		PayDao dao = sqlSession.getMapper(PayDao.class);
		DistributionDao disdao = sqlSession.getMapper(DistributionDao.class);
		buysearchbean.setSearchvender(pay.getVendcode());
		buysearchbean.setSearchyyyy(pay.getYyyy());
		buysearchbean.setSearchmm(pay.getMm());
		buysearchbean.setSearchdd(pay.getDd());
		dao.updateRow(pay);
		pay.setBalancecolumn("balance"+pay.getMm());
		pay.setPaycolumn("pay"+pay.getMm());
		pay.setPaywaycolumn(pay.getBeforepayway()+pay.getMm());
		disdao.payBalanceSub(pay);
		pay.setPaywaycolumn(pay.getPayway()+pay.getMm());
		disdao.payBalanceAdd(pay);
		redirectAttributes.addFlashAttribute("buysearchbean", buysearchbean);
		return "redirect:paysearch";
	}
	@RequestMapping(value = "/paydelete", method = RequestMethod.POST)
	public String payDelete(@ModelAttribute Pay pay, RedirectAttributes redirectAttributes) {
		PayDao dao = sqlSession.getMapper(PayDao.class);
		DistributionDao disdao = sqlSession.getMapper(DistributionDao.class);
		buysearchbean.setSearchvender(pay.getVendcode());
		buysearchbean.setSearchyyyy(pay.getYyyy());
		buysearchbean.setSearchmm(pay.getMm());
		buysearchbean.setSearchdd(pay.getDd());
		dao.deleteRow(pay);
		pay.setBalancecolumn("balance"+pay.getMm());
		pay.setPaycolumn("pay"+pay.getMm());
		pay.setPaywaycolumn(pay.getPayway()+pay.getMm());
		disdao.payBalanceSub(pay);
		redirectAttributes.addFlashAttribute("buysearchbean", buysearchbean);
		return "redirect:paysearch";
	}
	@RequestMapping(value = "/jfreechart", method = RequestMethod.GET)
	public String payjfreechart(Model model) {
		String chartpath = "";
		final DefaultPieDataset data = new DefaultPieDataset();
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		String date = sm.format(new Date());
		String yyyy = date.substring(0, 4);
		DistributionDao dao = sqlSession.getMapper(DistributionDao.class);
		ArrayList<Balance> balances = dao.balanceListYYYY(yyyy);
		for(Balance balance : balances) {
			data.setValue(balance.getVendname(), balance.getDealtot());
		}
		JFreeChart chart = ChartFactory.createPieChart("Pie Chart", data, true, true, false);
		chart.getTitle().setFont(new Font("굴림", Font.BOLD,15));
		chart.getLegend().setItemFont(new Font("굴림", Font.TRUETYPE_FONT, 12));
		PiePlot plot = (PiePlot) chart.getPlot();
		plot.setLabelFont(new Font("굴림",Font.TRUETYPE_FONT,12));
		PieSectionLabelGenerator  gen = new StandardPieSectionLabelGenerator("{0}: {1} ({2})", new DecimalFormat("0"), new DecimalFormat("0%"));
	    plot.setLabelGenerator(gen);
		try {
			final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
			final File file = new File("D:/ncs4webproject/ncs4project/src/main/webapp/resources/jfreechart/piechart.png");
			chartpath = "resources/jfreechart/"+file.getName();
			ChartUtilities.saveChartAsJPEG(file, chart, 600, 400, info);
			model.addAttribute("chartpath", chartpath);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "distribution/jfreechart_view";
	}
}
