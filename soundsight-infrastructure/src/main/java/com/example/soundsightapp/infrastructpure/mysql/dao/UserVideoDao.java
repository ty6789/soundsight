package com.example.soundsightapp.infrastructpure.mysql.dao;


import com.example.soundsightapp.infrastructpure.mysql.po.UserVideo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserVideoDao {
    UserVideo selectByVideoIdAndType(Integer videoId, String type);
}
