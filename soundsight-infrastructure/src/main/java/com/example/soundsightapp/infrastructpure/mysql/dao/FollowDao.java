package com.example.soundsightapp.infrastructpure.mysql.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FollowDao {

    Integer count(Integer userId, Integer followedId);
}
