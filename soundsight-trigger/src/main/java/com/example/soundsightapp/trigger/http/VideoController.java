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

    @GetMapping("/search")
    public List<VideoResponse> searchVideos(@RequestParam String keyWords, @RequestParam Integer userId) {
        return videoService.searchVideos(keyWords, userId);
    }

    @GetMapping("/findVideoById")
<<<<<<< HEAD
    public List<VideoResponse> findVideoById(@RequestParam String id, @RequestParam String myId, @RequestParam Integer page, @RequestParam Integer size) {
        return videoService.findVideoByIdAndUserId(id, myId, page, size);
=======
    public List<VideoResponse> findVideoById(@RequestParam String id, @RequestParam String myId) {
        return videoService.findVideoByIdAndUserId(id, myId);
>>>>>>> f248190e083aba71e5a943309c369f7ecb9ad041
    }
}
