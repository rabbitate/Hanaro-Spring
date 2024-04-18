package com.hana.controller;

import com.hana.app.data.msg.Msg;
import com.hana.util.ChatBotUtil;
import com.hana.util.KoGPTUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

@Slf4j
@Controller
public class KoGPTController {
    @Autowired
    SimpMessagingTemplate template;

    @Value("${app.key.kakao_rest_key}")
    private String secretKey;

    @MessageMapping("/kogpt") // 나에게만 전송 ex) Chatbot
    public void receiveme(Msg msg, SimpMessageHeaderAccessor headerAccessor) throws Exception {
        String id = msg.getSendid();
        template.convertAndSend("/send/me/" + id, msg);

        String chatBotMsg = KoGPTUtil.getMsg(secretKey, msg.getContent1());
        msg.setSendid("KoGPT");
        msg.setContent1(chatBotMsg);
        template.convertAndSend("/send/me/" + id, msg);
    }
}