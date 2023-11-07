package com.example.soundsight.type;

import lombok.Data;

@Data
public class VideoResponse {

    private String coverURL;
    private String url;

    private Integer id;

    private Boolean isLiked;

    private String type;

    private Boolean isFavorite;

    private Integer userId;

    private String username;

    private String avatar;

    private Integer likeCount;

    private Integer favoriteCount;

    private Boolean isFollowed;

    private String descr;

    public VideoResponse(String coverURL, String url, Integer id, Boolean isLiked, Boolean isFavorite, Integer userId, String username, String avatar, Integer likeCount, Integer favoriteCount, boolean isFollowed, String descr, String type) {
        this.coverURL = coverURL;
        this.url = url;
        this.id = id;
        this.isLiked = isLiked;
        this.isFavorite = isFavorite;
        this.userId = userId;
        this.username = username;
        this.avatar = avatar;
        this.likeCount = likeCount;
        this.favoriteCount = favoriteCount;
        this.isFollowed = isFollowed;
        this.descr = descr;
        this.type = type;
    }
}
