package com.melody.dao;

import com.melody.model.SongSimple;
import com.melody.util.DatabaseConfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SongSimpleDAOImpl implements SongSimpleDAO {

    @Override
    public void saveSong(SongSimple songSimple) {
        try (Connection connection = DatabaseConfig.getConnection()) {
            String insertQuery = "INSERT INTO SONGSIMPLE (id, title, artist, album, url) VALUES (?,?,?,?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
            preparedStatement.setLong(1, songSimple.getId());
            preparedStatement.setString(2, songSimple.getTitle());
            preparedStatement.setString(3, songSimple.getArtist());
            preparedStatement.setString(4, songSimple.getAlbum());
            preparedStatement.setString(5, songSimple.getUrl());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateSong(SongSimple songSimple) {
        try (Connection connection = DatabaseConfig.getConnection()) {
            String updateQuery = "UPDATE SONGSIMPLE SET title=?, artist=?, album=?, url=? WHERE id=?";
            PreparedStatement preparedStatement = connection.prepareStatement(updateQuery);
            preparedStatement.setString(1, songSimple.getTitle());
            preparedStatement.setString(2, songSimple.getArtist());
            preparedStatement.setString(3, songSimple.getAlbum());
            preparedStatement.setString(4, songSimple.getUrl());
            preparedStatement.setLong(5, songSimple.getId());


            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteSong(long songId) {
        try (Connection connection = DatabaseConfig.getConnection()) {
            String deleteQuery = "DELETE FROM SONGSIMPLE WHERE id=?";
            PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery);
            preparedStatement.setLong(1, songId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public SongSimple getSongById(long songId) {
        try (Connection connection = DatabaseConfig.getConnection()) {
            String selectQuery = "SELECT * FROM SONGSIMPLE WHERE id=?";
            PreparedStatement preparedStatement = connection.prepareStatement(selectQuery);
            preparedStatement.setLong(1, songId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String title = resultSet.getString("title");
                String artist = resultSet.getString("artist");
                String album = resultSet.getString("album");
                String url = resultSet.getString("url");
                return new SongSimple(songId, title, artist, album, url);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<SongSimple> getAllSongs() {
        List<SongSimple> songSimples = new ArrayList<>();
        try (Connection connection = DatabaseConfig.getConnection()) {
            String selectAllQuery = "SELECT * FROM SONGSIMPLE";
            PreparedStatement preparedStatement = connection.prepareStatement(selectAllQuery);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                long id = resultSet.getLong("id");
                String title = resultSet.getString("title");
                String artist = resultSet.getString("artist");
                String album = resultSet.getString("album");
                String url = resultSet.getString("url");
                songSimples.add(new SongSimple(id, title, artist, album, url));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return songSimples;
    }
}
