package com.example.soundsightapp.domain.video.service;

import com.example.soundsight.type.VideoResponse;
import com.example.soundsightapp.domain.video.repository.IVideoRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class VideoService {

    @Resource
    private IVideoRepository videoRepository;

    public List<VideoResponse> getVideos (Integer userId, String type) {
        return videoRepository.getVideo(userId, type);
    }

    public List<VideoResponse> getFavorites(Integer userId) {
        return videoRepository.getFavorites(userId);
    }


    public VideoResponse findVideoByIdAndTypeAndUserId(String videoId, String videoType, String userId) {
        return videoRepository.getVideoByIdAndTypeAndUserId(videoId, videoType, userId);
    }

    public List<VideoResponse> searchVideos(String keyWords, Integer userId) {
        return videoRepository.searchVideos(keyWords, userId);
    }

    public List<VideoResponse> findVideoByIdAndUserId(String id, String myId, Integer page, Integer size) {
        return videoRepository.findVideoByIdAndUserId(id, myId, page, size);
    }
}
