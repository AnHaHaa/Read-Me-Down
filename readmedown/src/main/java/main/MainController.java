package main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.BoardDTO;
import board.BookmarkDTO;
import jakarta.servlet.http.HttpSession;
import pagination.PagingResponse;
import pagination.SearchDTO;

@Controller
public class MainController {
	
	@Autowired
	MainService service;
	
	//메인 글 목록 불러오기 - masonry ver
	@RequestMapping("/")
	public ModelAndView main_masonry(@ModelAttribute SearchDTO searchdto, HttpSession session) {
		
		System.out.println("=========================================== page = "+searchdto.getPage());
		//글 목록
		searchdto.setRecordSize(100);
		PagingResponse<BoardDTO> list = service.masonryBoardList(searchdto);
		
		//사용자 북마크 목록
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("user_id") == null) {
			mv.addObject("searchdto", searchdto);
			mv.addObject("response", list);
		}
		else {
			String userId = (String)session.getAttribute("user_id");
			for(BoardDTO b : list.getList()) {
				BookmarkDTO bmdto = new BookmarkDTO();
				bmdto.setBoard_id(b.getBoard_id());
				bmdto.setUser_id(userId);
				int bookmarkcnt = service.isBookmarked(bmdto);
				if(bookmarkcnt != 0) {
					b.setBookmarked(true);
				}
				else {
					b.setBookmarked(false);
				}
			}//for
			mv.addObject("searchdto", searchdto);
			mv.addObject("response", list);
		}
		mv.setViewName("main_masonry");
		return mv;
	}
	
	//메인 글 목록 불러오기 - 테이블 게시판 ver
	@RequestMapping("/boardlist")
	public ModelAndView main_tableList(@ModelAttribute SearchDTO searchdto, HttpSession session) {
		//글 목록
		searchdto.setRecordSize(12);
		PagingResponse<BoardDTO> list = service.tableBoardList(searchdto);
		
		//사용자 북마크 목록
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("user_id") == null) {
			mv.addObject("searchdto", searchdto);
			mv.addObject("response", list);
		}
		else {
			String userId = (String)session.getAttribute("user_id");
			for(BoardDTO b : list.getList()) {
				BookmarkDTO bmdto = new BookmarkDTO();
				bmdto.setBoard_id(b.getBoard_id());
				bmdto.setUser_id(userId);
				int bookmarkcnt = service.isBookmarked(bmdto);
				if(bookmarkcnt != 0) {
					b.setBookmarked(true);
				}
				else {
					b.setBookmarked(false);
				}
			}//for
			mv.addObject("searchdto", searchdto);
			mv.addObject("response", list);
		}
		mv.setViewName("main_tableList");
		return mv;
	}
	
	
}//class
