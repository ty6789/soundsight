package com.example.soundsightapp.domain.follow.service;

import com.example.soundsight.type.MyFollowResponse;
import com.example.soundsightapp.domain.follow.repository.IFollowRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class FollowService {

    @Resource
    private IFollowRepository followRepository;

    public void addFollow(Integer userId, Integer followed) {
        followRepository.addFollow(userId, followed);
    }

    public void delFollow(Integer userId, Integer followed) {
        followRepository.delFollow(userId, followed);
    }

    public List<MyFollowResponse> getMyFollow(String userId) {
        return followRepository.getMyFollow(userId);
    }

    public List<MyFollowResponse> getMyFans(String userId) {
        return followRepository.getMyFans(userId);
    }
}
