package com.example.soundsight.type;


public class VideoURLHelper {

    public static String getAvatarUrl(String avatar) {
        return "http://124.221.174.197/photo/" + avatar + ".png";
    }

    public static String getVideoUrl(String type, Integer videoId) {
        return "http://s3851afdl.bkt.clouddn.com/" + type + "/" + videoId + ".mp4";
    }

    public static String getCoverUrl(String type, Integer videoId) {
        return "http://s3851afdl.bkt.clouddn.com/" + type + "/" + videoId + ".jpg";
    }
}
