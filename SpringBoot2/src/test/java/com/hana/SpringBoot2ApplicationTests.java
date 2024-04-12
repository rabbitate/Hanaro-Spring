package com.hana;

import com.hana.util.StringEncryptor;
import lombok.extern.slf4j.Slf4j;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class SpringBoot2ApplicationTests {

	@Test
	void contextLoads() {
		String text = "abc";
		String atext = StringEncryptor.encryptor(text);
		String aatext = StringEncryptor.decryptor(atext);

		log.info("----- LOG -----");
		log.info(atext);
		log.info(aatext);
	}
}
