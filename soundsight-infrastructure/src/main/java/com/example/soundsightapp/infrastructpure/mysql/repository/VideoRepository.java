package com.example.soundsightapp.infrastructpure.mysql.repository;


import com.alibaba.fastjson2.JSON;
import com.example.soundsight.type.VideoResponse;
import com.example.soundsightapp.domain.video.repository.IVideoRepository;
import com.example.soundsightapp.infrastructpure.mysql.dao.*;
<<<<<<< HEAD
import com.example.soundsightapp.infrastructpure.mysql.po.*;
=======
import com.example.soundsightapp.infrastructpure.mysql.po.Favorite;
import com.example.soundsightapp.infrastructpure.mysql.po.HotVideo;
import com.example.soundsightapp.infrastructpure.mysql.po.UserVideo;
import com.example.soundsightapp.infrastructpure.mysql.po.Video;
>>>>>>> f248190e083aba71e5a943309c369f7ecb9ad041
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import javax.annotation.Resource;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.builder.SearchSourceBuilder;


@Repository
public class VideoRepository extends BaseVideoRepository implements IVideoRepository {

    @Autowired
    public VideoRepository(
            FavoriteDao favoriteDao,
            UserVideoDao userVideoDao,
            UserDao userDao,
            HotVideoDao hotVideoDao) {
        super.favoriteDao = favoriteDao;
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
        if (hotVideos == null || hotVideos.size() == 0)return;
        Collections.shuffle(hotVideos);
        hotVideoDao.insertBatch(hotVideos);
    }

    @Override
    public List<VideoResponse> searchVideos(String keyWords, Integer userId) {
        SearchRequest searchRequest = new SearchRequest("videos");
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
        sourceBuilder.query(QueryBuilders.matchQuery("desc", keyWords));
        searchRequest.source(sourceBuilder);

        SearchResponse searchResponse = null;
        try {
            searchResponse = restHighLevelClient.search(searchRequest, RequestOptions.DEFAULT);
        } catch (IOException e) {
            throw new RuntimeException("es搜索失败");
        }
        List<VideoResponse> res = new ArrayList<>();
        SearchHits hits = searchResponse.getHits();
        for (SearchHit hit : hits) {
            String sourceAsString = hit.getSourceAsString();
            Video video = JSON.parseObject(sourceAsString, Video.class);
            VideoDao videoDao = videoDaos.get(video.getType());
            video = videoDao.getVideoById(video.getId());
            res.add(createVideoResponse(video, userId, video.getType()));
        }
        return res;
    }

    @Override
<<<<<<< HEAD
    public List<VideoResponse> findVideoByIdAndUserId(String id, String myId, Integer page, Integer size) {
        List<UserVideo> userVideos = userVideoDao.getUserVideoByUserId(id, page * size, size);
        List<VideoResponse> res = new ArrayList<>();
        for (UserVideo userVideo : userVideos) {
            VideoDao videoDao = videoDaos.get(userVideo.getVideoType());
            Video video = videoDao.getVideoById(userVideo.getVideoId());
            res.add(createVideoResponse(video, Integer.parseInt(myId), userVideo.getVideoType()));
=======
    public List<VideoResponse> findVideoByIdAndUserId(String id, String myId) {
        List<UserVideo> userVideos = userVideoDao.findVideosByUserId(id);
        List<VideoResponse> res = new ArrayList<>();
        for (UserVideo userVideo : userVideos) {
            String type = userVideo.getVideoType();
            VideoDao videoDao = videoDaos.get(type);
            Video video = videoDao.getVideoById(userVideo.getVideoId());
            res.add(createVideoResponse(video, Integer.parseInt(myId), type));
>>>>>>> f248190e083aba71e5a943309c369f7ecb9ad041
        }
        return res;
    }
}
