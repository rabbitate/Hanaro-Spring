package com.hana.controller;

import com.hana.app.data.dto.CustDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cust")
public class CustController {
    String dir = "cust/";
    @RequestMapping("/add")
    public String add() {
        return "index";
    }

    @RequestMapping("/get")
    public String get(Model model) {
        // Database에서 데이터를 가지고 온다
        List<CustDto> list = new ArrayList<>();
        list.add(new CustDto("id01", "pwd01", "james"));
        list.add(new CustDto("id02", "pwd01", "james"));
        list.add(new CustDto("id03", "pwd01", "james"));
        list.add(new CustDto("id04", "pwd01", "james"));
        list.add(new CustDto("id05", "pwd01", "james"));
        list.add(new CustDto("id06", "pwd01", "james"));
        list.add(new CustDto("id07", "pwd01", "james"));
        list.add(new CustDto("id08", "pwd01", "james"));
        list.add(new CustDto("id09", "pwd01", "james"));
        list.add(new CustDto("id10", "pwd01", "james"));

        model.addAttribute("custData", list);
        model.addAttribute("center", dir + "get");
        return "index";
    }
 }
