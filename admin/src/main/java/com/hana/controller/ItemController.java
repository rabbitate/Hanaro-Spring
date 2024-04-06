package com.hana.controller;

import com.hana.app.data.dto.ItemDto;
import com.hana.app.service.ItemService;
import com.hana.util.FileUploadUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/item")
@RequiredArgsConstructor
@Slf4j
public class ItemController {
    private final ItemService itemService;
    String dir = "item/";

    @Value("${app.dir.uploadimgdir}")
    String imgdir;

    @RequestMapping("/get")
    public String get(Model model) throws Exception {
        List<ItemDto> list = new ArrayList<>();
        try {
            list = itemService.get();
            model.addAttribute("itemlist", list);
            model.addAttribute("center",dir + "get");
        } catch (Exception e) {
            throw new Exception("EI0001");
        }
        return "index";
    }

    @RequestMapping("/add")
    public String add(Model model) throws Exception {
        model.addAttribute("center", dir + "add");
        return "index";
    }

    @RequestMapping("/addimpl")
    public String addimpl(Model model, ItemDto itemDto) throws Exception {
        // 데이터 입력
        itemDto.setImgName(itemDto.getImage().getOriginalFilename());
        itemService.add(itemDto);

        model.addAttribute("center", dir + "add");

        return "redirect:/item/get";
    }

    @RequestMapping("/update")
    public String update(Model model, ItemDto itemDto) throws Exception {
        // 새로운 파일이 있는지 검사
        if (itemDto.getImage().isEmpty()) {
            itemService.modify(itemDto);
        } else {
            String oldimg = itemDto.getImgName();
            itemDto.setImgName(itemDto.getImage().getOriginalFilename());

            // 사진 변경
            itemService.modify(itemDto);

            // 이미지 업로드
            FileUploadUtil.saveFile(itemDto.getImage(), imgdir);

            // 예전 이미지 삭제
            FileUploadUtil.deleteFile(oldimg, imgdir);
        }

        return "redirect:/item/get";
    }

    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("id") int id) throws Exception {
        ItemDto itemDto = null;
        try {
            itemDto = itemService.get(id);
            model.addAttribute("item", itemDto);
            model.addAttribute("center", dir + "detail");
        } catch (Exception e) {
            throw new Exception("EI0001");
        }
        return "index";
    }
}
