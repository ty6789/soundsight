package com.example.soundsightapp.infrastructpure.mysql.repository;

import com.example.soundsightapp.domain.favorite.repository.IFavoriteRepository;
import com.example.soundsightapp.infrastructpure.mysql.dao.FavoriteDao;
import com.example.soundsightapp.infrastructpure.mysql.dao.VideoDao;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Repository
public class FavoriteRepository implements IFavoriteRepository {

    @Resource
    private FavoriteDao favoriteDao;

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
    public void addFavorite(Integer userId, Integer itemId, String itemType) {
        favoriteDao.addFavorite(userId, itemId, itemType);
        VideoDao videoDao = videoDaos.get(itemType);
        videoDao.addFavorite(itemId);
    }

    @Override
    public void delFavorite(Integer userId, Integer itemId, String itemType) {
        favoriteDao.delFavorite(userId, itemId, itemType);
        VideoDao videoDao = videoDaos.get(itemType);
        videoDao.delFavorite(itemId);
    }
}
