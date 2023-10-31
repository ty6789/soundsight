package com.example.soundsightapp.infrastructpure.mysql.repository;

import com.example.soundsight.type.LoginRequest;
import com.example.soundsight.type.LoginResponse;
import com.example.soundsight.type.RegistrationRequest;
import com.example.soundsightapp.domain.user.repository.IUserRepository;
import com.example.soundsightapp.infrastructpure.mysql.dao.UserDao;
import com.example.soundsightapp.infrastructpure.mysql.po.User;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.Optional;

@Repository
public class UserRepository implements IUserRepository {

    @Resource
    private UserDao userDao;

    @Override
    public ResponseEntity<String> register(RegistrationRequest request) {
        // 校验请求参数
        if (!request.getPassword().equals(request.getConfirmPassword())) {
            return ResponseEntity.badRequest().body("密码不匹配");
        }
        // TODO: 进一步的校验逻辑，例如用户名是否已存在
        String username = request.getUsername();
        if (username.length() > 5)return ResponseEntity.badRequest().body("用户名长度不超过5");
        Integer count = userDao.findUsername(username);
        if (count > 0)return ResponseEntity.badRequest().body("用户名已存在");
        // TODO: 保存用户数据到数据库
        User user = new User();
        user.setUserName(username);
        user.setAvatarCode(Integer.parseInt(request.getSelectedAvatar()));
        user.setPassword(request.getPassword());
        StringBuilder stringBuilder = new StringBuilder();
        for (String s : request.getPreferences()) {
            stringBuilder.append(s);
            stringBuilder.append(",");
        }
        if (stringBuilder.length() == 0) {
            user.setPreferences("");
        }else {
            user.setPreferences(stringBuilder.substring(0, stringBuilder.length() - 1).toString());
        }
        userDao.save(user);
        // 返回响应
        return ResponseEntity.ok("注册成功");
    }

    @Override
    public ResponseEntity<LoginResponse> login(LoginRequest request) {
        String username = request.getUsername();
        String password = request.getPassword();

        Optional<User> optionalUser = userDao.findUserByUsernameAndPassword(username, password);

        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            String url = "http://localhost:8080/photo/" + user.getAvatarCode() + ".png";
            LoginResponse response = new LoginResponse( "登录成功",user.getId(), user.getUserName(), url);
            return ResponseEntity.ok(response);
        } else {
            return ResponseEntity.badRequest().body(new LoginResponse("用户名或密码错误"));
        }
    }
}
