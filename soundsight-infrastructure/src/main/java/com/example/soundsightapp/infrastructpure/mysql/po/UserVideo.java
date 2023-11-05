package com.example.soundsightapp.infrastructpure.mysql.po;

import lombok.Data;

@Data
public class UserVideo {
    private Integer id;
    private Integer userId;
    private String username;
    private Integer videoId;
    private String videoType;
    private Integer avatar;
}
