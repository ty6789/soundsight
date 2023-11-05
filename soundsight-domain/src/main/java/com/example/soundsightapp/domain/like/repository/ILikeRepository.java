package com.example.soundsightapp.domain.like.repository;

public interface ILikeRepository {
    void addLike(Integer userId, Integer itemId, String itemType);

    void delLike(Integer userId, Integer itemId, String itemType);
}
