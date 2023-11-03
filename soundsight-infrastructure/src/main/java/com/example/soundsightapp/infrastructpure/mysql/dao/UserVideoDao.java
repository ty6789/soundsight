package com.example.soundsightapp.infrastructpure.mysql.dao;


import com.example.soundsightapp.infrastructpure.mysql.po.UserVideo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserVideoDao {
    UserVideo selectByVideoIdAndType(@Param("videoId") Integer videoId, @Param("type") String type);

    List<UserVideo> findVideosByUserId(String id);
}
