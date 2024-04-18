package com.hana.controller;

import com.hana.app.data.dto.BoardDto;
import com.hana.app.data.dto.CustDto;
import com.hana.app.data.entity.LoginCust;
import com.hana.app.repository.LoginCustRepository;
import com.hana.app.service.BoardService;
import com.hana.app.service.CustService;
import com.hana.util.FileUploadUtil;
import com.hana.util.NcpUtil;
import com.hana.util.StringEncryptor;
import com.hana.util.WeatherUtil;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.Random;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MainController {
    final CustService custService;
    final BoardService boardService;
    final BCryptPasswordEncoder encoder;
    final LoginCustRepository loginCustRepository;

    @Value("${app.key.wkey}")
    String wkey;

    @Value("${app.dir.uploadimgdir}")
    String uploadImgDir;

    @RequestMapping("/")
    public String main(Model model) throws Exception {
        Random r = new Random();
        int num = r.nextInt(100)+1;

        List<BoardDto> list = null;
        list = boardService.getRank();

        model.addAttribute("ranks", list);

        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("center", "login");
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
//            if (!custDto.getPwd().equals(pwd)) {
//                throw new Exception();
//            }
            if (!encoder.matches(pwd, custDto.getPwd())) {
                throw new Exception();
            }

            // 로그인 시도하려는데 redis에 id가 있다면 Exception을 throw 한다
            Optional<LoginCust> loginCust = loginCustRepository.findById(id);
            if (loginCust.isPresent()) {
                throw new Exception();
            }

            loginCustRepository.save(LoginCust.builder().loginId(custDto.getId()).build());

            // 로그인 성공 처리
            httpSession.setAttribute("id", id);
        } catch (Exception e) {
            model.addAttribute("center", "login");
            model.addAttribute("msg","로그인 되어있습니다");
            return "index";
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

    @RequestMapping("/logoutimpl")
    public String logout(Model model, HttpSession httpSession) {
        if (httpSession != null) {
            loginCustRepository.deleteById((String) httpSession.getAttribute("id"));
            httpSession.invalidate();
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
//        log.info("Name: " + custDto.getName() + " ID: " + custDto.getId() + " Password: " + custDto.getPwd());
        try {
            custDto.setName(StringEncryptor.encryptor(custDto.getName()));
            custDto.setPwd(encoder.encode(custDto.getPwd()));
            custService.add(custDto);
            loginCustRepository.save(LoginCust.builder().loginId(custDto.getId()).build());

            httpSession.setAttribute("id", custDto.getId());
        } catch (Exception e) {
//            throw new RuntimeException(e);
            model.addAttribute("center", "registerfail");
        }
        return "index";
    }

    @ResponseBody
    @RequestMapping("/registercheckid")
    public Object registercheckid(@RequestParam("id") String id) throws Exception {
        String result = "0";
        CustDto custDto = custService.get(id);
        if(custDto == null){
            result = "1";
        }
        return result;
    }

    @RequestMapping("/wh")
    @ResponseBody
    public Object wh(Model model) throws IOException, ParseException {
        return WeatherUtil.getWeather("109", wkey);
    }

    @RequestMapping("/pic")
    public String pic(Model model) {
        model.addAttribute("center", "pic");
        return "index";
    }

    @RequestMapping("/saveimg")
    @ResponseBody
    public String saveimg(@RequestParam("file") MultipartFile file) {
        String imgname = file.getOriginalFilename();
        FileUploadUtil.saveFile(file, uploadImgDir);
        return imgname;
    }
}
