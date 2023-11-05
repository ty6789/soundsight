package com.example.soundsightapp.infrastructpure.mysql.dao;


import com.example.soundsightapp.infrastructpure.mysql.po.UserVideo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserVideoDao {
    UserVideo selectByVideoIdAndType(@Param("videoId") Integer videoId, @Param("type") String type);

<<<<<<< HEAD
    List<UserVideo> getUserVideoByUserId(@Param("id") String id, @Param("offset") Integer offset, @Param("size") Integer size);
=======
    List<UserVideo> findVideosByUserId(String id);
>>>>>>> f248190e083aba71e5a943309c369f7ecb9ad041
}
