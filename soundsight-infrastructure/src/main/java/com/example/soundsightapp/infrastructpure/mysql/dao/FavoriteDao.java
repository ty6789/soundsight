package com.example.soundsightapp.infrastructpure.mysql.dao;

import com.example.soundsightapp.infrastructpure.mysql.po.Favorite;
import com.example.soundsightapp.infrastructpure.mysql.po.UserVideo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface FavoriteDao {
    void addFavorite(@Param("userId") Integer userId, @Param("itemId") Integer itemId, @Param("itemType") String itemType);

    void delFavorite(@Param("userId") Integer userId, @Param("itemId") Integer itemId, @Param("itemType") String itemType);

    Integer count(@Param("userId") Integer userId, @Param("itemId") Integer itemId, @Param("itemType") String itemType);

    List<Favorite> getUserVideoByUserId(Integer userId);
}
