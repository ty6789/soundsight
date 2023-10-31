package com.example.soundsightapp;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@Configurable
@EnableScheduling
public class SoundsightAppApplication {

    public static void main(String[] args) {
        SpringApplication.run(SoundsightAppApplication.class, args);
    }

}
