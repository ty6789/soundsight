package com.example.soundsightapp.infrastructpure.mysql.po;

import lombok.Data;

@Data
public class User {
    private Integer id;

    private String userName;

    private String password;

    private Integer avatarCode;

    private String preferences;
}
