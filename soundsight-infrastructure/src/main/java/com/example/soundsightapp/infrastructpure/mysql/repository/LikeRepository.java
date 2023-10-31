package com.example.soundsightapp.infrastructpure.mysql.repository;

import com.example.soundsightapp.domain.like.repository.ILikeRepository;
import com.example.soundsightapp.infrastructpure.mysql.dao.VideoDao;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Repository
public class LikeRepository implements ILikeRepository {

    @Resource
    private StringRedisTemplate stringRedisTemplate;

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

    protected final Map<String, VideoDao> videoDaos = new HashMap<>();

    @Override
    public void addLike(Integer userId, Integer itemId, String itemType) {
        stringRedisTemplate.opsForSet().add(itemType + itemId + ":video:like", String.valueOf(userId));
        VideoDao videoDao = videoDaos.get(itemType);
        videoDao.addLike(itemId);
    }

    @Override
    public void delLike(Integer userId, Integer itemId, String itemType) {
        stringRedisTemplate.opsForSet().remove(itemType + itemId + ":video:like", String.valueOf(userId));
        VideoDao videoDao = videoDaos.get(itemType);
        videoDao.delLike(itemId);
    }
}
