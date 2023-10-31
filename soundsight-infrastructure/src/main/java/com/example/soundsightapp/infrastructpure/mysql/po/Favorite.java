package com.example.soundsightapp.infrastructpure.mysql.po;

import lombok.Data;

@Data
public class Favorite {
    private Integer id;

    private Integer userId;

    private Integer videoId;

    private String videoType;
}
