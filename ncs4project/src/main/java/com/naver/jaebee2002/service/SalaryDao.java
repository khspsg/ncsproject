package com.naver.jaebee2002.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.naver.jaebee2002.entities.Salary;
import com.naver.jaebee2002.entities.SalaryRoll;

public interface SalaryDao {
	ArrayList<Salary> selectAll();
	ArrayList<Salary> selectY();
	ArrayList<SalaryRoll> rollselectAll(SalaryRoll salaryroll);
	int insertRow(Salary salary);
	void salaryrollinsertRow(SalaryRoll salaryroll);
	int updateRow(Salary salary);
	int deleteRow(String empno);
	int salaryrollDelete(HashMap rollkey);
	int selectConfirm(String empno);
	Salary selectOne(String empno);
}
