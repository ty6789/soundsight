package com.example.soundsightapp.trigger.task;

import com.example.soundsightapp.domain.video.repository.IVideoRepository;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.time.LocalDateTime;

@Component
public class FindHotVideosTask {

    @Resource
    private IVideoRepository videoRepository;

    @Scheduled(cron = "0 */3 * * * ?")  // 每3分钟执行一次
    public void executeTask() {
        videoRepository.findHotVideos();
    }
}
