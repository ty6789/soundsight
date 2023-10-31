package com.example.soundsight.type;

import lombok.Data;

@Data
public class VideoResponse {

    private String coverURL;
    private String videoURL;

    private Integer videoId;

    private Boolean isLiked;

    private String videoType;

    private Boolean isFavorite;

    private Integer userId;

    private String username;

    private String avatar;

    private Integer likeCount;

    private Integer favoriteCount;

    private boolean isFollowed;

    private String descr;

    public VideoResponse(String coverURL, String videoURL, Integer videoId, Boolean isLiked, Boolean isFavorite, Integer userId, String username, String avatar, Integer likeCount, Integer favoriteCount, boolean isFollowed, String descr, String videoType) {
        this.coverURL = coverURL;
        this.videoURL = videoURL;
        this.videoId = videoId;
        this.isLiked = isLiked;
        this.isFavorite = isFavorite;
        this.userId = userId;
        this.username = username;
        this.avatar = avatar;
        this.likeCount = likeCount;
        this.favoriteCount = favoriteCount;
        this.isFollowed = isFollowed;
        this.descr = descr;
        this.videoType = videoType;
    }
}
