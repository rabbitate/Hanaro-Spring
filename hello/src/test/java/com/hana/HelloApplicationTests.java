package com.hana;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class HelloApplicationTests {

	// main과 같은 start point가 된다
	@Test
	void contextLoads() {
		log.info("Log Test");
	}

}
