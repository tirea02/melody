package com.melody.dao;

import com.melody.model.SongPlaylist;
import com.melody.util.DatabaseConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SongPlaylistDAO {

    // Method to add a new SongPlaylist record
    public void addSongToPlaylist(long playlistId, long songId) {
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                     "INSERT INTO SongPlaylist (Playlist_ID, Song_ID) VALUES (?, ?)")) {
            stmt.setLong(1, playlistId);
            stmt.setLong(2, songId);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Method to get SongPlaylist records by playlist ID
    public List<SongPlaylist> getSongsByPlaylistId(long playlistId) {
        List<SongPlaylist> songPlaylists = new ArrayList<>();
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                     "SELECT Playlist_ID, Song_ID FROM SongPlaylist WHERE Playlist_ID = ?")) {
            stmt.setLong(1, playlistId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                long playlistIdResult = rs.getLong("Playlist_ID");
                long songId = rs.getLong("Song_ID");
                SongPlaylist songPlaylist = new SongPlaylist(playlistIdResult, songId);
                songPlaylists.add(songPlaylist);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return songPlaylists;
    }

    // Method to get SongPlaylist records by song ID
    public List<SongPlaylist> getPlaylistsBySongId(long songId) {
        List<SongPlaylist> songPlaylists = new ArrayList<>();
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                     "SELECT Playlist_ID, Song_ID FROM SongPlaylist WHERE Song_ID = ?")) {
            stmt.setLong(1, songId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                long playlistId = rs.getLong("Playlist_ID");
                long songIdResult = rs.getLong("Song_ID");
                SongPlaylist songPlaylist = new SongPlaylist(playlistId, songIdResult);
                songPlaylists.add(songPlaylist);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return songPlaylists;
    }

    // Method to delete SongPlaylist records by playlist ID and song ID
    public void deleteSongFromPlaylist(long playlistId, long songId) {
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                     "DELETE FROM SongPlaylist WHERE Playlist_ID = ? AND Song_ID = ?")) {
            stmt.setLong(1, playlistId);
            stmt.setLong(2, songId);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Other utility methods or advanced search as needed
}
