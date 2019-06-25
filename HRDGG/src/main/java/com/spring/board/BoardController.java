package com.spring.board;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.file.FilesVo;
import com.spring.menu.MenuService;
import com.spring.menu.MenuVo;
import com.spring.reply.ReplyService;
import com.spring.reply.ReplyVo;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private ReplyService replyService;

	@RequestMapping("/Board/List")
	public ModelAndView list(@RequestParam HashMap<String, Object> map, HttpSession session) {
		ModelAndView mv = new ModelAndView("menu/comm/list");
		List<BoardVo> boardList = boardService.getList(map);
		List<MenuVo>  menuList  = menuService.getList();
		
		session.setAttribute("menuList", menuList);
		mv.addObject("boardList", boardList);
		mv.addObject("menu_id", map.get("menu_id"));
		return mv;
	}
	
	@RequestMapping("/Board/ListPaging")
	public ModelAndView listPaging(@RequestParam HashMap<String, Object> map, HttpSession session) {
		ModelAndView mv = new ModelAndView("menu/comm/list");
		List<BoardVo> boardList = boardService.getListPaging(map);
		List<MenuVo>  menuList  = menuService.getList();

		session.setAttribute("menuList", menuList);
		mv.addObject("boardList", boardList);
		mv.addObject("now_page", map.get("now_page"));		// 현재 페이지
		mv.addObject("per_page", map.get("per_page"));		// 페이지당 개수
		mv.addObject("totalcnt", map.get("totalcnt"));		// 검색된 전체 개수
		mv.addObject("menu_id", map.get("menu_id"));
		return mv;
	}
	
	@RequestMapping("/Board/Cont")
	public ModelAndView view(@RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView("menu/comm/cont");
		BoardVo boardVo = boardService.getCont(map);
		List<ReplyVo> replyList = replyService.getList(map);
		mv.addObject("boardVo", boardVo);
		mv.addObject("menu_id", boardVo.getMenu_id());
		mv.addObject("replyList", replyList);
		
		List<FilesVo>	fileList	= boardService.getFileList(map);
		mv.addObject("fileList", fileList);
		return mv;
	}
	
	@RequestMapping("/Board/WriteForm")
	public ModelAndView writeForm(BoardVo vo, HttpSession session) {
		ModelAndView mv = new ModelAndView("menu/comm/write");
		if (session.getAttribute("user") == null) {
			mv.setViewName("redirect:/Login/");
			return mv;
		}
		List<MenuVo> menuList = menuService.getList();
		mv.addObject("menuList", menuList);
		mv.addObject("boardVo", vo);
		mv.addObject("menu_id", vo.getMenu_id());
		return mv;
	}
	
	@RequestMapping("/Board/Write")
	public ModelAndView write(@RequestParam HashMap<String, Object> map, 
			HttpSession session,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:/Board/ListPaging");
		
		if (session.getAttribute("user") == null) {
			mv.setViewName("redirect:/Login/");
			return mv;
		}
		
		
		boardService.write(map, request);
		
		mv.addObject("now_page", 1);
		mv.addObject("per_page", 10);
		mv.addObject("menu_id", map.get("menu_id"));
		return mv;
	}
	
	@RequestMapping("/Board/Remove")
	public ModelAndView remove(@RequestParam HashMap<String, Object> map, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/Board/ListPaging");
		System.out.println(map);
		if (session.getAttribute("user") == null) {
			mv.setViewName("redirect:/Login/");
			return mv;
		}
		BoardVo vo = new BoardVo();
				vo.setIdx(Integer.valueOf(String.valueOf(map.get("idx"))));
		boardService.remove(vo);
		mv.addObject("now_page", map.get("now_page"));
		mv.addObject("per_page", map.get("per_page"));
		mv.addObject("menu_id", map.get("menu_id"));
		return mv;
	}

	@RequestMapping("/Board/UpdateForm")
	public ModelAndView updateForm(@RequestParam HashMap<String, Object> map, 
			HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("menu/comm/update");
		// 로그인 세션
		if (session.getAttribute("user") == null) {
			mv.setViewName("redirect:/Login/");
			return mv;
		}

		// 게시물 내용 보기
		BoardVo boardVo = boardService.getCont(map);

		// 파일목록
		List<FilesVo> fileList = boardService.getFileList(map);

		mv.addObject("map", map);
		mv.addObject("boardVo", boardVo);
		mv.addObject("menu_id", map.get("menu_id"));
		mv.addObject("fileList", fileList);
		return mv;
	}
	
	
	
	@RequestMapping("/Board/Update")
	public ModelAndView update(@RequestParam HashMap<String, Object> map, 
			HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:/Board/Cont" + "?idx=" + map.get("idx"));
		if (session.getAttribute("user") == null) {
			mv.setViewName("redirect:/Login/");
			return mv;
		} 
		boardService.update(map, request);
		mv.addObject("menu_id", map.get("menu_id"));
		return mv;
	}
	
	@RequestMapping("/Board/Search")
	public ModelAndView search(@RequestParam HashMap<String,Object> map) {
		ModelAndView mv = new ModelAndView("menu/comm/list");
		List<BoardVo> boardList = boardService.serach(map);
		// System.out.println(map);

		mv.addObject("boardList", boardList);
		mv.addObject("now_page", map.get("now_page"));		// 현재 페이지
		mv.addObject("per_page", map.get("per_page"));		// 페이지당 개수
		mv.addObject("totalcnt", map.get("totalcnt"));		// 검색된 전체 개수
		mv.addObject("menu_id", map.get("menu_id"));
		return mv;
	}
	

	// 파일 
	@RequestMapping(value="/download/{type}/{sfile:.+}",
			method = RequestMethod.GET)
	public void downloadFile(
			HttpServletResponse response,
			@PathVariable("type")  String type,
			@PathVariable("sfile") String sfile
			) throws IOException {

		String  INTERNAL_FILE         = sfile;
		String  EXTERNAL_FILE_PATH    = "d:\\Upload\\" + sfile;

		File file = null;
		if( type.equalsIgnoreCase("internal")) {
			// 현재 실행 중인 웹서버 파일의 경로
			ClassLoader classLoader
			= Thread.currentThread().getContextClassLoader();
			file = new File(classLoader.getResource(INTERNAL_FILE).getFile());
		} else {
			file = new File(EXTERNAL_FILE_PATH );
		}

		if(!file.exists()) {
			String  errorMessage = "Sorry. thie file are looking for does not exist";
			System.out.println(errorMessage);
			OutputStream outputStream = response.getOutputStream();
			outputStream.write(errorMessage.getBytes(Charset.forName("UTF-8")));
			outputStream.close();
			return;
		} // 파일이 없을 때 처리

		String mimeType = "application/octet-stream"; // 강제 다운로드 인코딩

		response.setContentType( mimeType );
		response.setHeader("Content-disposition",
				String.format("inline; filename=\"" + file.getName() + "\"")); // response 값에 header 지정
		response.setContentLength((int) (file.length())); // 다운로드할 파일용량

		// 다운로드
		InputStream inputStream = new BufferedInputStream(new FileInputStream(file));
		FileCopyUtils.copy(inputStream, response.getOutputStream());	

	}
	
	@RequestMapping(value="/FileDelete")

	   public ModelAndView fileDelete(@RequestParam HashMap<String, Object> map){
	     
		ModelAndView mv = new ModelAndView("redirect:/Board/UpdateForm?idx="+map.get("idx"));
	      boardService.fileDelete(map);
	      List<FilesVo> fileList   = boardService.getFileList(map);

	      map.put("fileList", fileList);
	      return mv;
	   }
	
}
