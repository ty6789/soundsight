package com.example.soundsightapp.trigger.http;

import com.example.soundsight.type.FavoriteRequest;
import com.example.soundsightapp.domain.favorite.service.FavoriteService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping("/favorite")
@Slf4j
public class FavoriteController {

    @Resource
    private FavoriteService favoriteService;

    @PostMapping
    public void addFavorite(@RequestBody FavoriteRequest favoriteRequest) {
        favoriteService.addFavorite(favoriteRequest.getUserId(), favoriteRequest.getItemId(), favoriteRequest.getItemType());
    }

    @DeleteMapping
    public void deleteFavorite(@RequestBody FavoriteRequest favoriteRequest) {
        favoriteService.delFavorite(favoriteRequest.getUserId(), favoriteRequest.getItemId(), favoriteRequest.getItemType());
    }
}
