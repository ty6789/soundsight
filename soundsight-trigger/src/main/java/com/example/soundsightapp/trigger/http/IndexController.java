package com.example.soundsightapp.trigger.http;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.soundsight.type.VideoResponse;
import com.example.soundsightapp.domain.video.service.VideoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@Slf4j
@Controller
@RequestMapping("/")
public class IndexController {

    @Resource
    private VideoService videoService;

    @RequestMapping("/")
    public String index(@CookieValue(value = "userId", defaultValue = "-1") String userId,
                        @RequestParam(value = "videoId", required = false, defaultValue = "") String videoId,
                        @RequestParam(value = "videoType", required = false, defaultValue = "") String videoType, Model model) {
        if (videoId != null && !"".equals(videoId) && videoType != null && !"".equals(videoType)) {
            // 根据videoId和videoType查找视频
            VideoResponse video = videoService.findVideoByIdAndTypeAndUserId(videoId, videoType, userId);
            // 将视频对象添加到模型中
            model.addAttribute("video", JSON.toJSONString(video));
        }
        return "index/index";
    }

}

