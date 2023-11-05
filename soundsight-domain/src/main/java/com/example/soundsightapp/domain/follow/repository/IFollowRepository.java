package com.example.soundsightapp.domain.follow.repository;

import com.example.soundsight.type.MyFollowResponse;

import java.util.List;

public interface IFollowRepository {
    void addFollow(Integer userId, Integer followed);

    void delFollow(Integer userId, Integer followed);

    List<MyFollowResponse> getMyFollow(String userId);

    List<MyFollowResponse> getMyFans(String userId);
}
