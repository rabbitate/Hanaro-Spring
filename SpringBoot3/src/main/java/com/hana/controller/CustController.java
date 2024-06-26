package com.hana.controller;

import com.github.pagehelper.PageInfo;
import com.hana.app.data.dto.CustDto;
import com.hana.app.service.CustService;
import com.hana.util.StringEncryptor;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/cust")
@RequiredArgsConstructor
public class CustController {
    final CustService custService;
    String dir = "cust/";

    @RequestMapping("/")
    public String main(Model model) {
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "center");
        return "index";
    }

    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "add");
        return "index";
    }

    @RequestMapping("/get")
    public String get(Model model) {
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "get");
        return "index";
    }

    @RequestMapping("/getall")
    public String getall(Model model) {
        List<CustDto> list = null;

        try {
            list = custService.get();
            // 이름 복호화
            list.stream().forEach(custDto -> {
                custDto.setName(StringEncryptor.decryptor(custDto.getName()));
            });
            model.addAttribute("custs", list);
            model.addAttribute("left", dir + "left");
            model.addAttribute("center", dir + "getall");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "index";
    }

    @RequestMapping("/allpage")
    public String allpage(@RequestParam("pageNo") int pageNo, Model model) {
        PageInfo<CustDto> page;
        try {
            page = new PageInfo<>(custService.getPage(pageNo), 5); // 5:하단 네비게이션 개수
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("cpage", page);
        model.addAttribute("target", "/cust");
        model.addAttribute("left",dir + "left");
        model.addAttribute("center",dir + "allpage");
        return "index";
    }

    @RequestMapping("/addImpl")
    public String add(Model model, CustDto custDto) {
        try {
            custService.add(custDto);
        } catch (Exception e) {
            model.addAttribute("left", dir + "left");
            model.addAttribute("center", dir + "registerfail");
        }

        return "redirect:/cust/getall";
    }

    @RequestMapping("/getImpl")
    @ResponseBody
    public CustDto getImpl(Model model, @RequestParam("id") String id) {
        CustDto custDto = null;
        try {
            custDto = custService.get(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return custDto;
    }

    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("id") String id) {
        CustDto custDto = null;
        try {
            custDto = custService.get(id);
            model.addAttribute("cust", custDto);
            model.addAttribute("left", dir + "left");
            model.addAttribute("center", dir + "detail");
        } catch (Exception e) {
            model.addAttribute("left", dir + "left");
            model.addAttribute("center", dir + "registerfail");
        }

        return "index";
    }
}
