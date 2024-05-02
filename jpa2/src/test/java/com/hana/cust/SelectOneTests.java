package com.hana.cust;

import com.hana.app.data.entity.CustEntity;
import com.hana.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Optional;

@SpringBootTest
@Slf4j
class SelectOneTests {
    @Autowired
    CustService custService;

    @Test
    void contextLoads() {
        Optional<CustEntity> op = custService.get("id01");
        if (op.isPresent()) {
            CustEntity custEntity = op.get();
            log.info(custEntity.toString());
        }
        log.info("OK");
    }
}