package com.melody.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class UserAccount {
    private int userAccountId;
    private String name;
    private Date birthDate;
    private String ageGroup;
    private String accountId;
    private String password;
    private String email;
    private String gender;
    private String profileImage = "default_profile_image.jpg";
    private String userHashtags;


    // Add getters and setters for all the fields
}