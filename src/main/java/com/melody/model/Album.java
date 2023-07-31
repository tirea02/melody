package com.melody.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
public class Album {
    private Long albumId;
    private String albumTitle;
    private String coverPhoto;
    private Date releaseDate;
    private String albumInfo;
    private double rating;
    private int replyCount;
    private int likes;
    private String musicVideoLink;
    private List<Hashtag> albumHashtags;

    // Constructor without ID (used when inserting new records)

    public Album(String albumTitle, String coverPhoto, Date releaseDate, String albumInfo, double rating, int replyCount, int likes, String musicVideoLink, List<Hashtag> albumHashtags) {
        this.albumTitle = albumTitle;
        this.coverPhoto = coverPhoto;
        this.releaseDate = releaseDate;
        this.albumInfo = albumInfo;
        this.rating = rating;
        this.replyCount = replyCount;
        this.likes = likes;
        this.musicVideoLink = musicVideoLink;
        this.albumHashtags = albumHashtags;
    }
}
