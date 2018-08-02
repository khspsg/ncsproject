package com.naver.jaebee2002;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.naver.jaebee2002.entities.Member;
import com.naver.jaebee2002.service.MemberDao;

@Controller
public class MemberController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private Member member;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private JavaMailSender emailSender;
	
	@RequestMapping(value = "/loginform", method = RequestMethod.GET)
	public String loginForm() {
		return "login/login";
	}
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute Member member, HttpSession session) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		Member data = dao.login(member.getEmail());
		if(data == null) {
			return "login/loginfail";
		}else {
			boolean passchk = BCrypt.checkpw(member.getPassword(), data.getPassword());
			if(passchk) {
				session.setAttribute("sessionemail", data.getEmail());
				session.setAttribute("sessionpassword", data.getPassword());
				session.setAttribute("sessionname", data.getName());
				session.setAttribute("sessionphoto", data.getPhoto());
				return "redirect:index";
			}else {
				return "login/loginfail";
			}
		}
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String loginOut(HttpSession session) {
		session.invalidate();
		return "redirect:index";
	}
	@RequestMapping(value = "/memberinsertform", method = RequestMethod.GET)
	public String memberInsertForm() {
//		member.setName("kor");
		return "member/member_insert_form";
	}
	@RequestMapping(value = "/memberconfirm", method = RequestMethod.POST)
	@ResponseBody
	public int memberConfirm(@RequestParam String email) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		int exists = 0;
		try {
			exists=dao.selectConfirm(email);
		} catch (Exception e) {
			System.out.println("error:"+e.getMessage());
		}
		return exists;
	}
	@RequestMapping(value = "/memberinsert", method = RequestMethod.POST)
	public String memberInsert(Model model, @ModelAttribute Member member, @RequestParam CommonsMultipartFile imgfile) {
		String originalname = imgfile.getOriginalFilename();
//		int position = originalname.lastIndexOf(".");
//		String ext = originalname.substring(position);
//		String path = "D:/ncs4webproject/ncs4project/src/main/webapp/resources/uploadattachs/";
//		String realpath = "resources/uploadattachs";
//		String stremail = member.getEmail() + ext;
//		String cutemail = stremail.substring(0, stremail.indexOf("@"));
		String realpath = "";
		String stremail = "";
		if(originalname.equals("")) {
			stremail = "camera.png";
			realpath = "resources/";
		}else {
			int position = originalname.lastIndexOf(".");
			String ext = originalname.substring(position);
			realpath = "resources/uploadattachs/";
			stremail = member.getEmail() + ext;
			try {
				String path = "D:/ncs4webproject/ncs4project/src/main/webapp/resources/uploadattachs/";
				byte bytes[] = imgfile.getBytes();
				BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(path+stremail));
				output.write(bytes);
				output.flush();
				output.close();
			}catch (Exception e) {
				
			}
		}
		member.setPhoto(realpath+stremail);
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		member.setInputdate(format.format(date));
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		try {
			String encodingPassword = passwordEncoder.encode(member.getPassword());
			member.setPassword(encodingPassword);
			int result = dao.insertRow(member);
			if(result > 0) {
				model.addAttribute("msg", "가입되었습니다");
			}
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "member/member_result";
	}
	@RequestMapping(value = "/membersearch", method = RequestMethod.GET)
	public String memberSearch(Model model) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		ArrayList<Member> members = dao.selectAll();
		model.addAttribute("members",members);
		return "member/member_search";
	}
	@RequestMapping(value = "/memberupdateform", method = RequestMethod.GET)
	public String memberUpdateForm(Model model, @RequestParam String email) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		Member member = dao.selectOne(email);
		model.addAttribute("member", member);
		return "member/member_update_form";
	}
	@RequestMapping(value = "/memberupdate", method = RequestMethod.POST)
	public String memberUpdate(Model model, @ModelAttribute Member member, @RequestParam CommonsMultipartFile imgfile) {
		String originalname = imgfile.getOriginalFilename();
		String realpath = "";
		String stremail = "";
		if(originalname.equals("")) {
			member.setPhoto(member.getBeforephoto());
		}else {
			int position = originalname.lastIndexOf(".");
			String ext = originalname.substring(position);
			realpath = "resources/uploadattachs/";
			stremail = member.getEmail() + ext;
			try {
				String path = "D:/ncs4webproject/ncs4project/src/main/webapp/resources/uploadattachs/";
				byte bytes[] = imgfile.getBytes();
				BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(path+stremail));
				output.write(bytes);
				output.flush();
				output.close();
			}catch (Exception e) {
				
			}
			member.setPhoto(realpath+stremail);
		}
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		try {
			String encodingPassword = passwordEncoder.encode(member.getPassword());
			member.setPassword(encodingPassword);
			int result = dao.updateRow(member);
			if(result > 0) {
				model.addAttribute("msg", "수정되었습니다");
			}
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "member/member_result";
	}
	@RequestMapping(value = "/memberdelete", method = RequestMethod.GET)
	public String memberDelete(Model model, @RequestParam String email) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		int result = dao.deleteRow(email);
		if(result > 0) {
			model.addAttribute("msg", "삭제되었습니다");
		}
		return "member/member_result";
	}
	@RequestMapping(value = "/emailAuth", method = RequestMethod.POST)
	 @ResponseBody
	 public String emailAuth( @RequestParam String email  ) {
	  String authNum = randomNum(); 
	  String content = "인증번호["+authNum+ "]";
	  sendEmail(email , content);
	  return authNum;
	 }



	private void sendEmail( String email, String content ) {
	  SimpleMailMessage message = new SimpleMailMessage();
	  try {
		  message.setSubject("itschool 인증번호");
		  message.setText(content);
		  message.setTo(email);
//		  message.setFrom("jaebee2002@gamil.com");
		  message.setFrom(MimeUtility.encodeText("관리자","UTF-8","B"));
		  emailSender.send(message);
	  } catch (Exception e) {
	   System.out.println("----> error:"+e.getMessage());
	  }
	 }


	String randomNum() {
	  StringBuffer buffer = new StringBuffer();
	  for ( int i = 0 ; i <= 6; i++ ){
	   int n =  (int) (Math.random() * 10);
	   buffer.append(n);
	  }
	  return buffer.toString();
	 }
	@RequestMapping(value = "/passwordfind", method = RequestMethod.POST)
	@ResponseBody
	public int passwordFind(@RequestParam String email) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		int exists = 0;
		try {
			exists=dao.selectConfirm(email);
		} catch (Exception e) {
			System.out.println("error:"+e.getMessage());
		}
		if(exists > 0) {
			Random random = new Random();
			String pass = String.format("%04d", random.nextInt(9000));
			String content = "임시비밀번호["+pass+ "]";
			String encodingPassword = passwordEncoder.encode(pass);
			member.setPassword(encodingPassword);
			member.setEmail(email);
			dao.updatePassword(member);
			sendEmail(email , content);
		}
		return exists;
	}
}
