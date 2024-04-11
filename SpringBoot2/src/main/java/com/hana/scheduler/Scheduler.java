package com.hana.scheduler;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class Scheduler {

    @Scheduled(cron = "*/15 * * * * *")
    public void cronJobDailyUpdate() {
        log.info("\n\n");
        log.info("-------------");
        log.info("사용자 로그인 정보를 조회하여 로그를 기록");
        log.info("-------------");
        log.info("\n\n");
    }

    @Scheduled(cron = "1 0 0 1,8,15,22 * *")
    public void cronJobWeeklyUpdate(){

    }
}