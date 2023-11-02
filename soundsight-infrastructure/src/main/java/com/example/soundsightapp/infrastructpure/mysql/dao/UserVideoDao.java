package com.example.soundsightapp.infrastructpure.mysql.dao;


import com.example.soundsightapp.infrastructpure.mysql.po.UserVideo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserVideoDao {
    UserVideo selectByVideoIdAndType(Integer videoId, String type);

    List<UserVideo> findVideosByUserId(String id);
}
