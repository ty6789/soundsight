package com.example.soundsightapp.infrastructpure.mysql.po;

import lombok.Data;

@Data
public class Follow {

    private Integer id;

    private Integer userId;

    private Integer followedId;
}
