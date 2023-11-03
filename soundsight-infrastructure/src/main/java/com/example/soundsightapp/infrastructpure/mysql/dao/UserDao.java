package com.example.soundsightapp.infrastructpure.mysql.dao;


import com.example.soundsightapp.infrastructpure.mysql.po.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Optional;

@Mapper
public interface UserDao {

    Integer findUsername(String username);

    void save(User user);

    Integer findUsernameAndPwd(@Param("username") String username, @Param("password") String password);

    Optional<User> findUserByUsernameAndPassword(@Param("username") String username, @Param("password") String password);

    User getUserById(Integer userId);
}
