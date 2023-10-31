package com.example.soundsightapp.infrastructpure.mysql.dao;

import com.example.soundsightapp.infrastructpure.mysql.po.HotVideo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HotVideoDao {
    List<HotVideo> getVideos(Integer index);

    void insertBatch(List<HotVideo> hotVideos);
}
