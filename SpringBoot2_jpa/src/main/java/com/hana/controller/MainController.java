package com.hana.controller;

import com.hana.app.data.dto.CustDto;
import com.hana.app.service.CustService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MainController {
    final CustService custService;
    @RequestMapping("/")
    public String main() {
        log.info("**");
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
        CustDto custDto = null;
        try {
            custDto = custService.get(id);
            // id가 존재하지 않을 시 로그인 실패
            if (custDto == null) {
                throw new Exception();
            }
            // 비밀번호가 틀렸을 시 로그인 실패
            if (!custDto.getPwd().equals(pwd)) {
                throw new Exception();
            }
            // 로그인 성공 처리
            httpSession.setAttribute("id", id);
        } catch (Exception e) {
            model.addAttribute("center", "loginfail");
//            throw new RuntimeException(e);
        }

//        if (id.equals("admin") && pwd.equals("1111")) {
//            // 로그인 성공
//            httpSession.setMaxInactiveInterval(80000); // 이 시간이 지나면 세션이 만료된다
//            httpSession.setAttribute("id", id);
//            log.debug(id);
//        } else {
//            // 로그인 실패
//            model.addAttribute("center", "loginfail");
//        }
//        log.info(id);
//        log.info("Test log message");

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
//        log.info("Name: " + custDto.getName() + " ID: " + custDto.getId() + " Password: " + custDto.getPwd());
        try {
            custService.add(custDto);
            httpSession.setAttribute("id", custDto.getId());
        } catch (Exception e) {
//            throw new RuntimeException(e);
            model.addAttribute("center", "registerfail");
        }
        return "index";
    }
}
