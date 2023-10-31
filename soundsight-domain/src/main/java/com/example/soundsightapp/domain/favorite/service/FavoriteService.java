package com.example.soundsightapp.domain.favorite.service;

import com.example.soundsightapp.domain.favorite.repository.IFavoriteRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class FavoriteService {

    @Resource
    private IFavoriteRepository favoriteRepository;
    public void addFavorite(Integer userId, Integer itemId, String itemType) {
        favoriteRepository.addFavorite(userId, itemId, itemType);
    }

    public void delFavorite(Integer userId, Integer itemId, String itemType) {
        favoriteRepository.delFavorite(userId, itemId, itemType);
    }
}
