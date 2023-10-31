package com.example.soundsight.type;

import lombok.Data;

@Data
public class FavoriteRequest {
    private Integer userId;
    private Integer itemId;
    private String itemType;
}
