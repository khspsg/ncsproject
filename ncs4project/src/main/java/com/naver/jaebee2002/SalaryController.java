package com.naver.jaebee2002;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.jaebee2002.entities.Dept;
import com.naver.jaebee2002.entities.Salary;
import com.naver.jaebee2002.entities.SalaryRoll;
import com.naver.jaebee2002.service.DeptDao;
import com.naver.jaebee2002.service.SalaryDao;

@Controller
public class SalaryController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private SalaryRoll salaryroll;
	
	@RequestMapping(value = "/salaryinsertform", method = RequestMethod.GET)
	public String salaryInsertForm(Model model) {
		DeptDao dao = sqlSession.getMapper(DeptDao.class);
		ArrayList<Dept> depts = dao.selectDept();
		model.addAttribute("depts", depts);
		return "salary/salary_insert_form";
	}
	@RequestMapping(value = "/salarysearch", method = RequestMethod.GET)
	public String salarySearch(Model model) {
		SalaryDao dao = sqlSession.getMapper(SalaryDao.class);
		ArrayList<Salary> salarys = dao.selectAll();
		model.addAttribute("salarys", salarys);
		return "salary/salary_search";
	}
	@RequestMapping(value = "/salaryinsert", method = RequestMethod.POST)
	public String salaryInsert(@ModelAttribute Salary salary) {
		SalaryDao dao = sqlSession.getMapper(SalaryDao.class);
		dao.insertRow(salary);
		return "redirect:salarysearch";
	}
	@RequestMapping(value = "/salaryconfirm", method = RequestMethod.POST)
	@ResponseBody
	public int salaryConfirm(@RequestParam String empno) {
		SalaryDao dao = sqlSession.getMapper(SalaryDao.class);
		int exists = 0;
		try {
			exists=dao.selectConfirm(empno);
		} catch (Exception e) {
			System.out.println("error:"+e.getMessage());
		}
		return exists;
	}
	@RequestMapping(value = "/salaryupdateform", method = RequestMethod.GET)
	public String salaryUpdateForm(Model model, @RequestParam String empno) {
		SalaryDao dao = sqlSession.getMapper(SalaryDao.class);
		Salary salary = dao.selectOne(empno);
		model.addAttribute("salary", salary);
		DeptDao dao2 = sqlSession.getMapper(DeptDao.class);
		ArrayList<Dept> depts = dao2.selectDept();
		model.addAttribute("depts", depts);
		return "salary/salary_update_form";
	}
	@RequestMapping(value = "/salaryupdate", method = RequestMethod.POST)
	public String salaryUpdate(@ModelAttribute Salary salary) {
		SalaryDao dao = sqlSession.getMapper(SalaryDao.class);
		dao.updateRow(salary);
		return "redirect:salarysearch";
	}
	@RequestMapping(value = "/salarydelete", method = RequestMethod.GET)
	public String salaryDelete(Model model, @RequestParam String empno) {
		SalaryDao dao = sqlSession.getMapper(SalaryDao.class);
		dao.deleteRow(empno);
		return "redirect:salarysearch";
	}
	@RequestMapping(value = "/salarytaxform", method = RequestMethod.GET)
	public String salaryTaxForm(Model model) {
		Calendar cal = Calendar.getInstance();
		int yyyy = cal.get(Calendar.YEAR);
		model.addAttribute("yyyy", yyyy+"");
		return "salary/salary_tax";
	}
	@RequestMapping(value = "/salarytax", method = RequestMethod.POST)
	public String salaryTax(@RequestParam String yyyy, @RequestParam String mm) {
		SalaryDao dao = sqlSession.getMapper(SalaryDao.class);
		mm = String.format("%02d", Integer.parseInt(mm));
		HashMap rollkey = new HashMap();
		rollkey.putIfAbsent("yyyy", yyyy);
		rollkey.putIfAbsent("mm", mm);
		dao.salaryrollDelete(rollkey);
		ArrayList<Salary> salarys = dao.selectY();
		for(Salary salary: salarys) {
			salaryroll.setYyyy(yyyy);
			salaryroll.setMm(mm);
			salaryroll.setEmpno(salary.getEmpno());
			salaryroll.setDept(salary.getDept());
			salaryroll.setName(salary.getName());
			salaryroll.setPartner(salary.getPartner());
			salaryroll.setDependent20(salary.getDependent20());
			salaryroll.setDependent60(salary.getDependent60());
			salaryroll.setDisabled(salary.getDisabled());
			salaryroll.setWomanpower(salary.getWomanpower());
			int specialdeduction = 0;
			int pay12 = (salary.getPay()+salary.getExtra())*12;
			salaryroll.setPay12(pay12);
			int incomededuction = 0;
			if(pay12 <=5000000) {
				incomededuction = (int) (pay12 *0.7);
			}else if(pay12 <= 15000000) {
				incomededuction = (int) (3500000 + ((pay12 - 5000000)*0.4));
			}else if(pay12 <= 45000000) {
				incomededuction = (int) (7500000 + ((pay12 - 15000000)*0.15));
			}else if(pay12 <= 100000000) {
				incomededuction = (int) (12000000 + ((pay12 - 45000000)*0.05));
			}else {
				incomededuction = (int) (14750000 + ((pay12 - 100000000)*0.02));
			}
			salaryroll.setIncomededuction(incomededuction);
			salaryroll.setIncomeamount(pay12 - incomededuction);
			int deducount = 1 + salary.getPartner() + (salary.getDependent20()*2) + salary.getDependent60() + salary.getDisabled() + salary.getWomanpower();
			int personaldeduction = deducount * 1500000;
			salaryroll.setPersonaldeduction(personaldeduction);
			int annuityinsurance = 0;
			annuityinsurance = (int) ((salary.getPay() + salary.getExtra()) * 0.001);
			annuityinsurance = annuityinsurance * 1000;
			annuityinsurance = (int) (annuityinsurance * 0.045);
			annuityinsurance = annuityinsurance * 12;
			if(annuityinsurance <= 135000) {
				annuityinsurance = 135000;
			}
			if(annuityinsurance >= 2149200) {
				annuityinsurance = 2149200;
			}
			salaryroll.setAnnuityinsurance(annuityinsurance);
			if(deducount == 1) {
				if(pay12 <= 30000000) {
					specialdeduction = (int) (3100000 + (pay12 * 0.04));
				}else if(pay12 > 30000000 && pay12 <= 45000000) {
					specialdeduction = (int) (3100000 + (pay12 * 0.04) - ((pay12 - 30000000) * 0.05));
				}else if(pay12 > 45000000 && pay12 <= 70000000) {
					specialdeduction = (int) (3100000 + (pay12 * 0.015));
				}else if(pay12 > 70000000 && pay12 <= 120000000) {
					specialdeduction = (int) (3100000 + (pay12 * 0.005));
				}
			}else if(deducount == 2) {
				if(pay12 <= 30000000) {
					specialdeduction = (int) (3600000 + (pay12 * 0.04));
				}else if(pay12 > 30000000 && pay12 <= 45000000) {
					specialdeduction = (int) (3600000 + (pay12 * 0.04) - ((pay12 - 30000000) * 0.05));
				}else if(pay12 > 45000000 && pay12 <= 70000000) {
					specialdeduction = (int) (3600000 + (pay12 * 0.02));
				}else if(pay12 > 70000000 && pay12 <= 120000000) {
					specialdeduction = (int) (3600000 + (pay12 * 0.01));
				}
			}else {
				if(pay12 <= 30000000) {
					specialdeduction = (int) (5000000 + (pay12 * 0.07));
				}else if(pay12 > 30000000 && pay12 <= 45000000) {
					specialdeduction = (int) (5000000 + (pay12 * 0.07) - ((pay12 - 30000000) * 0.05));
				}else if(pay12 > 45000000 && pay12 <= 70000000) {
					specialdeduction = (int) (5000000 + (pay12 * 0.05));
				}else if(pay12 > 70000000 && pay12 <= 120000000) {
					specialdeduction = (int) (5000000 + (pay12 * 0.03));
				}
				specialdeduction += (pay12 - 40000000) * 0.04;
			}
			salaryroll.setSpecialdeduction(specialdeduction);
			int standardamount = pay12 - (incomededuction + personaldeduction + specialdeduction + annuityinsurance);
			salaryroll.setStandardamount(standardamount);
			int calculatedtax = 0;
			if(standardamount <= 12000000) {
				calculatedtax = (int) (standardamount * 0.06);
			}else if(standardamount <= 46000000) {
				calculatedtax = (int) (720000 + (standardamount - 12000000) * 0.15);
			}else if(standardamount <= 88000000) {
				calculatedtax = (int) (5820000 + (standardamount - 46000000) * 0.24);
			}else if(standardamount <= 150000000) {
				calculatedtax = (int) (15900000 + (standardamount - 88000000) * 0.35);
			}else {
				calculatedtax = (int) (37600000 + (standardamount - 150000000) * 0.38);
			}
			salaryroll.setCalculatedtax(calculatedtax);
			int incometaxdeduction = 0;
			if(calculatedtax <= 500000) {
				incometaxdeduction = (int) (calculatedtax * 0.55);
			}else {
				incometaxdeduction = (int) (275000 + ((calculatedtax - 500000) * 0.3));
				if(pay12 <= 55000000) {
					incometaxdeduction = Math.min(incometaxdeduction, 660000);
				}else if(pay12 > 55000000 && pay12 <= 70000000) {
					incometaxdeduction = Math.min(incometaxdeduction, 630000);
				}else if(pay12 > 70000000) {
					incometaxdeduction = Math.min(incometaxdeduction, 500000);
				}
			}
			salaryroll.setIncometaxdeduction(incometaxdeduction);
			int decidedtax = calculatedtax - incometaxdeduction;
			int simpletax = decidedtax / 12;
			simpletax = (int) (simpletax * 0.1);
			simpletax = simpletax * 10;
			salaryroll.setDecidedtax(decidedtax);
			salaryroll.setSimpletax(simpletax);
			dao.salaryrollinsertRow(salaryroll);
		}
		return "redirect:index";
	}
	@RequestMapping(value = "/salaryrollsearchform", method = RequestMethod.GET)
	public String salaryrollSearchForm() {
		return "salary/salaryroll_search";
	}
	@RequestMapping(value = "/salaryrollsearch", method = RequestMethod.POST)
	public ModelAndView salaryrollSearch(Model model, @RequestParam String yyyy, @RequestParam String mm) {
		salaryroll.setYyyy(yyyy);
		salaryroll.setMm("0"+mm);
//		System.out.println(salaryroll.getMm());
		SalaryDao dao = sqlSession.getMapper(SalaryDao.class);
		ArrayList<SalaryRoll> salaryrolls = dao.rollselectAll(salaryroll);
		ModelAndView mav = new ModelAndView("salary/salaryroll_search");
		mav.addObject("salaryrolls", salaryrolls);
		return mav;
//		model.addAttribute("salaryroll", salaryroll);
//		return "redirect:salaryrollsearch";
	}
}
