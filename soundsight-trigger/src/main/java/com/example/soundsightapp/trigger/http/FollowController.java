package com.example.soundsightapp.trigger.http;

import com.example.soundsight.type.FavoriteRequest;
import com.example.soundsight.type.FollowRequest;
import com.example.soundsight.type.MyFollowResponse;
import com.example.soundsightapp.domain.favorite.service.FavoriteService;
import com.example.soundsightapp.domain.follow.service.FollowService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/follow")
@Slf4j
public class FollowController {

    @Resource
    private FollowService followService;

    @PostMapping
    public void addFavorite(@RequestBody FollowRequest followRequest) {
        followService.addFollow(followRequest.getUserId(), followRequest.getFollowed());
    }

    @DeleteMapping
    public void deleteFavorite(@RequestBody FollowRequest followRequest) {
        followService.delFollow(followRequest.getUserId(), followRequest.getFollowed());
    }

    @GetMapping("/myFollow")
    public List<MyFollowResponse> getMyFollow(@RequestParam String userId) {
        return followService.getMyFollow(userId);
    }

    @GetMapping("/myFans")
    public List<MyFollowResponse> getMyFans(@RequestParam String userId) {
        return followService.getMyFans(userId);
    }
}
