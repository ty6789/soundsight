package com.example.soundsightapp.infrastructpure.mysql.repository;

import com.example.soundsight.type.MyFollowResponse;
import com.example.soundsight.type.VideoURLHelper;
import com.example.soundsightapp.domain.follow.repository.IFollowRepository;
import com.example.soundsightapp.infrastructpure.mysql.dao.UserDao;
import com.example.soundsightapp.infrastructpure.mysql.po.User;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Repository
public class FollowRepository implements IFollowRepository {

    @Resource
    private UserDao userDao;
    @Resource
    private StringRedisTemplate stringRedisTemplate;
    @Override
    public void addFollow(Integer userId, Integer followed) {
        stringRedisTemplate.opsForSet().add("following:" + userId, followed.toString());
        stringRedisTemplate.opsForSet().add("followed:" + followed, userId.toString());
    }

    @Override
    public void delFollow(Integer userId, Integer followed) {
        stringRedisTemplate.opsForSet().remove("following:" + userId, followed.toString());
        stringRedisTemplate.opsForSet().remove("followed:" + followed, userId.toString());
    }

    @Override
    public List<MyFollowResponse> getMyFollow(String userId) {
        Set<String> myFollows = stringRedisTemplate.opsForSet().members("following:" + userId);
        List<MyFollowResponse> res = new ArrayList<>();
        for (String id : myFollows) {
            User user = userDao.getUserById(Integer.parseInt(id));
            res.add(new MyFollowResponse(user.getId(), VideoURLHelper.getAvatarUrl(user.getAvatarCode().toString()), user.getUserName()));
        }
        return res;
    }

    @Override
    public List<MyFollowResponse> getMyFans(String userId) {
        Set<String> myFollows = stringRedisTemplate.opsForSet().members("followed:" + userId);
        List<MyFollowResponse> res = new ArrayList<>();
        for (String id : myFollows) {
            User user = userDao.getUserById(Integer.parseInt(id));
            res.add(new MyFollowResponse(user.getId(), VideoURLHelper.getAvatarUrl(user.getAvatarCode().toString()), user.getUserName()));
        }
        return res;
    }
}
