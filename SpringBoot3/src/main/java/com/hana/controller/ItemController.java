package com.hana.controller;

import com.hana.app.data.dto.ItemDto;
import com.hana.app.service.ItemService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/item")
@RequiredArgsConstructor
@Slf4j
public class ItemController {
    String dir = "item/";
    final ItemService itemService;

    @RequestMapping("/")
    public String main(Model model) {
        List<ItemDto> list = null;

        try {
            list = itemService.get();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        model.addAttribute("itemList", list);
        model.addAttribute("center",  dir + "center");

        return "index";
    }

    @RequestMapping("/del")
    public String del(Model model, @RequestParam("id") int id) {
        try {
            itemService.del(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "redirect:/item/";
    }
}
