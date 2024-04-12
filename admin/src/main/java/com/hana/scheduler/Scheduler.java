package com.hana.scheduler;

import com.hana.app.data.msg.AdminMsg;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Random;

@Component
@Slf4j
@RequiredArgsConstructor
public class Scheduler {
    private final SimpMessageSendingOperations simpMessageSendingOperations;

    @Scheduled(cron = "*/3 * * * * *")
    public void cronJobDailyUpdate() {
        Random random = new Random();
        int content1 = random.nextInt(100) + 1;
        int content2 = random.nextInt(1000) + 1;
        int content3 = random.nextInt(500) + 1;
        int content4 = random.nextInt(10) + 1;

        AdminMsg adminMsg = new AdminMsg();
        adminMsg.setContent1(content1);
        adminMsg.setContent2(content2);
        adminMsg.setContent3(content3);
        adminMsg.setContent4(content4);

        simpMessageSendingOperations.convertAndSend("send2", adminMsg);
    }

    @Scheduled(cron = "1 0 0 1,8,15,22 * *")
    public void cronJobWeeklyUpdate(){

    }
}