package com.example.soundsightapp.infrastructpure.mysql.po;

import lombok.Data;

@Data
public class HotVideo {
    private Integer id;
    private Integer videoId;
    private String videoType;

    public HotVideo(Integer videoId, String videoType) {
        this.videoId = videoId;
        this.videoType = videoType;
    }
}
