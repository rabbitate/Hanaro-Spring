package com.hana.custaddr;

import com.hana.app.data.entity.CustAddrEntity;
import com.hana.app.data.entity.CustEntity;
import com.hana.app.service.CustAddrService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class UpdateTests {
    @Autowired
    CustAddrService custAddrService;

    @Test
    void contextLoads() {
        CustEntity custEntity = CustEntity.builder().id("id02").build();
        CustAddrEntity custAddr = CustAddrEntity.builder()
                .id(2L)
                .name("민표집1")
                .addr("Seoul")
                .cust(custEntity)
                .build();
        custAddrService.update(custAddr);
    }
}
