package com.hana.cust;

import com.hana.app.data.entity.CustEntity;
import com.hana.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.Optional;

@SpringBootTest
@Slf4j
public class CustTests {
    @Autowired
    CustService custService;

    @Test
    void contextLoads() {
//        CustEntity custEntity = CustEntity.builder()
//                .id("id01")
//                .name("name01")
//                .pwd("pwd01")
//                .build();
//        custService.insert(custEntity);
//
//        Optional<CustEntity> optionalCustEntity = custService.get("id02");
//        if (optionalCustEntity.isPresent()){
//            log.info(optionalCustEntity.get().toString());
//        }
//
//        CustEntity custEntity2 = CustEntity.builder()
//                .id("id02")
//                .name("xxxx")
//                .pwd("pwd02")
//                .build();
//        custService.insert(custEntity2);
//
//        CustEntity custEntity3 = CustEntity.builder()
//                .id("id02")
//                .name("변경된 이름")
//                .pwd("pwd02")
//                .build();
//        custService.update(custEntity3);

        List<CustEntity> list = custService.get();
        list.forEach(c -> log.info(c.toString()));
    }
}
