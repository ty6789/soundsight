package com.example.soundsight.type;

import lombok.Data;

@Data
public class VideoResponse {

    private String coverURL;
<<<<<<< HEAD
    private String url;

    private Integer id;

    private Boolean isLiked;

    private String type;
=======
    private String videoURL;

    private Integer videoId;

    private Boolean isLiked;

    private String videoType;
>>>>>>> f248190e083aba71e5a943309c369f7ecb9ad041

    private Boolean isFavorite;

    private Integer userId;

    private String username;

    private String avatar;

    private Integer likeCount;

    private Integer favoriteCount;

    private Boolean isFollowed;

    private String descr;

<<<<<<< HEAD
    public VideoResponse(String coverURL, String url, Integer id, Boolean isLiked, Boolean isFavorite, Integer userId, String username, String avatar, Integer likeCount, Integer favoriteCount, boolean isFollowed, String descr, String type) {
        this.coverURL = coverURL;
        this.url = url;
        this.id = id;
=======
    public VideoResponse(String coverURL, String videoURL, Integer videoId, Boolean isLiked, Boolean isFavorite, Integer userId, String username, String avatar, Integer likeCount, Integer favoriteCount, boolean isFollowed, String descr, String videoType) {
        this.coverURL = coverURL;
        this.videoURL = videoURL;
        this.videoId = videoId;
>>>>>>> f248190e083aba71e5a943309c369f7ecb9ad041
        this.isLiked = isLiked;
        this.isFavorite = isFavorite;
        this.userId = userId;
        this.username = username;
        this.avatar = avatar;
        this.likeCount = likeCount;
        this.favoriteCount = favoriteCount;
        this.isFollowed = isFollowed;
        this.descr = descr;
<<<<<<< HEAD
        this.type = type;
=======
        this.videoType = videoType;
>>>>>>> f248190e083aba71e5a943309c369f7ecb9ad041
    }
}
