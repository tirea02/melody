package com.melody.model;

import com.melody.util.DatabaseConfig;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
public class Playlist {
    private long playlistId;
    private long userAccountId;
    private String playlistName;
    private String description;
    private Date createdDate;
    private List<Hashtag> playlistHashtags;

    public Playlist(long userAccountId, String playlistName, String description, Date createdDate, List<Hashtag> playlistHashtags) {
        this.userAccountId = userAccountId;
        this.playlistName = playlistName;
        this.description = description;
        this.createdDate = createdDate;
        this.playlistHashtags = playlistHashtags;
    }

}
