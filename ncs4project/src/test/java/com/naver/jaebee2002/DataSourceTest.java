package com.naver.jaebee2002;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.naver.jaebee2002.entities.Member;
import com.naver.jaebee2002.service.MemberDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class DataSourceTest {
	@Autowired
	private SqlSession sqlSession;
	@Test
	public void testConnection()throws Exception{
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		ArrayList<Member> members=dao.selectAll();
		System.out.println("aaaaaaa"+members.size());
	}
}
