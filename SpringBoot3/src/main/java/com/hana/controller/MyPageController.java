package com.hana.controller;

import com.hana.app.data.dto.AddrDto;
import com.hana.app.service.AddrService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/mypage")
@RequiredArgsConstructor
@Slf4j
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

    @RequestMapping("/edit")
    public String edit(Model model, @RequestParam("addrId") int addressId) {
        String dir = "mypage/";
        AddrDto addrDto = null;

        try {
            addrDto = addrService.get(addressId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        model.addAttribute("center", dir + "edit");
        model.addAttribute("left", dir + "left");
        model.addAttribute("address", addrDto);
        return "index";
    }

    @RequestMapping("/addImpl")
    public String addImpl(@RequestParam("addrName") String addrName, @RequestParam("addrDetail") String addrDetail,
                          @RequestParam("custId") String custId) {
        try {
            addrService.add(new AddrDto(0, addrName, addrDetail, custId));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/mypage/?id=" + custId;
    }

    @RequestMapping("/editImpl")
    public String editImpl(AddrDto addrDto) {
        try {
            addrService.modify(addrDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/mypage/" + "?id=" + addrDto.getCustId();
    }

    @RequestMapping("/delImpl")
    public String delImpl(@RequestParam("addrId") int addrId, @RequestParam("id") String id) {
        try {
            addrService.del(addrId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "redirect:/mypage/" + "?id=" + id;
    }
}
