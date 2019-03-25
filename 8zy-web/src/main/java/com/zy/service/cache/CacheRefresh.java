package com.zy.service.cache;

import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.time.LocalDateTime;

@Component
@Slf4j
public class CacheRefresh {

    /**
     * 刷新计费部门缓存
     */
    @PostConstruct
    @Scheduled(cron = "0 0/5 * * * ?")
    public void refresh1() {
        log.info("feeDeptService.uprcc==========={}", LocalDateTime.now());
    }


}
