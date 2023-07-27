package com.melody.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SongSimple {
    private Long id;
    private String title;
    private String artist;
    private String album;
    private String url;

    public SongSimple(Long id, String title, String artist, String album, String url) {
        this.id = id;
        this.title = title;
        this.artist = artist;
        this.album = album;
        this.url = url;
    }

}
