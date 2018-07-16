package com.oracle.study.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oracle.study.model.TBoard;
import com.oracle.study.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bs;
	
	@RequestMapping("Board_List")
	public String boardList(Model model) {
		List<TBoard> board_list=bs.board_list();
		model.addAttribute("list", board_list);

		return "board_list";
	}
	
	@RequestMapping("write")
	public String write(Model model) {
		return "board_write";
	}
	
	@RequestMapping("read")
	public String read(int tnum ,Model model) {
		TBoard tb =bs.read(tnum);
		model.addAttribute("list", tb);
		
		return "board_read";
	}
	
	@RequestMapping(method=RequestMethod.POST, value ="write_board")
	public String write_board(TBoard board, Model model) {
		int result=bs.insert(board);
		if(result==1) {
			System.out.println("성공");
		}
		else {
			System.out.println("실패");
		}
		return "redirect:Board_List.do";
	}
}
