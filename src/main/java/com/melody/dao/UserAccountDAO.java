package com.melody.dao;

import com.melody.model.UserAccount;
import com.melody.util.DatabaseConfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserAccountDAO {

    // Create a new UserAccount
    public void addUserAccount(UserAccount userAccount) {
        String sql = "INSERT INTO USERACCOUNT (useraccount_id, name, birth_date, age_group, account_id, password, email, gender, profile_image, user_hashtags) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            int uniqueId = getNextUserIdFromSequence();

            pstmt.setInt(1, uniqueId); // Set the unique ID obtained from the sequence
            pstmt.setString(2, userAccount.getName());
            pstmt.setDate(3, new java.sql.Date(userAccount.getBirthDate().getTime()));
            pstmt.setString(4, userAccount.getAgeGroup());
            pstmt.setString(5, userAccount.getAccountId());
            pstmt.setString(6, userAccount.getPassword());
            pstmt.setString(7, userAccount.getEmail());
            pstmt.setString(8, userAccount.getGender());
            pstmt.setString(9, userAccount.getProfileImage());
            pstmt.setString(10, userAccount.getUserHashtags());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Retrieve a UserAccount by its userAccountId
    public UserAccount getUserAccount(int userAccountId) {
        String sql = "SELECT * FROM USERACCOUNT WHERE user_account_id = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, userAccountId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                UserAccount userAccount = new UserAccount();
                userAccount.setUserAccountId(rs.getInt("user_account_id"));
                userAccount.setName(rs.getString("name"));
                userAccount.setBirthDate(rs.getDate("birth_date"));
                userAccount.setAgeGroup(rs.getString("age_group"));
                userAccount.setAccountId(rs.getString("account_id"));
                userAccount.setPassword(rs.getString("password"));
                userAccount.setEmail(rs.getString("email"));
                userAccount.setGender(rs.getString("gender"));
                userAccount.setProfileImage(rs.getString("profile_image"));
                userAccount.setUserHashtags(rs.getString("user_hashtags"));

                return userAccount;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    // Update an existing UserAccount
    public void updateUserAccount(UserAccount userAccount) {
        String sql = "UPDATE USERACCOUNT SET name = ?, birth_date = ?, age_group = ?, account_id = ?, password = ?, " +
                "email = ?, gender = ?, profile_image = ?, user_hashtags = ? WHERE user_account_id = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, userAccount.getName());
            pstmt.setDate(2, new java.sql.Date(userAccount.getBirthDate().getTime()));
            pstmt.setString(3, userAccount.getAgeGroup());
            pstmt.setString(4, userAccount.getAccountId());
            pstmt.setString(5, userAccount.getPassword());
            pstmt.setString(6, userAccount.getEmail());
            pstmt.setString(7, userAccount.getGender());
            pstmt.setString(8, userAccount.getProfileImage());
            pstmt.setString(9, userAccount.getUserHashtags());
            pstmt.setInt(10, userAccount.getUserAccountId());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Delete a UserAccount by its userAccountId
    public void deleteUserAccount(int userAccountId) {
        String sql = "DELETE FROM USERACCOUNT WHERE user_account_id = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, userAccountId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Retrieve all UserAccounts
    public List<UserAccount> getAllUserAccounts() {
        List<UserAccount> userAccounts = new ArrayList<>();
        String sql = "SELECT * FROM USERACCOUNT";

        try (Connection conn = DatabaseConfig.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                UserAccount userAccount = new UserAccount();
                userAccount.setUserAccountId(rs.getInt("user_account_id"));
                userAccount.setName(rs.getString("name"));
                userAccount.setBirthDate(rs.getDate("birth_date"));
                userAccount.setAgeGroup(rs.getString("age_group"));
                userAccount.setAccountId(rs.getString("account_id"));
                userAccount.setPassword(rs.getString("password"));
                userAccount.setEmail(rs.getString("email"));
                userAccount.setGender(rs.getString("gender"));
                userAccount.setProfileImage(rs.getString("profile_image"));
                userAccount.setUserHashtags(rs.getString("user_hashtags"));

                userAccounts.add(userAccount);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userAccounts;
    }

    private int getNextUserIdFromSequence() {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // Get the database connection using DatabaseConfig.getConnection()
            connection = DatabaseConfig.getConnection();

            // SQL query to get the next value from the sequence
            String sqlQuery = "SELECT user_account_seq.NEXTVAL FROM DUAL";

            // Create a prepared statement
            preparedStatement = connection.prepareStatement(sqlQuery);

            // Execute the query
            resultSet = preparedStatement.executeQuery();

            // Retrieve the next sequence value from the result set
            int nextUserId = 0;
            if (resultSet.next()) {
                nextUserId = resultSet.getInt(1);
            }

            return nextUserId;
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle any exceptions appropriately, such as logging or throwing custom exceptions.
            // For simplicity, we'll print the stack trace here.
            return -1; // Return -1 to indicate an error in fetching the sequence value.
        } finally {
            // Close the database resources to free up connections
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
                // Handle the exception if there's any issue in closing the resources.
                // For simplicity, we'll print the stack trace here.
            }
        }
    }
}
