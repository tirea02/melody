package com.melody.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.melody.model.Album;
import com.melody.model.Hashtag;
import com.melody.util.DatabaseConfig;

public class AlbumDAO {

    // SQL queries
    private static final String INSERT_ALBUM = "INSERT INTO Album (Album_ID, Album_Title, Cover_Photo, Release_Date, Album_Info, Rating, Reply_Count, Likes, Music_Video_Link, Album_Hashtags) VALUES (album_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_ALL_ALBUMS = "SELECT * FROM Album";
    private static final String SELECT_ALBUM_BY_ID = "SELECT * FROM Album WHERE Album_ID = ?";
    private static final String UPDATE_ALBUM = "UPDATE Album SET Album_Title = ?, Cover_Photo = ?, Release_Date = ?, Album_Info = ?, Rating = ?, Reply_Count = ?, Likes = ?, Music_Video_Link = ?, Album_Hashtags = ? WHERE Album_ID = ?";
    private static final String DELETE_ALBUM = "DELETE FROM Album WHERE Album_ID = ?";

    // Method to insert a new album into the database
    public void insertAlbum(Album album) throws SQLException {
        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT_ALBUM)) {
            statement.setString(1, album.getAlbumTitle());
            statement.setString(2, album.getCoverPhoto());
            statement.setDate(3, new java.sql.Date(album.getReleaseDate().getTime()));
            statement.setString(4, album.getAlbumInfo());
            statement.setDouble(5, album.getRating());
            statement.setInt(6, album.getReplyCount());
            statement.setInt(7, album.getLikes());
            statement.setString(8, album.getMusicVideoLink());
            statement.setString(9, getAlbumHashtagsAsString(album));

            statement.executeUpdate();
        }
    }

    // Method to fetch all albums from the database
    public List<Album> getAllAlbums() throws SQLException {
        List<Album> albums = new ArrayList<>();
        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_ALL_ALBUMS);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Album album = createAlbumFromResultSet(resultSet);
                albums.add(album);
            }
        }
        return albums;
    }

    // Method to fetch an album by ID from the database
    public Album getAlbumById(long albumId) throws SQLException {
        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_ALBUM_BY_ID)) {
            statement.setLong(1, albumId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return createAlbumFromResultSet(resultSet);
                }
            }
        }
        return null;
    }

    // Method to update an existing album in the database
    public void updateAlbum(Album album) throws SQLException {
        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_ALBUM)) {
            statement.setString(1, album.getAlbumTitle());
            statement.setString(2, album.getCoverPhoto());
            statement.setDate(3, new java.sql.Date(album.getReleaseDate().getTime()));
            statement.setString(4, album.getAlbumInfo());
            statement.setDouble(5, album.getRating());
            statement.setInt(6, album.getReplyCount());
            statement.setInt(7, album.getLikes());
            statement.setString(8, album.getMusicVideoLink());
            statement.setString(9, getAlbumHashtagsAsString(album));
            statement.setLong(10, album.getAlbumId());

            statement.executeUpdate();
        }
    }

    // Method to delete an album from the database
    public void deleteAlbum(long albumId) throws SQLException {
        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_ALBUM)) {
            statement.setLong(1, albumId);
            statement.executeUpdate();
        }
    }

    // Method to search for albums based on the provided criteria
    public List<Album> searchAlbums(String searchCriteria) throws SQLException {
        List<Album> albums = new ArrayList<>();
        String searchQuery = "SELECT * FROM Album WHERE Album_Title LIKE ? OR Album_Info LIKE ? OR Album_Hashtags LIKE ?";
        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(searchQuery)) {
            String searchParam = "%" + searchCriteria + "%";
            statement.setString(1, searchParam);
            statement.setString(2, searchParam);
            statement.setString(3, searchParam);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Album album = createAlbumFromResultSet(resultSet);
                    albums.add(album);
                }
            }
        }
        return albums;
    }

    // Helper method to create an Album object from a ResultSet row
    private Album createAlbumFromResultSet(ResultSet resultSet) throws SQLException {
        Album album = new Album();
        long albumId = resultSet.getLong("Album_ID");

        album.setAlbumId(albumId);
        album.setAlbumTitle(resultSet.getString("Album_Title"));
        album.setCoverPhoto(resultSet.getString("Cover_Photo"));
        album.setReleaseDate(resultSet.getDate("Release_Date"));
        album.setAlbumInfo(resultSet.getString("Album_Info"));
        album.setRating(resultSet.getDouble("Rating"));
        album.setReplyCount(resultSet.getInt("Reply_Count"));
        album.setLikes(resultSet.getInt("Likes"));
        album.setMusicVideoLink(resultSet.getString("Music_Video_Link"));

        // Fetch the list of hashtags for the song using SongDAO.getHashtagsForSong()
        List<Hashtag> hashtags = getHashtagsForAlbum(albumId);
        album.setAlbumHashtags(hashtags);

        return album;
    }


    // Method to retrieve all hashtags associated with a specific Album
    public List<Hashtag> getHashtagsForAlbum(long albumId) throws SQLException {
        List<Hashtag> hashtags = new ArrayList<>();
        String sql = "SELECT h.Hashtag_ID, h.Hashtag_Value " +
                "FROM Hashtag h " +
                "JOIN Album a ON a.Album_Hashtags LIKE CONCAT('%', h.Hashtag_Value, '%') " +
                "WHERE a.Album_ID = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setLong(1, albumId);
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
    public String getAlbumHashtagsAsString(Album album) {
        StringBuilder sb = new StringBuilder();
        List<Hashtag> hashtags = album.getAlbumHashtags();
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


    // Replace this with your actual method to get a database connection

}
