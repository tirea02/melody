package com.melody.controller.user;

import com.melody.dao.UserAccountDAO;
import com.melody.model.UserAccount;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserAccount getUserAccount(String accountId, String password) {
        UserAccountDAO userAccountDAO = new UserAccountDAO();
        UserAccount userAccount = userAccountDAO.getUserAccountByAccountId(accountId);

        if (userAccount != null && userAccount.getPassword().equals(password)) {
            return userAccount;
        }

        return null;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get form data from the request
        String accountId = request.getParameter("accountId");
        String password = request.getParameter("password");

        // Validate the login credentials and get the UserAccount object
        UserAccount userAccount = getUserAccount(accountId, password);

        if (userAccount != null) {
            // If the user is valid, store the UserAccount object in the user's session
            request.getSession().setAttribute("userAccount", userAccount);
            response.sendRedirect(request.getContextPath() + "/userDetail");
        } else {
            // If the user is not valid, display an error message
            request.setAttribute("errorMessage", "Invalid login credentials");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
        }
    }
}
