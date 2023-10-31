package com.example.soundsight.type;

import jdk.nashorn.internal.objects.annotations.Constructor;
import lombok.Data;

@Data
public class LoginResponse {

    private String message;
    private Integer userId;

    private String username;

    private String avatarUrl;

    public LoginResponse(String message, Integer userId, String username, String avatarUrl) {
        this.message = message;
        this.userId = userId;
        this.username = username;
        this.avatarUrl = avatarUrl;
    }

    public LoginResponse() {

    }

    public LoginResponse(String message) {
        this.message = message;
    }
}
