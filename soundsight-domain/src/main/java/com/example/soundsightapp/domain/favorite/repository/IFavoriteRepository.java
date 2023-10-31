package com.example.soundsightapp.domain.favorite.repository;

import org.springframework.stereotype.Repository;


public interface IFavoriteRepository {
    void addFavorite(Integer userId, Integer itemId, String itemType);

    void delFavorite(Integer userId, Integer itemId, String itemType);
}
