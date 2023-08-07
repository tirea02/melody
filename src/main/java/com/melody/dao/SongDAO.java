package com.melody.dao;

import com.melody.controller.SearchServlet;
import com.melody.model.Hashtag;
import com.melody.model.Song;
import com.melody.util.DatabaseConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SongDAO {
    private static final Logger logger = LoggerFactory.getLogger(SongDAO.class);

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

    public List<Song> getSongsByAlbumId(Long albumId) {
        List<Song> songs = new ArrayList<>();
        String query = "SELECT * FROM Song WHERE Album_ID = ?";

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setLong(1, albumId);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Song song = createSongFromResultSet(resultSet);
                    songs.add(song);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return songs;
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


    public List<Song> getSongsByGenre(int genreId, int pageNumber, int pageSize) {
        List<Song> songs = new ArrayList<>();
        String searchQuery = "SELECT s.*, a.Cover_Photo AS imageUrl " +
                "FROM Song s " +
                "JOIN Album a ON s.Album_ID = a.Album_ID " +
                "WHERE s.Genre_ID = ? " +
                "ORDER BY s.likes DESC " +
                "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(searchQuery)) {
            statement.setInt(1, genreId);
            int offset = (pageNumber - 1) * pageSize;
            statement.setInt(2, offset);
            statement.setInt(3, pageSize);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Song song = createSongFromResultSet(resultSet);
                    song.setImageUrl(resultSet.getString("imageUrl"));
                    songs.add(song);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return songs;
    }

    //페이징 위해서 전채 길이 필요
    public int getTotalSongsByGenre(int genreId) {
        String countQuery = "SELECT COUNT(*) FROM Song WHERE Genre_ID = ?";
        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(countQuery)) {
            statement.setInt(1, genreId);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Method to search for Songs based on the provided criteria
    public List<Song> searchSongs(String query) {
        List<Song> songs = new ArrayList<>();
        String searchQuery = "SELECT s.*, si.Singer_Name FROM Song s INNER JOIN Singer si ON s.Singer_ID = si.Singer_ID WHERE s.Title LIKE ? OR s.Song_Hashtags LIKE ? or si.SINGER_NAME like ?";
        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(searchQuery)) {
            String searchParam = "%" + query + "%";
            statement.setString(1, searchParam);
            statement.setString(2, searchParam);
            statement.setString(3, searchParam);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Song song = createSongFromResultSet(resultSet);
                    songs.add(song);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
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

        List<Hashtag> hashtags = getHashtagsForSongNoMatch(songId);
//        logger.debug(hashtags.toString());
        song.setSongHashtags(hashtags);
        song.setUrl(resultSet.getString("URL"));

        //feature added, new column
        song.setPlaylistCount(resultSet.getInt("playlist_count"));
        return song;
    }

    // Method to retrieve all hashtags associated with a specific Song
    // should have match hashtag table(미리 hashtable에 존재 해야하는데 실질적으로 힘들다)
    public List<Hashtag> getHashtagsForSong(long songId) throws SQLException {
        List<Hashtag> hashtags = new ArrayList<>();
        String sql = "SELECT h.Hashtag_ID, h.Hashtag_Value " +
                "FROM Hashtag h " +
                "JOIN Song s ON REGEXP_LIKE(s.Song_Hashtags, '(^|[,\\s])' || h.Hashtag_Value || '($|[,\\s])') " +
                "WHERE s.Song_ID = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setLong(1, songId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Hashtag hashtag = new Hashtag();
                    hashtag.setHashtagId(rs.getLong("Hashtag_ID"));
                    hashtag.setHashtagValue(rs.getString("Hashtag_Value"));
                    logger.debug(hashtag.toString());
                    hashtags.add(hashtag);
                }
            }
        }
        return hashtags;
    }

    public List<Hashtag> getHashtagsForSongNoMatch(long songId) throws SQLException {
        List<Hashtag> hashtags = new ArrayList<>();
        String sql = "SELECT Song_Hashtags " +
                "FROM Song " +
                "WHERE Song_ID = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setLong(1, songId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String songHashtags = rs.getString("Song_Hashtags");
                    if (songHashtags != null && !songHashtags.isEmpty()) {
                        String[] hashtagValues = songHashtags.split("[,\\s]+");
                        for (String hashtagValue : hashtagValues) {
                            Hashtag hashtag = new Hashtag();
                            hashtag.setHashtagId(0); // this won't saved to hashtag so ill just give 0 as id
                            hashtag.setHashtagValue(hashtagValue);
                            hashtags.add(hashtag);
                        }
                    }
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
