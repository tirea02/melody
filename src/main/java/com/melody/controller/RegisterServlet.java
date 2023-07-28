package com.melody.controller;

import com.melody.dao.UserAccountDAO;
import com.melody.model.UserAccount;
import com.melody.util.UserAccountUtils;

import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get form data from the request
        String name = request.getParameter("name");
        String birthDateString = request.getParameter("birthDate");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String password = request.getParameter("password");
        String hashtag = request.getParameter("hashtag");




        // Perform any additional validations if needed
        // ...

        // Convert the birth date string to a Date object
        Date birthDate = null;
        try {
            birthDate = new Date(java.sql.Date.valueOf(birthDateString).getTime());
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            // Handle the error appropriately
            // ...
            return;
        }

        // Create a new UserAccount object
        UserAccount userAccount = new UserAccount();
        userAccount.setName(name);
        userAccount.setBirthDate(birthDate);
        userAccount.setEmail(email);
        userAccount.setGender(gender);
        userAccount.setPassword(password);
        userAccount.setUserHashtags(hashtag);
        String ageGroup = UserAccountUtils.calculateAgeGroup(birthDate);
        userAccount.setAgeGroup(ageGroup);

        // Call the UserAccountDAO to add the new user to the database
        UserAccountDAO userAccountDAO = new UserAccountDAO();
        userAccountDAO.addUserAccount(userAccount);

        // Optionally, you can redirect the user to a success page
        // or show a success message on the same page

        response.getWriter().println("Registration Successful!");
    }
}
