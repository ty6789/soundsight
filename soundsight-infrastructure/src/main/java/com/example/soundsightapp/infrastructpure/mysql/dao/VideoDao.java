package com.example.soundsightapp.infrastructpure.mysql.dao;

import com.example.soundsightapp.infrastructpure.mysql.po.Video;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface VideoDao {

    List<Video> getVideos(Integer lastIndex);

    Video getVideoById(Integer videoId);

    List<Video> findHotVideos();
    void addFavorite(Integer itemId);

    void delFavorite(Integer itemId);

    void addLike(Integer itemId);

    void delLike(Integer itemId);

    void batchUpdateIsHot(List<Video> videos);
}
