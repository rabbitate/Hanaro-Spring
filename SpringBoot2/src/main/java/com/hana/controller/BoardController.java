package com.hana.controller;

import com.hana.app.data.dto.BoardDto;
import com.hana.app.service.BoardService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
@Slf4j
public class BoardController {
    String dir = "board/";
    final BoardService boardService;

    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("center", dir + "add");
        return "index";
    }

    @RequestMapping("/addImpl")
    public String addImpl(Model model, BoardDto boardDto) {
        try {
            boardService.add(boardDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "redirect:/board/get";
    }

    @RequestMapping("/get")
    public String get(Model model, HttpSession httpSession) {
        List<BoardDto> list = null;
        String custId = (String) httpSession.getAttribute("id");
        try {
            // custId가 작성한 글만 가져오기
//            list = boardService.getByCustId(custId);

            // 전체 글 가져오기
            list = boardService.get();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        model.addAttribute("list", list);
        model.addAttribute("center", dir + "get");
        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("boardId") int boardId, HttpSession httpSession) {
        BoardDto boardDto = null;
        try {
            boardDto = boardService.get(boardId);
            if (httpSession != null && !boardDto.getCustId().equals(httpSession.getAttribute("id"))) {
                boardService.cntUpdate(boardId);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("board", boardDto);
        model.addAttribute("center", dir + "detail");
        return "index";
    }

    @RequestMapping("/detailImpl")
    public String detailImpl(Model model, BoardDto boardDto) {
        try {
            boardService.modify(boardDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "redirect:/board/get";
    }

    @RequestMapping("/del")
    public String del(@RequestParam("boardId") int boardId) {
        try {
            boardService.del(boardId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "redirect:/board/get";
    }
}
