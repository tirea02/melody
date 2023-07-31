package com.melody.dao;

import com.melody.model.Singer;
import com.melody.util.DatabaseConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SingerDAO {

    // SQL queries
    private static final String INSERT_SINGER = "INSERT INTO Singer (Singer_ID, Singer_Name, Singer_Photo, Singer_Info, Singer_Hashtags) VALUES (singer_seq.NEXTVAL, ?, ?, ?, ?)";
    private static final String SELECT_ALL_SINGERS = "SELECT * FROM Singer";
    private static final String SELECT_SINGER_BY_ID = "SELECT * FROM Singer WHERE Singer_ID = ?";
    private static final String UPDATE_SINGER = "UPDATE Singer SET Singer_Name = ?, Singer_Photo = ?, Singer_Info = ?, Singer_Hashtags = ? WHERE Singer_ID = ?";
    private static final String DELETE_SINGER = "DELETE FROM Singer WHERE Singer_ID = ?";

    // Method to insert a new singer into the database
    public void insertSinger(Singer singer) throws SQLException {
        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT_SINGER)) {
            statement.setString(1, singer.getSingerName());
            statement.setString(2, singer.getSingerPhoto());
            statement.setString(3, singer.getSingerInfo());
            statement.setString(4, singer.getSingerHashtags());

            statement.executeUpdate();
        }
    }

    // Method to fetch all singers from the database
    public List<Singer> getAllSingers() throws SQLException {
        List<Singer> singers = new ArrayList<>();
        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_ALL_SINGERS);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Singer singer = createSingerFromResultSet(resultSet);
                singers.add(singer);
            }
        }
        return singers;
    }

    // Method to fetch a singer by ID from the database
    public Singer getSingerById(long singerId) throws SQLException {
        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_SINGER_BY_ID)) {
            statement.setLong(1, singerId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return createSingerFromResultSet(resultSet);
                }
            }
        }
        return null;
    }

    // Method to update an existing singer in the database
    public void updateSinger(Singer singer) throws SQLException {
        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_SINGER)) {
            statement.setString(1, singer.getSingerName());
            statement.setString(2, singer.getSingerPhoto());
            statement.setString(3, singer.getSingerInfo());
            statement.setString(4, singer.getSingerHashtags());
            statement.setLong(5, singer.getSingerId());

            statement.executeUpdate();
        }
    }

    // Method to delete a singer from the database
    public void deleteSinger(long singerId) throws SQLException {
        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_SINGER)) {
            statement.setLong(1, singerId);
            statement.executeUpdate();
        }
    }

    // Method to search for singers based on the provided criteria
    public List<Singer> searchSingers(String searchCriteria) throws SQLException {
        List<Singer> singers = new ArrayList<>();
        String searchQuery = "SELECT * FROM Singer WHERE Singer_Name LIKE ? OR  Singer_Hashtags LIKE ?";
        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(searchQuery)) {
            String searchParam = "%" + searchCriteria + "%";
            statement.setString(1, searchParam);
            statement.setString(2, searchParam);


            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Singer singer = createSingerFromResultSet(resultSet);
                    singers.add(singer);
                }
            }
        }
        return singers;
    }

    // Helper method to create a Singer object from a ResultSet row
    private Singer createSingerFromResultSet(ResultSet resultSet) throws SQLException {
        Singer singer = new Singer();
        singer.setSingerId(resultSet.getLong("Singer_ID"));
        singer.setSingerName(resultSet.getString("Singer_Name"));
        singer.setSingerPhoto(resultSet.getString("Singer_Photo"));
        singer.setSingerInfo(resultSet.getString("Singer_Info"));
        singer.setSingerHashtags(resultSet.getString("Singer_Hashtags"));
        return singer;
    }
}
