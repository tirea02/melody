package com.melody.dao;

import com.melody.model.Hashtag;
import com.melody.model.Song;
import com.melody.util.DatabaseConfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SongDAO {

    // Method to add a new Song to the database
    public void addSong(Song song) throws SQLException {
        String sql = "INSERT INTO Song (Song_ID, Album_ID, Title, Song_Info, Lyrics, Duration, Likes, Singer_ID, Genre_ID, Song_Hashtags, URL) " +
                "VALUES (song_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            setPreparedStatement(song, pstmt);

            pstmt.executeUpdate();
        }
    }

    private void setPreparedStatement(Song song, PreparedStatement pstmt) throws SQLException {
        pstmt.setLong(1, song.getAlbumId());
        pstmt.setString(2, song.getTitle());
        pstmt.setString(3, song.getSongInfo());
        pstmt.setString(4, song.getLyrics());
        pstmt.setInt(5, song.getDuration());
        pstmt.setLong(6, song.getSingerId());
        pstmt.setLong(7, song.getGenreId()); // Set the Genre_ID
        pstmt.setString(8, getSongHashtagsAsString(song));
        pstmt.setString(9, song.getUrl());
    }


    // Method to retrieve a Song by its songId from the database
    public Song getSongById(long songId) throws SQLException {
        String sql = "SELECT * FROM Song WHERE Song_ID = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setLong(1, songId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return createSongFromResultSet(rs);
                }
            }
        }
        return null;
    }

    // Method to update an existing Song in the database
    public void updateSong(Song song) throws SQLException {
        String sql = "UPDATE Song SET Album_ID = ?, Title = ?, Song_Info = ?, Lyrics = ?, Duration = ?, Singer_ID = ?, " +
                "Genre_ID = ?, Song_Hashtags = ?, URL = ? WHERE Song_ID = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            setPreparedStatement(song, pstmt);
            pstmt.setString(8, getSongHashtagsAsString(song));
            pstmt.setLong(10, song.getSongId());

            pstmt.executeUpdate();
        }
    }

    // Method to delete a Song from the database
    public void deleteSong(long songId) throws SQLException {
        String sql = "DELETE FROM Song WHERE Song_ID = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setLong(1, songId);
            pstmt.executeUpdate();
        }
    }

    // Method to retrieve all Songs from the database
    public List<Song> getAllSongs() throws SQLException {
        List<Song> songs = new ArrayList<>();
        String sql = "SELECT * FROM Song";

        try (Connection conn = DatabaseConfig.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                songs.add(createSongFromResultSet(rs));
            }
        }
        return songs;
    }

    // Method to search for Songs based on the provided criteria
    public List<Song> searchSongs(String searchCriteria) throws SQLException {
        List<Song> songs = new ArrayList<>();
        String searchQuery = "SELECT * FROM Song WHERE Title LIKE ? OR Song_Info LIKE ? OR Lyrics LIKE ? OR Song_Hashtags LIKE ?";
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(searchQuery)) {

            String searchParam = "%" + searchCriteria + "%";
            pstmt.setString(1, searchParam);
            pstmt.setString(2, searchParam);
            pstmt.setString(3, searchParam);
            pstmt.setString(4, searchParam);

            try (ResultSet resultSet = pstmt.executeQuery()) {
                while (resultSet.next()) {
                    songs.add(createSongFromResultSet(resultSet));
                }
            }
        }
        return songs;
    }

    // Helper method to create a Song object from a ResultSet row
    private Song createSongFromResultSet(ResultSet resultSet) throws SQLException {
        Song song = new Song();
        long songId = resultSet.getLong("Song_ID");

        song.setSongId(songId);
        song.setAlbumId(resultSet.getLong("Album_ID"));
        song.setTitle(resultSet.getString("Title"));
        song.setSongInfo(resultSet.getString("Song_Info"));
        song.setLyrics(resultSet.getString("Lyrics"));
        song.setDuration(resultSet.getInt("Duration"));
        song.setLikes(resultSet.getInt("Likes"));
        song.setSingerId(resultSet.getLong("Singer_ID"));
        song.setGenreId(resultSet.getLong("Genre_ID")); // Set the Genre_ID
        // Fetch the list of hashtags for the song using SongDAO.getHashtagsForSong()

        List<Hashtag> hashtags = getHashtagsForSong(songId);
        song.setSongHashtags(hashtags);
        song.setUrl(resultSet.getString("URL"));
        return song;
    }

    // Method to retrieve all hashtags associated with a specific Song
    public List<Hashtag> getHashtagsForSong(long songId) throws SQLException {
        List<Hashtag> hashtags = new ArrayList<>();
        String sql = "SELECT h.Hashtag_ID, h.Hashtag_Value " +
                "FROM Hashtag h " +
                "JOIN Song s ON s.Song_Hashtags LIKE CONCAT('%', h.Hashtag_Value, '%') " +
                "WHERE s.Song_ID = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setLong(1, songId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Hashtag hashtag = new Hashtag();
                    hashtag.setHashtagId(rs.getLong("Hashtag_ID"));
                    hashtag.setHashtagValue(rs.getString("Hashtag_Value"));
                    hashtags.add(hashtag);
                }
            }
        }
        return hashtags;
    }

    // Helper method to convert hashtags to a comma-separated string
    public String getSongHashtagsAsString(Song song) {
        StringBuilder sb = new StringBuilder();
        List<Hashtag> hashtags = song.getSongHashtags();
        if (hashtags != null && !hashtags.isEmpty()) {
            for (int i = 0; i < hashtags.size(); i++) {
                if (i > 0) {
                    sb.append(", ");
                }
                sb.append(hashtags.get(i).getHashtagValue());
            }
        }
        return sb.toString();
    }
}
