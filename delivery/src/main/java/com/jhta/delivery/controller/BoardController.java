package com.jhta.delivery.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jhta.delivery.service.BoardService;
import com.jhta.delivery.service.CommentService;
import com.jhta.delivery.service.MembersService;
import com.jhta.delivery.util.PageUtil;
import com.jhta.delivery.vo.BoardImgVo;
import com.jhta.delivery.vo.BoardVo;
import com.jhta.delivery.vo.CommentVo;
import com.jhta.delivery.vo.MembersVo;

@Controller
public class BoardController {
	@Autowired
	private BoardService service;
	@Autowired
	private MembersService mservice;
	@Autowired
	private CommentService cservice;

	@RequestMapping("/board/list")
	public String board(@RequestParam(name = "pageNum", defaultValue = "1") int pageNum, Model model,
			HttpSession session) {
		String email = (String) session.getAttribute("email");
		int getCount = service.getCount();

		PageUtil pu = new PageUtil(pageNum, 10, 10, getCount);

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());

		List<BoardVo> list = service.getList(map);

		model.addAttribute("pu", pu);
		model.addAttribute("list", list);
		model.addAttribute("email", email);

		return ".board.list";
	}

	@RequestMapping("/board/insert")
	public String insert(HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");
		// System.out.println(email);
		if (email != null) {
			MembersVo vo = mservice.getinfo(email);
			model.addAttribute("boa_writer", vo.getMem_nick());
			return ".board.insert";
		} else {
			return "redirect:/board/list";
		}
	}

	@RequestMapping("/board/insertOk")
	public String insertOk(BoardVo vo, HttpSession session, MultipartHttpServletRequest mhsr) {

		service.insert(vo);

		String uploadPath = session.getServletContext().getRealPath("/resources/images/board");

		try {

			List<MultipartFile> fileList = mhsr.getFiles("boa_img");

			if (!fileList.isEmpty()) {
				for (int i = 0; i < fileList.size(); i++) {
					String orgFileName = fileList.get(i).getOriginalFilename();
					String saveFileName = UUID.randomUUID() + "_" + orgFileName;
					InputStream is = fileList.get(i).getInputStream();
					System.out.println("uploadPath : " + uploadPath + "saveFileName : " + saveFileName);
					FileOutputStream fos = new FileOutputStream(uploadPath + "\\" + saveFileName);
					FileCopyUtils.copy(is, fos);
					fos.close();
					is.close();
					int num = service.insertNum();
					service.insertImg(new BoardImgVo(0, saveFileName, num));
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}

		return "redirect:/board/list";
	}

	@RequestMapping("/board/detail")
	public String detail(int boa_num, Model model) {
		service.addHit(boa_num);
		BoardVo vo = service.detail(boa_num);
		List<BoardImgVo> vo1 = service.detailImg(boa_num);
		BoardVo prev = service.prev(boa_num);
		BoardVo next = service.next(boa_num);

		vo.setBoa_cont(vo.getBoa_cont().replaceAll("\n", "<br>"));
		// System.out.println(vo);
		model.addAttribute("vo", vo);
		model.addAttribute("vo1", vo1);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);

		List<CommentVo> clist = cservice.list(boa_num);
		model.addAttribute("clist", clist);

		return ".board.detail";
	}

	@RequestMapping("/board/delete")
	public String delete(int boa_num, HttpSession session) {
		try {
			System.out.println("삭제삭제");
			service.delete(boa_num);
			return "redirect:/board/list";

		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "error";
		}
	}

	@RequestMapping("/board/update")
	public String update(int boa_num, Model model, HttpSession session) {
		String email = (String) session.getAttribute("email");
		MembersVo vo = mservice.getinfo(email);
		model.addAttribute("boa_writer", vo.getMem_nick());
		BoardVo vo1 = service.detail(boa_num);

		model.addAttribute("vo", vo1);
		model.addAttribute("boa_num", boa_num);
		System.out.println("오긴오느냐");
		return ".board.update";
	}

	@RequestMapping("/board/updateOk")
	public String updateOk(BoardVo vo, int boa_num, HttpSession session, MultipartHttpServletRequest mhsr) {
		String uploadPath = session.getServletContext().getRealPath("/resources/images/board");
		try {

			List<MultipartFile> fileList = mhsr.getFiles("boa_img");

			if (!fileList.isEmpty()) {
				service.updateImg(boa_num);
				for (int i = 0; i < fileList.size(); i++) {
					String orgFileName = fileList.get(i).getOriginalFilename();
					String saveFileName = UUID.randomUUID() + "_" + orgFileName;
					InputStream is = fileList.get(i).getInputStream();
					System.out.println("uploadPath : " + uploadPath + "saveFileName : " + saveFileName);
					FileOutputStream fos = new FileOutputStream(uploadPath + "\\" + saveFileName);
					FileCopyUtils.copy(is, fos);
					fos.close();
					is.close();
					int num = service.insertNum();
					service.insertImg(new BoardImgVo(0, saveFileName, num));
				}
			}

			service.update(vo);
			return "redirect:/board/list";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "error";
		}
	}
}
