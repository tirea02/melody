package com.melody.controller.user;

import com.melody.dao.UserAccountDAO;
import com.melody.model.UserAccount;
import com.melody.util.UserAccountUtils;

import java.io.IOException;
import java.util.Date;
import javax.servlet.RequestDispatcher;
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
        String accountId = request.getParameter("accountId");
        String birthDateString = request.getParameter("birthDate");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String password = request.getParameter("password");
        String hashtag = request.getParameter("hashtag");




        // Perform any additional validations if needed
        // ...

        // Convert the birthdate string to a Date object
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
        userAccount.setAccountId(accountId);
        userAccount.setBirthDate(birthDate);
        userAccount.setEmail(email);
        userAccount.setGender(gender);
        userAccount.setPassword(password);
        userAccount.setUserHashtags(hashtag);
        String ageGroup = UserAccountUtils.calculateAgeGroup(birthDate);
        userAccount.setAgeGroup(ageGroup);

        // Call the UserAccountDAO to add the new user to the database
        UserAccountDAO userAccountDAO = new UserAccountDAO();
        long newUserId = userAccountDAO.addUserAccount(userAccount);

        // Optionally, you can redirect the user to a success page
        // or show a success message on the same page
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().println("<div style='background-color: #d4edda; color: #155724; padding: 10px;'>Registration Successful!</div>");
        response.sendRedirect(request.getContextPath() + "/userDetail?userAccountId=" + newUserId);
    }
}
