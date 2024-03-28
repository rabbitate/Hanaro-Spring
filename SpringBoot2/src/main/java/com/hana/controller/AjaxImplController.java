package com.hana.controller;

import com.hana.app.data.dto.CustDto;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
