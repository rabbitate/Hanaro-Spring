package com.hana.controller;

import com.hana.app.data.dto.CustDto;
import com.hana.app.service.CustService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cust")
@RequiredArgsConstructor
public class CustController {
    private final CustService custService;
    String dir = "cust/";

    @RequestMapping("/get")
    public String get(Model model){
        // Database에서 데이터를 가지고 온다.
        List<CustDto> list = null;

        try {
            list = custService.get();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("custs",list);
        model.addAttribute("center",dir + "get");
        return "index";
    }

    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("center", dir + "add");
        return "index";
    }

    @RequestMapping("/addimpl")
    public String addimpl(CustDto custDto) {
        try {
            custService.add(custDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/cust/get";
    }

    @RequestMapping("/del")
    public String del(@RequestParam("id") String id) {
        try {
            custService.del(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/cust/get";
    }

    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("id") String id) {
        CustDto custDto = null;

        try {
            custDto = custService.get(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("cust", custDto);
        model.addAttribute("center", dir + "detail");
        return "index";
    }

    @RequestMapping("/update")
    public String update(Model model, CustDto custDto) {
        try {
            custService.modify(custDto);
            return "redirect:/cust/get";
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
