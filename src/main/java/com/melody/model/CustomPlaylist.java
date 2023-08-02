package com.melody.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Data
@NoArgsConstructor
public class CustomPlaylist {
    private long playlistId;
    private String playlistName;
    private List<Song> songs;

    // Constructor
    public CustomPlaylist(long playlistId, String playlistName) {
        this.playlistId = playlistId;
        this.playlistName = playlistName;
        this.songs = new ArrayList<>();
    }


}