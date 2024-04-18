package com.hana.util;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Value;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Base64;
import java.util.Date;

public class KoGPTUtil {
    @Value("${app.key.kakao_rest_key")
    private static String key;

    public static String getMsg(String key, String msg) throws Exception {
        String apiURL = "https://api.kakaobrain.com/v1/inference/kogpt/generation";
        URL url = new URL(apiURL);
        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json;UTF-8");
        con.setRequestProperty("Authorization", "KakaoAK " + key);	//Property 설정

        // post request
        //  String postParams = "content=" + text;
        con.setDoOutput(true);

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("prompt","오늘 날씨 어때");
        jsonObject.put("max_tokens",120);


        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
        wr.write(jsonObject.toString().getBytes("UTF-8"));
        wr.flush();
        wr.close();

        int responseCode = con.getResponseCode();
        BufferedReader br;
        if(responseCode==200) { // 정상 호출
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        } else {  // 오류 발생
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }
        String inputLine;
        StringBuffer response = new StringBuffer();
        while ((inputLine = br.readLine()) != null) {
            response.append(inputLine);
        }
        br.close();

        JSONParser jsonParser = new JSONParser();
        JSONObject returnObject = null;
        returnObject = (JSONObject) jsonParser.parse(response.toString());
        JSONArray ja = (JSONArray) returnObject.get("generations");
        JSONObject jo = (JSONObject) ja.get(0);
        String result = (String) jo.get("text");

        return result;
    }
}
