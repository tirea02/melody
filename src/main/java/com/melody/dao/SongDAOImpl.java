package com.melody.dao;

import com.melody.model.Song;
import com.melody.util.DatabaseConfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SongDAOImpl implements SongDAO {

    @Override
    public void saveSong(Song song) {
        try (Connection connection = DatabaseConfig.getConnection()) {
            String insertQuery = "INSERT INTO Song (id, title, artist, album, url) VALUES (?,?,?,?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
            preparedStatement.setLong(1, song.getId());
            preparedStatement.setString(2, song.getTitle());
            preparedStatement.setString(3, song.getArtist());
            preparedStatement.setString(4, song.getAlbum());
            preparedStatement.setString(5, song.getUrl());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateSong(Song song) {
        try (Connection connection = DatabaseConfig.getConnection()) {
            String updateQuery = "UPDATE Song SET title=?, artist=?, album=?, url=? WHERE id=?";
            PreparedStatement preparedStatement = connection.prepareStatement(updateQuery);
            preparedStatement.setString(1, song.getTitle());
            preparedStatement.setString(2, song.getArtist());
            preparedStatement.setString(3, song.getAlbum());
            preparedStatement.setString(4, song.getUrl());
            preparedStatement.setLong(5, song.getId());


            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteSong(long songId) {
        try (Connection connection = DatabaseConfig.getConnection()) {
            String deleteQuery = "DELETE FROM Song WHERE id=?";
            PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery);
            preparedStatement.setLong(1, songId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Song getSongById(long songId) {
        try (Connection connection = DatabaseConfig.getConnection()) {
            String selectQuery = "SELECT * FROM Song WHERE id=?";
            PreparedStatement preparedStatement = connection.prepareStatement(selectQuery);
            preparedStatement.setLong(1, songId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String title = resultSet.getString("title");
                String artist = resultSet.getString("artist");
                String album = resultSet.getString("album");
                String url = resultSet.getString("url");
                return new Song(songId, title, artist, album, url);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Song> getAllSongs() {
        List<Song> songs = new ArrayList<>();
        try (Connection connection = DatabaseConfig.getConnection()) {
            String selectAllQuery = "SELECT * FROM Song";
            PreparedStatement preparedStatement = connection.prepareStatement(selectAllQuery);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                long id = resultSet.getLong("id");
                String title = resultSet.getString("title");
                String artist = resultSet.getString("artist");
                String album = resultSet.getString("album");
                String url = resultSet.getString("url");
                songs.add(new Song(id, title, artist, album, url));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return songs;
    }
}
