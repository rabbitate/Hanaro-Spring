package com.hana.custaddr;

import com.hana.app.data.entity.CustAddrEntity;
import com.hana.app.data.entity.CustEntity;
import com.hana.app.service.CustAddrService;
import com.hana.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
public class InsertTests {
    @Autowired
    CustAddrService custAddrService;

    @Test
    void contextLoads() {
        CustEntity custEntity = CustEntity.builder().id("id02").build();
        CustAddrEntity custAddr = CustAddrEntity.builder()
                .name("우리집3")
                .addr("Seoul")
                .cust(custEntity)
                .build();
        custAddrService.insert(custAddr);
    }
}
