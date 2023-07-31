package com.melody.dao;

import com.melody.model.Hashtag;
import com.melody.model.Playlist;
import com.melody.util.DatabaseConfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PlaylistDAO {

    // Method to add a new Playlist to the database
    public void addPlaylist(Playlist playlist) throws SQLException {
        String sql = "INSERT INTO Playlist (Playlist_ID, UserAccount_ID, Playlist_Name, Description, Created_Date, Playlist_Hashtags) " +
                "VALUES (playlist_seq.NEXTVAL, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setLong(1, playlist.getUserAccountId());
            pstmt.setString(2, playlist.getPlaylistName());
            pstmt.setString(3, playlist.getDescription());
            pstmt.setDate(4, new java.sql.Date(playlist.getCreatedDate().getTime()));
            pstmt.setString(5, getPlaylistHashtagsAsString(playlist)); // Convert hashtags to a comma-separated string

            pstmt.executeUpdate();
        }
    }

    // Method to retrieve a Playlist by its playlistId from the database
    public Playlist getPlaylistById(long playlistId) throws SQLException {
        String sql = "SELECT * FROM Playlist WHERE Playlist_ID = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setLong(1, playlistId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return createPlaylistFromResultSet(rs);
                }
            }
        }
        return null;
    }

    // Method to update an existing Playlist in the database
    public void updatePlaylist(Playlist playlist) throws SQLException {
        String sql = "UPDATE Playlist SET UserAccount_ID = ?, Playlist_Name = ?, Description = ?, " +
                "Created_Date = ?, Playlist_Hashtags = ? WHERE Playlist_ID = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setLong(1, playlist.getUserAccountId());
            pstmt.setString(2, playlist.getPlaylistName());
            pstmt.setString(3, playlist.getDescription());
            pstmt.setDate(4, new java.sql.Date(playlist.getCreatedDate().getTime()));
            pstmt.setString(5, getPlaylistHashtagsAsString(playlist)); // Convert hashtags to a comma-separated string
            pstmt.setLong(6, playlist.getPlaylistId());

            pstmt.executeUpdate();
        }
    }

    // Method to delete a Playlist from the database
    public void deletePlaylist(long playlistId) throws SQLException {
        String sql = "DELETE FROM Playlist WHERE Playlist_ID = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setLong(1, playlistId);
            pstmt.executeUpdate();
        }
    }

    // Method to add a song to a playlist by inserting a record into the SongPlaylist table
    public void addSongToPlaylist(long playlistId, long songId) throws SQLException {
        String sql = "INSERT INTO SongPlaylist (Playlist_ID, Song_ID) VALUES (?, ?)";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setLong(1, playlistId);
            pstmt.setLong(2, songId);

            pstmt.executeUpdate();
        }
    }

    // Method to retrieve all Playlists from the database
    public List<Playlist> getAllPlaylists() throws SQLException {
        List<Playlist> playlists = new ArrayList<>();
        String sql = "SELECT * FROM Playlist";

        try (Connection conn = DatabaseConfig.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                playlists.add(createPlaylistFromResultSet(rs));
            }
        }
        return playlists;
    }

    // Helper method to create a Playlist object from a ResultSet row
    private Playlist createPlaylistFromResultSet(ResultSet resultSet) throws SQLException {
        Playlist playlist = new Playlist();
        playlist.setPlaylistId(resultSet.getLong("Playlist_ID"));
        playlist.setUserAccountId(resultSet.getLong("UserAccount_ID"));
        playlist.setPlaylistName(resultSet.getString("Playlist_Name"));
        playlist.setDescription(resultSet.getString("Description"));
        playlist.setCreatedDate(resultSet.getDate("Created_Date"));

        // Fetch the list of hashtags for the playlist using PlaylistDAO.getHashtagsForPlaylist()
        long playlistId = resultSet.getLong("Playlist_ID");
        List<Hashtag> hashtags = getHashtagsForPlaylist(playlistId);
        playlist.setPlaylistHashtags(hashtags);

        return playlist;
    }

    // Method to retrieve all hashtags associated with a specific Playlist
    public List<Hashtag> getHashtagsForPlaylist(long playlistId) throws SQLException {
        List<Hashtag> hashtags = new ArrayList<>();
        String sql = "SELECT h.Hashtag_ID, h.Hashtag_Value " +
                "FROM Hashtag h " +
                "JOIN Playlist p ON p.Playlist_Hashtags LIKE CONCAT('%', h.Hashtag_Value, '%') " +
                "WHERE p.Playlist_ID = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setLong(1, playlistId);
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
    public String getPlaylistHashtagsAsString(Playlist playlist) {
        StringBuilder sb = new StringBuilder();
        List<Hashtag> hashtags = playlist.getPlaylistHashtags();
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
