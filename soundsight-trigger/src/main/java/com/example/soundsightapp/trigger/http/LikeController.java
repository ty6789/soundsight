package com.example.soundsightapp.trigger.http;

import com.example.soundsight.type.FavoriteRequest;
import com.example.soundsightapp.domain.favorite.service.FavoriteService;
import com.example.soundsightapp.domain.like.service.LikeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping("/like")
@Slf4j
public class LikeController {

    @Resource
    private LikeService likeService;

    @PostMapping
    public void addFavorite(@RequestBody FavoriteRequest favoriteRequest) {
        likeService.addLike(favoriteRequest.getUserId(), favoriteRequest.getItemId(), favoriteRequest.getItemType());
    }

    @DeleteMapping
    public void deleteFavorite(@RequestBody FavoriteRequest favoriteRequest) {
        likeService.delLike(favoriteRequest.getUserId(), favoriteRequest.getItemId(), favoriteRequest.getItemType());
    }
}
