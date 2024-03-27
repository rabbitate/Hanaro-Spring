package com.hana.controller;

import com.hana.app.data.dto.CustDto;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Slf4j
public class MainController {
    @RequestMapping("/")
    public String main() {
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("center", "login");
        return "index";
    }

    @RequestMapping("/logout")
    public String logout(Model model, HttpSession httpSession) {
        if (httpSession != null) {
            httpSession.invalidate();
        }
        return "index";
    }

    @RequestMapping("/loginimpl")
    public String loginimpl(Model model,
                            @RequestParam("id") String id, @RequestParam("pwd") String pwd, HttpSession httpSession) {
//        log.info("---------");
//        log.info(id + " " + pwd);
        if (id.equals("admin") && pwd.equals("1111")) {
            // 로그인 성공
            httpSession.setMaxInactiveInterval(80000); // 이 시간이 지나면 세션이 만료된다
            httpSession.setAttribute("id", id);
        } else {
            // 로그인 실패
            model.addAttribute("center", "loginfail");
        }
        return "index";
    }

    @RequestMapping("/register")
    public String register(Model model) {
        model.addAttribute("center", "register");
        return "index";
    }

    @RequestMapping("/registerimpl")
    public String registerimpl(Model model,
                               CustDto custDto,
                               HttpSession httpSession) {
        log.info("Name: " + custDto.getName() + " ID: " + custDto.getId() + " Password: " + custDto.getPwd());
        httpSession.setAttribute("id", custDto.getId());
        return "index";
    }
}
