package com.example.soundsightapp.infrastructpure.mysql.repository;

import com.example.soundsight.type.VideoResponse;
import com.example.soundsightapp.domain.video.repository.IVideoRepository;
import com.example.soundsightapp.infrastructpure.mysql.dao.*;
import com.example.soundsightapp.infrastructpure.mysql.po.Favorite;
import com.example.soundsightapp.infrastructpure.mysql.po.HotVideo;
import com.example.soundsightapp.infrastructpure.mysql.po.Video;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@Repository
public class VideoRepository extends BaseVideoRepository implements IVideoRepository {

    @Autowired
    public VideoRepository(
            FavoriteDao favoriteDao,
            FollowDao followDao,
            UserVideoDao userVideoDao,
            UserDao userDao,
            HotVideoDao hotVideoDao) {
        super.favoriteDao = favoriteDao;
        super.followDao = followDao;
        super.userVideoDao = userVideoDao;
        super.userDao = userDao;
        super.hotVideoDao = hotVideoDao;
    }

    @Resource(name = "sportsVideoDao")
    public void setSportsVideoDao(VideoDao sportsVideoDao) {
        videoDaos.put("sports", sportsVideoDao);
    }

    @Resource(name = "animeVideoDao")
    public void setAnimeVideoDao(VideoDao animeVideoDao) {
        videoDaos.put("anime", animeVideoDao);
    }

    @Resource(name = "artsDao")
    public void setArtsDao(VideoDao artsDao) {
        videoDaos.put("arts", artsDao);
    }

    @Resource(name = "entertainmentDao")
    public void setEntertainmentDao(VideoDao entertainmentDao) {
        videoDaos.put("entertainment", entertainmentDao);
    }

    @Resource(name = "foodVideoDao")
    public void setFoodVideoDao(VideoDao foodVideoDao) {
        videoDaos.put("food", foodVideoDao);
    }

    @Resource(name = "lifestyleDao")
    public void setLifestyleDao(VideoDao lifestyleDao) {
        videoDaos.put("lifestyle", lifestyleDao);
    }

    @Resource(name = "technologyDao")
    public void setTechnologyDao(VideoDao technologyDao) {
        videoDaos.put("technology", technologyDao);
    }

    @Resource(name = "travelDao")
    public void setTravelDao(VideoDao travelDao) {
        videoDaos.put("travel", travelDao);
    }

    @Override
    public List<VideoResponse> getVideo(Integer userId, String type) {
        type = super.recommendVideos(userId, type);
        Integer index = fetchLastIndex(userId, type);
        updateLastIndex(userId, type, index + 2);
        if ("hotvideos".equals(type)) {
            return super.hotVideos(userId, index);
        }
        List<Video> videos = fetchVideos(type, index);
        return mapVideosToResponse(videos, userId, type);
    }

    @Override
    public List<VideoResponse> getFavorites(Integer userId) {
        List<Favorite> userVideos = favoriteDao.getUserVideoByUserId(userId);
        List<VideoResponse> res = new ArrayList<>();
        for (Favorite favorite : userVideos) {
            VideoResponse videoResponse = createVideoResponse(favorite, userId);
            res.add(videoResponse);
        }
        return res;
    }

    @Override
    public VideoResponse getVideoByIdAndTypeAndUserId(String videoId, String videoType, String userId) {
        VideoDao videoDao = videoDaos.get(videoType);
        Video video = videoDao.getVideoById(Integer.parseInt(videoId));
        return createVideoResponse(video, Integer.parseInt(userId), videoType);
    }

    @Override
    public void findHotVideos() {
        List<HotVideo> hotVideos = new ArrayList<>();
        for (Map.Entry<String, VideoDao> entry : videoDaos.entrySet()) {
            String type = entry.getKey();
            VideoDao videoDao = entry.getValue();
            List<Video> videos = videoDao.findHotVideos();
            if (videos == null || videos.isEmpty())continue;
            videoDao.batchUpdateIsHot(videos);
            videos.stream().map(video -> new HotVideo(video.getId(), type)).forEach(hotVideo -> hotVideos.add(hotVideo));
        }
        Collections.shuffle(hotVideos);
        hotVideoDao.insertBatch(hotVideos);
    }
}
