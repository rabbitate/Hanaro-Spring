package com.hana.controller;

import com.github.pagehelper.PageInfo;
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

        return "redirect:/board/get?pageNo=1";
    }

    @RequestMapping("/get")
    public String get(Model model, HttpSession httpSession, @RequestParam(value = "pageNo", defaultValue = "1") int pageNo) {
        List<BoardDto> list = null;
        String custId = (String) httpSession.getAttribute("id");

        PageInfo<BoardDto> page;
        try {
            // custId가 작성한 글만 가져오기
//            list = boardService.getByCustId(custId);

            // 전체 글 가져오기
            list = boardService.get();

            // page
            page = new PageInfo<>(boardService.getPage(pageNo), 3);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        model.addAttribute("cpage", page);
        model.addAttribute("target", "/board");
        model.addAttribute("list", list);
        model.addAttribute("center", dir + "get");
        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("boardId") int boardId, HttpSession httpSession) throws Exception {
        BoardDto boardDto = null;
        try {
            boardDto = boardService.get(boardId);
            log.info(boardDto.getCommentList().size()+"---------------------------");
            boardDto.getCommentList().stream().forEach(c->{log.info(c.toString());});
            log.info(boardDto.getCommentList().size()+"---------------------------");

            if(httpSession != null &&
                    !boardDto.getCustId().equals(httpSession.getAttribute("id"))){
                boardService.cntUpdate(boardId);
            }

            model.addAttribute("board", boardDto);
            model.addAttribute("center",dir+"detail");
        } catch (Exception e) {
            throw e;
        }
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
