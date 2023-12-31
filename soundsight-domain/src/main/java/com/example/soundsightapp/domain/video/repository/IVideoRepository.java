package com.example.soundsightapp.domain.video.repository;


import com.example.soundsight.type.VideoResponse;

import java.util.List;

public interface IVideoRepository {

    List<VideoResponse> getVideo(Integer userId, String type);

    List<VideoResponse> getFavorites(Integer userId);

    VideoResponse getVideoByIdAndTypeAndUserId(String videoId, String videoType, String userId);

    void findHotVideos();

    List<VideoResponse> searchVideos(String keyWords, Integer userId);

    List<VideoResponse> findVideoByIdAndUserId(String id, String myId, Integer page, Integer size);
}
