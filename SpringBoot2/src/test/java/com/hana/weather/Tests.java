package com.hana.weather;

import com.hana.util.WeatherUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.IOException;

@SpringBootTest
@Slf4j
public class Tests {
    @Test
    void contextLoads() throws IOException, ParseException {
        String key = "1j3tIQEY%2F1B%2FIWM%2Bt5L%2BGNZHMp9NB%2BN9QOFgqp5e2KTuTJFr2sQRMkiN%2FznSAfcPouQCnTBBWcM3%2FTjUhgRRhQ%3D%3D";
        String loc = "109";
        JSONObject jsonObject = (JSONObject) WeatherUtil.getWeather(loc, key);
        log.info("\n\n");
        log.info(jsonObject.toJSONString());

        String key2 = "71e07921805df819f7208ac3739bdf7c";
        String loc2 = "1835848";
        JSONObject jsonObject2 = (JSONObject) WeatherUtil.getWeather2(loc2, key2);
        log.info("\n\n");
        log.info(jsonObject2.toJSONString());
    }

}
