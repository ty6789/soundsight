package com.example.soundsight.type;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyFollowResponse {
    private Integer id;
    private String avatar;
    private String username;
}
