package com.example.soundsightapp.trigger.http;

import com.example.soundsight.type.VideoResponse;
import com.example.soundsightapp.domain.video.service.VideoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/video")
@Slf4j
public class VideoController {

    @Resource
    private VideoService videoService;

    @GetMapping("/getVideoURL")
    public List<VideoResponse> getVideoURL(
            @RequestParam Integer userId,
            @RequestParam String category) {
        return videoService.getVideos(userId, category);
    }

    @GetMapping("/getFavorites")
    public List<VideoResponse> getFavorites(@RequestParam Integer userId) {
        return videoService.getFavorites(userId);
    }
}
