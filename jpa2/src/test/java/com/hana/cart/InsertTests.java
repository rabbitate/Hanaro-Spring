package com.hana.cart;

import com.hana.app.data.entity.CartEntity;
import com.hana.app.data.entity.CustEntity;
import com.hana.app.data.entity.ItemEntity;
import com.hana.app.service.CartService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class InsertTests {
    @Autowired
    CartService cartService;

    @Test
    void contextLoads() {
        CustEntity custEntity = CustEntity.builder()
                .id("id01")
                .build();
        ItemEntity itemEntity = ItemEntity.builder()
                .id(4)
                .build();

        CartEntity cartEntity = CartEntity.builder()
                .cnt(3)
                .cust(custEntity)
                .item(itemEntity)
                .build();
        cartService.insert(cartEntity);
    }

}