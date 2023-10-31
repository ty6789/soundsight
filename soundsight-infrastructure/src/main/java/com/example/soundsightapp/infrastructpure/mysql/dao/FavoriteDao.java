package com.example.soundsightapp.infrastructpure.mysql.dao;

import com.example.soundsightapp.infrastructpure.mysql.po.Favorite;
import com.example.soundsightapp.infrastructpure.mysql.po.UserVideo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FavoriteDao {
    void addFavorite(Integer userId, Integer itemId, String itemType);

    void delFavorite(Integer userId, Integer itemId, String itemType);

    Integer count(Integer userId, Integer itemId, String itemType);

    List<Favorite> getUserVideoByUserId(Integer userId);
}
