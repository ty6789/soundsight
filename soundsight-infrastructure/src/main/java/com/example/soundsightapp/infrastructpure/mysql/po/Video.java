package com.example.soundsightapp.infrastructpure.mysql.po;

import lombok.Data;

@Data
public class Video {
    private Integer id;

    private String desc;

    private Integer like;

    private Integer favorite;

    private Integer isHot;
}
