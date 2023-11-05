package com.example.soundsightapp.infrastructpure.mysql.repository;

import com.example.soundsight.type.VideoResponse;
import com.example.soundsight.type.VideoResponseBuilder;
import com.example.soundsight.type.VideoURLHelper;
import com.example.soundsightapp.infrastructpure.mysql.dao.*;
import com.example.soundsightapp.infrastructpure.mysql.po.*;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.rest.RestHandler;
import org.springframework.data.redis.core.StringRedisTemplate;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public abstract class BaseVideoRepository {

    @Resource
    protected StringRedisTemplate stringRedisTemplate;

    @Resource
    protected RestHighLevelClient restHighLevelClient;
    protected UserDao userDao;
    protected HotVideoDao hotVideoDao;
    protected FavoriteDao favoriteDao;
    protected UserVideoDao userVideoDao;

    protected final Map<String, VideoDao> videoDaos = new HashMap<>();
    protected String recommendVideos(Integer userId, String type) {
        if ("recommendations".equals(type)) {
            String[] preferences = null;
            if (userId != -1) {
                User user = userDao.getUserById(userId);
                if (user.getPreferences() == null || "".equals(user.getPreferences())) {
                    user.setPreferences("anime,arts,entertainment,food,lifestyle,sports,technology,travel");
                }
                preferences = user.getPreferences().split(",");
            }else {
                preferences = "anime,arts,entertainment,food,lifestyle,sports,technology,travel".split(",");
            }
            Object obj = stringRedisTemplate.opsForHash().get("last:index:" + userId, type);
            int index = 0;
            if (obj != null) {
                index = Integer.parseInt(obj.toString());
            }
            type = preferences[index];
            stringRedisTemplate.opsForHash().put("last:index:" + userId, "recommendations", String.valueOf((index + 1) % preferences.length));
        }
        return type;
    }

    protected List<VideoResponse> hotVideos(Integer userId, Integer index) {
        List<HotVideo> hotVideos = hotVideoDao.getVideos(index);
        List<VideoResponse> res = new ArrayList<>();
        for (int i = 0; i < hotVideos.size(); i++) {
            HotVideo hotVideo = hotVideos.get(i);
            String videoType = hotVideo.getVideoType();
            Integer videoId = hotVideo.getVideoId();
            VideoDao videoDao = videoDaos.get(videoType);
            Video video = videoDao.getVideoById(videoId);
            res.add(createVideoResponse(video, userId, videoType));
        }
        return res;
    }

    protected Integer fetchLastIndex(Integer userId, String type) {
        Object obj = stringRedisTemplate.opsForHash().get("last:index:" + userId, type);
        return obj != null ? Integer.parseInt(obj.toString()) : 1;
    }

    protected void updateLastIndex(Integer userId, String type, Integer newIndex) {
        stringRedisTemplate.opsForHash().put("last:index:" + userId, type, String.valueOf(newIndex));
    }
    protected List<Video> fetchVideos(String type, Integer index) {
        VideoDao dao = videoDaos.get(type);
        if (dao == null) {
            throw new RuntimeException("No Dao found for type: " + type);
        }
        return dao.getVideos(index);
    }
    protected List<VideoResponse> mapVideosToResponse(List<Video> videos, Integer userId, String type) {
        return videos.stream()
                .map(video -> createVideoResponse(video, userId, type))
                .collect(Collectors.toList());
    }

    protected VideoResponse createVideoResponse(Favorite favorite, Integer userId) {
        VideoDao videoDao = videoDaos.get(favorite.getVideoType());
        Video video = videoDao.getVideoById(favorite.getVideoId());
        return createVideoResponse(video, userId, favorite.getVideoType());
    }

    protected VideoResponse createVideoResponse(Video video, Integer userId, String type) {
        Integer videoId = video.getId();
        Boolean count = favoriteDao.count(userId, videoId, type);
        UserVideo userVideo = userVideoDao.selectByVideoIdAndType(videoId, type);
        //anime/11.mp4
        String url = VideoURLHelper.getAvatarUrl(userVideo.getAvatar().toString());
        String videoUrl = VideoURLHelper.getVideoUrl(type, videoId);
        String coverURL = VideoURLHelper.getCoverUrl(type, video.getId());
        Boolean isLiked = stringRedisTemplate.opsForSet().isMember(type + video.getId() + ":video:like", String.valueOf(userId));
        Boolean isFollowed = stringRedisTemplate.opsForSet().isMember("following:" + userId, userVideo.getUserId().toString());
        return new VideoResponseBuilder().coverURL(coverURL).videoURL(videoUrl).videoId(videoId).liked(isLiked)
                .favorite(count).userId(userVideo.getUserId()).username(userVideo.getUsername())
                .avatar(url).likeCount(video.getLike()).favoriteCount(video.getFavorite())
                .followed(isFollowed).descr(video.getDesc()).videoType(type).build();
    }
}
