package com.hana.controller;

import com.hana.app.data.dto.CustDto;
import com.hana.app.data.dto.KeywordDto;
import com.hana.app.data.dto.ShopDto;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

@RestController
public class AjaxImplController {
    @RequestMapping("/getservertime")
    public Object getservertime() {
        Date date = new Date();
        return date;
    }

    @RequestMapping("/getdata")
    public Object getData() {
        List<CustDto> list = new ArrayList<>();
        list.add(new CustDto("id01", "pwd01", "james"));
        list.add(new CustDto("id02", "pwd01", "james"));
        list.add(new CustDto("id03", "pwd01", "james"));
        list.add(new CustDto("id04", "pwd01", "james"));
        list.add(new CustDto("id05", "pwd01", "james"));
        return list;
    }

    @RequestMapping("/geo/getdata")
    public Object geoGetData(@RequestParam("location") String location) {
        List<ShopDto> seoulList = new ArrayList<>();
        seoulList.add(new ShopDto(100, "순대국", "seoul/item1.jpg", 37.5547611, 127.0654625));
        seoulList.add(new ShopDto(101, "파스타", "seoul/item2.jpg", 37.5747611, 127.0554625));
        seoulList.add(new ShopDto(102, "햄버거", "seoul/item3.jpg", 37.5147611, 127.0154625));

        List<ShopDto> busanList = new ArrayList<>();
        busanList.add(new ShopDto(100, "삼오정", "busan/item1.jpg", 35.156618, 129.053881));
        busanList.add(new ShopDto(101, "본전돼지국밥", "busan/item2.jpg", 35.116617, 129.041379));

        List<ShopDto> jejuList = new ArrayList<>();
        jejuList.add(new ShopDto(100, "제주공항 그때그집", "jeju/item1.jpg", 33.510332, 126.482714));
        jejuList.add(new ShopDto(101, "놀봄흙돼지", "jeju/item2.jpg", 33.479314, 126.472934));

        if (location.equals("Busan")) return busanList;
        if (location.equals("Jeju")) return jejuList;

        return seoulList;
    }

    @RequestMapping("/getsearchrank")
    public Object getSearchRank() {
        Random random = new Random();
        List<KeywordDto> list = new ArrayList<>();
        String[] bankArray = new String[]{"하나은행","국민은행","신한은행","카카오뱅크","토스뱅크"};
        List<String> bankList = new ArrayList<>();

        for(String bank: bankArray) {
            bankList.add(bank);
        }

        Collections.shuffle(bankList);

        for (int index = 1; index <= bankArray.length; index++) {
            list.add(new KeywordDto(index, bankList.get(index-1)));
        }

        return list;
    }

    @RequestMapping("/checkid")
    public Object checkid(@RequestParam("id") String id) {
        // 입력받은 id가 존재하면 "0", 존재하지 않으면 "1"을 반환한다
        String result = "1";

        // 존재하면 id라면
        if (id.equals("admin")) {
            result = "0";
        }
        return result;
    }
}
