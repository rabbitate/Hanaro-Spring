package com.hana.controller;

import com.hana.app.data.dto.OcrDto;
import com.hana.util.FileUploadUtil;
import com.hana.util.NcpUtil;
import com.hana.util.OCRUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
@RequestMapping("/ncp")
@Slf4j
public class NcpController {
    @Value("${app.key.ncp-id}")
    String ncpId;

    @Value("${app.key.ncp-secret}")
    String ncpSecret;

    @Value("${app.dir.uploadimgdir}")
    String uploadImgDir;

    @Value("${app.url.chatbot-url}")
    String chatbotUrl;

    String dir = "ncp/";

    @RequestMapping("/")
    public String ncp(Model model) {
        model.addAttribute("center", dir + "summary");
        model.addAttribute("left", dir + "left");
        return "index";
    }

    @RequestMapping("/summary")
    @ResponseBody
    public Object summary(@RequestParam("content") String content) {
        JSONObject jsonObject = (JSONObject) NcpUtil.getSummary(ncpId, ncpSecret, content);
        return jsonObject;
    }

    @RequestMapping("/ocr")
    public String ocr(Model model) {
        model.addAttribute("center", dir + "ocr");
        model.addAttribute("left", dir + "left");
        return "index";
    }

    @RequestMapping("/ocrimpl")
    public String ocrimpl(Model model, OcrDto ocrDto) {

        String imgname = ocrDto.getImage().getOriginalFilename();
        FileUploadUtil.saveFile(ocrDto.getImage(), uploadImgDir);
        JSONObject jsonObject = OCRUtil.getResult(uploadImgDir, imgname);
        Map<String, String> map = OCRUtil.getData(jsonObject);

        model.addAttribute("imgname", imgname);
        model.addAttribute("result", map);
        model.addAttribute("center", dir + "ocr");
        model.addAttribute("left", dir + "left");
        return "index";
    }

    @RequestMapping("/ocr2")
    public String ocr2(Model model) {
        model.addAttribute("center", dir + "ocr2");
        model.addAttribute("left", dir + "left");
        return "index";
    }

    @RequestMapping("/ocrimpl2")
    public String ocrimpl2(Model model, OcrDto ocrDto) {
        String imgname = ocrDto.getImage().getOriginalFilename();
        FileUploadUtil.saveFile(ocrDto.getImage(), uploadImgDir);
        JSONObject jsonObject = OCRUtil.getResult(uploadImgDir, imgname);
        Map<String, String> map = OCRUtil.getCardData(jsonObject);

        model.addAttribute("imgname", imgname);
        model.addAttribute("result", map);
        model.addAttribute("center", dir + "ocr2");
        model.addAttribute("left", dir + "left");
        return "index";
    }

    @RequestMapping("/chatbot")
    public String chatbot(Model model) {
        model.addAttribute("center", dir + "chatbot");
        model.addAttribute("left", dir + "left");
        return "index";
    }

    @RequestMapping("/kogpt")
    public String kogpt(Model model) {
        model.addAttribute("center", dir + "kogpt");
        model.addAttribute("left", dir + "left");
        return "index";
    }
}
