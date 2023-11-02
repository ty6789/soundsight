package com.example.soundsight.type;

import lombok.Data;

@Data
public class FollowRequest {

    private Integer userId;

    private Integer followed;
}
