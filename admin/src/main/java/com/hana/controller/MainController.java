package com.hana.controller;

import com.hana.app.data.dto.AdminDto;
import com.hana.app.data.entity.LoginCust;
import com.hana.app.repository.LoginCustRepository;
import com.hana.app.service.AdminService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MainController {
    private final AdminService adminService;
    private final LoginCustRepository loginCustRepository;

    @Value("${app.url.server-url}")
    String serverUrl;

    @RequestMapping("/")
    public String main(Model model){
        model.addAttribute("charturl",serverUrl);
        model.addAttribute("serverurl",serverUrl);
        return "index";
    }

    @RequestMapping("/logininfo")
    public String logininfo(Model model){
        Iterable<LoginCust> list = loginCustRepository.findAll();
        List<LoginCust> loginCustList = new ArrayList<>();

        list.forEach(loginCust -> {
            if (loginCust != null) {
                loginCustList.add(loginCust);
            }
        });

        model.addAttribute("center","login_info");
        model.addAttribute("cnt", loginCustList.size());
        model.addAttribute("list", loginCustList);
        return "index";
    }

    @RequestMapping("/websocket")
    public String websocket(Model model){
        model.addAttribute("serverurl",serverUrl);
        model.addAttribute("center","websocket");
        return "index";
    }

    @RequestMapping("/notify")
    public String notify(Model model){
        model.addAttribute("serverurl",serverUrl);
        model.addAttribute("center","notify");
        return "index";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession httpSession) {
        if (httpSession != null) {
            httpSession.invalidate();
        }
        return "index";
    }

    @RequestMapping("/loginimpl")
    public String loginimpl(Model model, @RequestParam("id") String id, @RequestParam("pwd") String pwd, HttpSession httpSession) {
        AdminDto adminDto = null;
        try {
            adminDto = adminService.get(id);
            if (adminDto == null) {
                throw new Exception();
            }
            if (!adminDto.getPwd().equals(pwd)) {
                throw new Exception();
            }
            httpSession.setAttribute("admin", adminDto);
        } catch (Exception e) {
            model.addAttribute("msg", "아이디 또는 비밀번호가 틀립니다");
//            throw new RuntimeException(e);
        }

        return "index";
    }
}
