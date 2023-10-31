package com.example.soundsight.type;

public class VideoResponseBuilder {

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

    public VideoResponseBuilder coverURL(String coverURL) {
        this.coverURL = coverURL;
        return this;
    }

    public VideoResponseBuilder videoURL(String videoURL) {
        this.videoURL = videoURL;
        return this;
    }

    public VideoResponseBuilder videoId(Integer videoId) {
        this.videoId = videoId;
        return this;
    }

    public VideoResponseBuilder liked(Boolean liked) {
        isLiked = liked;
        return this;
    }

    public VideoResponseBuilder videoType(String videoType) {
        this.videoType = videoType;
        return this;
    }

    public VideoResponseBuilder favorite(Boolean favorite) {
        isFavorite = favorite;
        return this;
    }

    public VideoResponseBuilder userId(Integer userId) {
        this.userId = userId;
        return this;
    }

    public VideoResponseBuilder username(String username) {
        this.username = username;
        return this;
    }

    public VideoResponseBuilder avatar(String avatar) {
        this.avatar = avatar;
        return this;
    }


    public VideoResponseBuilder likeCount(Integer likeCount) {
        this.likeCount = likeCount;
        return this;
    }

    public VideoResponseBuilder favoriteCount(Integer favoriteCount) {
        this.favoriteCount = favoriteCount;
        return this;
    }

    public VideoResponseBuilder followed(boolean followed) {
        this.isFollowed = followed;
        return this;
    }


    public VideoResponseBuilder descr(String descr) {
        this.descr = descr;
        return this;
    }

    public VideoResponse build() {
        return new VideoResponse(coverURL, videoURL, videoId, isLiked, isFavorite, userId, username, avatar, likeCount, favoriteCount, isFollowed, descr, videoType);
    }
}
