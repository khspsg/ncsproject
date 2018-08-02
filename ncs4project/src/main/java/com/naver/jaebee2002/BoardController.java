package com.naver.jaebee2002;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.naver.jaebee2002.entities.Board;
import com.naver.jaebee2002.entities.BoardPaging;
import com.naver.jaebee2002.service.BoardDao;

@Controller
public class BoardController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private Board board;
	@Autowired
	private BoardPaging boardpaging;
	static String find;
	
	@RequestMapping(value = "/boardinsertform", method = RequestMethod.GET)
	public String boardInsertForm(HttpSession session) {
		return "board/board_insert_form";
	}
	@RequestMapping(value = "/boardinsert", method = RequestMethod.POST)
	public String boardInsert(Model model, @ModelAttribute Board board, @RequestParam CommonsMultipartFile file, HttpServletRequest request) {
		String originalname = file.getOriginalFilename();
		if(originalname.equals("")) {
		}else {
			String realpath = "resources/file/";
			try {
				String path = "D:/ncs4webproject/ncs4project/src/main/webapp/resources/file/";
				byte bytes[] = file.getBytes();
				BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(path+originalname));
				output.write(bytes);
				output.flush();
				output.close();
				board.setB_attach(realpath+originalname);
			}catch (Exception e) {
				
			}
		}
		board.setB_ip(request.getRemoteAddr());
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd E요일 a hh:mm:ss");
		board.setB_date(format.format(date));
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		try {
//			String encodingPassword = passwordEncoder.encode(board.getPassword());
//			board.setPassword(encodingPassword);
			int result = dao.insertRow(board);
			if(result > 0) {
				model.addAttribute("msg", "작성되었습니다");
			}
		}catch (Exception e) {
		}
		return "member/member_result";
	}
	@RequestMapping(value = "/boardpagelist", method = RequestMethod.GET)
	public String boardPageList(Model model, String find) {
		if(find == null) {
			find = "";
		}
		this.find = find;
		int pagesize = 10;
		int startrow = 0;
		int endrow = startrow + pagesize;
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		boardpaging.setFind(find);
		boardpaging.setStartrow(startrow);
		boardpaging.setEndrow(endrow);
		ArrayList<Board> boards = dao.pageList(boardpaging);
		int rowcount = dao.selectRowCount(find);
		int abspage = 1;
		if(rowcount % pagesize == 0) {
			abspage = 0;
		}
		int pagecount = rowcount / pagesize + abspage;
		int[] pages = new int[pagecount];
		for(int i = 0; i < pagecount; i++) {
			pages[i] = i+1;
		}
		model.addAttribute("boards",boards);
		model.addAttribute("pages",pages);
		return "board/board_page_list";
	}
	@RequestMapping(value = "/boardpageselected", method = RequestMethod.GET)
	public String boardPageSelected(Model model, int page) {
		int pagesize = 10;
		int startrow = (page - 1) * (pagesize);
		int endrow = pagesize;
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		boardpaging.setFind(find);
		boardpaging.setStartrow(startrow);
		boardpaging.setEndrow(endrow);
		ArrayList<Board> boards = dao.pageList(boardpaging);
		int rowcount = dao.selectRowCount(find);
		int abspage = 1;
		if(rowcount % pagesize == 0) {
			abspage = 0;
		}
		int pagecount = rowcount / pagesize + abspage;
		int[] pages = new int[pagecount];
		for(int i = 0; i < pagecount; i++) {
			pages[i] = i+1;
		}
		model.addAttribute("boards",boards);
		model.addAttribute("pages",pages);
		return "board/board_page_list";
	}
	@RequestMapping(value = "/boarddetail", method = RequestMethod.GET)
	public String boardDetail(Model model, HttpSession session, @RequestParam int b_seq) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		Board board = dao.selectOne(b_seq);
		if(!board.getB_email().equals(session.getAttribute("sessionemail"))) {
			dao.updateHit(b_seq);
		}else {
			
		}
		model.addAttribute("board", board);
		return "board/board_detail";
	}
	@RequestMapping(value = "/boardupdate", method = RequestMethod.POST)
	public String boardUpdate(Model model, @ModelAttribute Board board, @RequestParam CommonsMultipartFile file) {
		String originalname = file.getOriginalFilename();
		if(originalname.equals("")) {
			board.setB_attach(board.getB_beforeattach());
		}else {
			String realpath = "resources/file/";
			try {
				String path = "D:/ncs4webproject/ncs4project/src/main/webapp/resources/file/";
				byte bytes[] = file.getBytes();
				BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(path+originalname));
				output.write(bytes);
				output.flush();
				output.close();
				board.setB_attach(realpath+originalname);
			}catch (Exception e) {
				
			}
		}
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd E요일 a hh:mm:ss");
		board.setB_date(format.format(date));
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		try {
			int result = dao.updateRow(board);
			if(result > 0) {
				model.addAttribute("msg", "작성되었습니다");
			}
		}catch (Exception e) {
		}
		return "member/member_result";
	}
	@RequestMapping(value = "/boarddownload", method = RequestMethod.GET)
	public ModelAndView boardDownload(@RequestParam String b_attach) {
		String path = "D:/ncs4webproject/ncs4project/src/main/webapp/";
		File file = new File(path+b_attach);
		return new ModelAndView("download", "downloadFile", file);
	}
	@RequestMapping(value = "/boardreplyform", method = RequestMethod.GET)
	public String boardReplyForm(Model model, HttpSession session, @RequestParam String b_title, @RequestParam int b_ref) {
//		board.setB_email((String) session.getAttribute("sessionemail"));
//		board.setB_name((String) session.getAttribute("sessionname"));
		board.setB_title("[댓글]"+b_title);
		board.setB_ref(b_ref);
		model.addAttribute("board",board);
		return "board/board_reply";
	}
	@RequestMapping(value = "/boardreplyinsert", method = RequestMethod.POST)
	public String boardReplyInsert(Model model, @ModelAttribute Board board, @RequestParam CommonsMultipartFile file, HttpServletRequest request) {
		String originalname = file.getOriginalFilename();
		if(originalname.equals("")) {
		}else {
			String realpath = "resources/file/";
			try {
				String path = "D:/ncs4webproject/ncs4project/src/main/webapp/resources/file/";
				byte bytes[] = file.getBytes();
				BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(path+originalname));
				output.write(bytes);
				output.flush();
				output.close();
				board.setB_attach(realpath+originalname);
			}catch (Exception e) {
				
			}
		}
		board.setB_ip(request.getRemoteAddr());
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd E요일 a hh:mm:ss");
		board.setB_date(format.format(date));
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		dao.insertReplyRow(board);
		return "redirect:boardpagelist";
	}
	@RequestMapping(value = "/boarddelete", method = RequestMethod.GET)
	public String boardDelete(Model model, @RequestParam int b_ref, @RequestParam int b_seq) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		int result = 0;
		if(b_ref == b_seq) {
			result = dao.deleteref(b_ref);
		}else {
			result = dao.deleteseq(b_seq);
		}
		if(result > 0) {
			model.addAttribute("msg", "삭제되었습니다");
		}
		return "member/member_result";
	}
}
