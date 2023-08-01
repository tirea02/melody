package com.melody.dao;

import com.melody.model.UserAccount;
import com.melody.util.DatabaseConfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserAccountDAO {

    // Create a new UserAccount
    public long addUserAccount(UserAccount userAccount) {
        String sql = "INSERT INTO USERACCOUNT (useraccount_id, name, birth_date, age_group, account_id, password, email, gender, profile_image, user_hashtags) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        int uniqueId = getNextUserIdFromSequence();

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {


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

        return uniqueId;
    }

    // Retrieve a UserAccount by its userAccountId
    public UserAccount getUserAccount(int userAccountId) {
        String sql = "SELECT * FROM USERACCOUNT WHERE USERACCOUNT_ID = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, userAccountId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return createUserAccountFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public UserAccount getUserAccountByAccountId(String accountId) {
        String sql = "SELECT * FROM USERACCOUNT WHERE ACCOUNT_ID = ?";

        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, accountId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return createUserAccountFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    // Update an existing UserAccount
    public void updateUserAccount(UserAccount userAccount) {
        String sql = "UPDATE USERACCOUNT SET name = ?, birth_date = ?, age_group = ?, account_id = ?, password = ?, " +
                "email = ?, gender = ?, profile_image = ?, user_hashtags = ? WHERE useraccount_id = ?";

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
        String sql = "DELETE FROM USERACCOUNT WHERE useraccount_id = ?";

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
                userAccounts.add(createUserAccountFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userAccounts;
    }

    // Method to search for UserAccounts based on the provided criteria
    public List<UserAccount> searchUserAccounts(String searchCriteria) {
        List<UserAccount> userAccounts = new ArrayList<>();
        String searchQuery = "SELECT * FROM USERACCOUNT WHERE name LIKE ? OR account_id LIKE ? OR email LIKE ? OR user_hashtags LIKE ?";
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(searchQuery)) {
            String searchParam = "%" + searchCriteria + "%";
            pstmt.setString(1, searchParam);
            pstmt.setString(2, searchParam);
            pstmt.setString(3, searchParam);
            pstmt.setString(4, searchParam);

            try (ResultSet resultSet = pstmt.executeQuery()) {
                while (resultSet.next()) {
                    UserAccount userAccount = createUserAccountFromResultSet(resultSet);
                    userAccounts.add(userAccount);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userAccounts;
    }

    // Helper method to create a UserAccount object from a ResultSet row
    private UserAccount createUserAccountFromResultSet(ResultSet resultSet) throws SQLException {
        UserAccount userAccount = new UserAccount();
        userAccount.setUserAccountId(resultSet.getInt("useraccount_id"));
        userAccount.setName(resultSet.getString("name"));
        userAccount.setBirthDate(resultSet.getDate("birth_date"));
        userAccount.setAgeGroup(resultSet.getString("age_group"));
        userAccount.setAccountId(resultSet.getString("account_id"));
        userAccount.setPassword(resultSet.getString("password"));
        userAccount.setEmail(resultSet.getString("email"));
        userAccount.setGender(resultSet.getString("gender"));
        userAccount.setProfileImage(resultSet.getString("profile_image"));
        userAccount.setUserHashtags(resultSet.getString("user_hashtags"));
        return userAccount;
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
