package com.melody.dao;

import com.melody.model.Hashtag;
import com.melody.util.DatabaseConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HashtagDAO {
    // Method to get all hashtags from the Hashtag table
    public List<Hashtag> getAllHashtags() throws SQLException {
        List<Hashtag> hashtags = new ArrayList<>();
        String sql = "SELECT * FROM Hashtag";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Hashtag hashtag = new Hashtag();
                hashtag.setHashtagId(rs.getLong("Hashtag_ID"));
                hashtag.setHashtagValue(rs.getString("Hashtag_Value"));
                hashtags.add(hashtag);
            }
        }
        return hashtags;
    }
}
