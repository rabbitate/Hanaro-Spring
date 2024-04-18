package com.hana.custinfo;

import com.hana.app.data.entity.CustEntity;
import com.hana.app.data.entity.CustInfoEntity;
import com.hana.app.service.CustInfoService;
import com.hana.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.Optional;

@SpringBootTest
@Slf4j
public class CustInfoTests {
    @Autowired
    CustInfoService custInfoService;

    @Test
    void contextLoads() {
        CustEntity custEntity = CustEntity.builder().id("id02").build();

//        CustInfoEntity custInfoEntity = CustInfoEntity.builder()
//                .cust(custEntity)
//                .addr("Seoul")
//                .age(30)
//                .build();
//        custInfoService.insert(custInfoEntity);

        CustInfoEntity custInfo = custInfoService.get(2L).get();
        log.info(custInfo.toString());
    }
}
