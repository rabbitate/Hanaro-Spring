package com.hana.controller;

import com.hana.util.WeatherUtil;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;

@Controller
public class ChatController {
    @Value("${app.url.server-url}")
    String serverUrl;

    String dir = "chat/";

    @RequestMapping("/chat/")
    public String main(Model model) {
        model.addAttribute("serverUrl", serverUrl);
        model.addAttribute("center", "chat");
        return "index";
    }

    @RequestMapping("/chat2")
    public String chat2(Model model) {
        model.addAttribute("serverUrl", serverUrl);
        model.addAttribute("center", "chat2");
        return "index";
    }
}

