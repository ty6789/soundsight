package com.example.soundsightapp.domain.like.service;

import com.example.soundsightapp.domain.favorite.repository.IFavoriteRepository;
import com.example.soundsightapp.domain.like.repository.ILikeRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class LikeService {

    @Resource
    private ILikeRepository likeRepository;

    public void addLike(Integer userId, Integer itemId, String itemType) {
        likeRepository.addLike(userId, itemId, itemType);
    }

    public void delLike(Integer userId, Integer itemId, String itemType) {
        likeRepository.delLike(userId, itemId, itemType);
    }
}
