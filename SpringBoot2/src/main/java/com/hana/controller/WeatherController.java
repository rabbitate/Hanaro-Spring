package com.hana.controller;

import com.hana.util.WeatherUtil;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;

@Controller
@RequestMapping("/weather")
public class WeatherController {
    @Value("${app.key.whkey}")
    String whkey;

    String dir = "weather/";

    @RequestMapping("/")
    public String main(Model model) throws IOException, ParseException {
        JSONObject weatherJSON = (JSONObject) WeatherUtil.getWeather2("1835848", whkey);
        model.addAttribute("weather", weatherJSON);
        model.addAttribute("center", dir + "center");
        return "index";
    }
}
