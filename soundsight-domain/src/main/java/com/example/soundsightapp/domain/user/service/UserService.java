package com.example.soundsightapp.domain.user.service;

import com.example.soundsight.type.LoginRequest;
import com.example.soundsight.type.LoginResponse;
import com.example.soundsight.type.RegistrationRequest;
import com.example.soundsightapp.domain.user.repository.IUserRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserService {

    @Resource
    private IUserRepository userRepository;

    public ResponseEntity<String> register(RegistrationRequest registrationRequest) {
        return userRepository.register(registrationRequest);
    }

    public ResponseEntity<LoginResponse> login(LoginRequest request) {
        return userRepository.login(request);
    }
}
