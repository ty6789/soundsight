package com.example.soundsightapp.infrastructpure.mysql.dao;


import com.example.soundsightapp.infrastructpure.mysql.po.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.Optional;

@Mapper
public interface UserDao {

    Integer findUsername(String username);

    void save(User user);

    Integer findUsernameAndPwd(String username, String password);

    Optional<User> findUserByUsernameAndPassword(String username, String password);

    User getUserById(Integer userId);
}
