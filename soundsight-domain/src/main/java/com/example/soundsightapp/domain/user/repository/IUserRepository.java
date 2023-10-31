package com.example.soundsightapp.domain.user.repository;

import com.example.soundsight.type.LoginRequest;
import com.example.soundsight.type.LoginResponse;
import com.example.soundsight.type.RegistrationRequest;
import org.springframework.http.ResponseEntity;

public interface IUserRepository {

    ResponseEntity<String> register(RegistrationRequest registrationRequest);

    ResponseEntity<LoginResponse> login(LoginRequest request);
}
