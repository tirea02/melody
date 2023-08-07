package com.melody.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
public class Song {
    private long songId;
    private long albumId;
    private String title;
    private String songInfo;
    private String lyrics;
    private int duration;
    private int likes;
    private long singerId;
    private long genreId; // New field for Genre_ID
    private List<Hashtag> songHashtags;
    private String url;
    private String imageUrl = "default.jpg";
    //편의를 위해 추가
    private String singerName ="default singer name";

    //기능 추가로 추가
    private int playlistCount = 0;

    public Song(long albumId, String title, String songInfo, String lyrics, int duration, int likes, long singerId, long genreId, List<Hashtag> songHashtags, String url) {
        this.albumId = albumId;
        this.title = title;
        this.songInfo = songInfo;
        this.lyrics = lyrics;
        this.duration = duration;
        this.likes = likes;
        this.singerId = singerId;
        this.genreId = genreId;
        this.songHashtags = songHashtags;
        this.url = url;
    }
}
