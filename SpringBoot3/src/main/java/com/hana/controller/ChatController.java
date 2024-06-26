package com.hana.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chat")
public class ChatController {
    @Value("${app.url.server-url}")
    String serverUrl;

    String dir = "chat/";

    @RequestMapping("/")
    public String main(Model model) {
        model.addAttribute("serverUrl", serverUrl);
        model.addAttribute("center", "chat");
        return "index";
    }
}
