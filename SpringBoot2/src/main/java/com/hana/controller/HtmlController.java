package com.hana.controller;

import com.hana.app.data.dto.CustDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/html")
public class HtmlController {
    String dir = "html/";
    @RequestMapping("/")
    public String main(Model model) {
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "center");
        return "index";
    }

    @RequestMapping("/html1")
    public String html1(Model model) {
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "html1");
        return "index";
    }

    @RequestMapping("/html2")
    public String html2(Model model) {
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "html2");
        return "index";
    }

    @RequestMapping("/html3")
    public String html3(Model model) {
        List<CustDto> list = new ArrayList<>();
        list.add(new CustDto("id01", "pwd01", "James01"));
        list.add(new CustDto("id02", "pwd02", "James02"));
        list.add(new CustDto("id03", "pwd03", "James03"));
        list.add(new CustDto("id04", "pwd04", "James04"));
        list.add(new CustDto("id05", "pwd05", "James05"));

        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "html3");
        model.addAttribute("custs", list);

        return "index";
    }

    @RequestMapping("/get")
    public String get(Model model, @RequestParam("id") String id) {
        // DB에 id값을 조회한다
        CustDto custDto = CustDto.builder().id(id).pwd("pwdxx").name("james").build();

        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "get");
        model.addAttribute("cust", custDto);
        return "index";
    }
}
