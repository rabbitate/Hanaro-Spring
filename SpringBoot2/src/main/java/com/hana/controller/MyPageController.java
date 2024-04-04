package com.hana.controller;

import com.hana.app.data.dto.AddrDto;
import com.hana.app.service.AddrService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/mypage")
@RequiredArgsConstructor
public class MyPageController {
    final AddrService addrService;
    String dir = "mypage/";

    @RequestMapping("/")
    public String main(Model model, @RequestParam("id") String id) {
        List<AddrDto> list = null;

        try {
            list = addrService.getByCustId(id);
            model.addAttribute("id", id);
            model.addAttribute("addrs", list);
            model.addAttribute("center", dir + "center");
            model.addAttribute("left", dir + "left");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "index";
    }

    @RequestMapping("/add")
    public String add(Model model) {
        String dir = "mypage/";

        model.addAttribute("center", dir + "add");
        model.addAttribute("left", dir + "left");
        return "index";
    }

    @RequestMapping("/addImpl")
    public String addImpl(Model model, AddrDto addrDto) {
        try {
            addrService.add(addrDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/mypage/";
    }
}
