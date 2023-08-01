package com.melody.controller.user;

import com.melody.model.UserAccount;
import com.melody.dao.UserAccountDAO;
import com.melody.service.PythonExecutorServlet;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;



@WebServlet("/userDetail")
public class UserDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = LoggerFactory.getLogger(UserDetailServlet.class);

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        // Get the userAccountId from the request parameter
        String userAccountIdParam = request.getParameter("userAccountId");
        int userAccountId = 0; // Set a default value

        if (userAccountIdParam != null && !userAccountIdParam.isEmpty()) {
            try {
                userAccountId = Integer.parseInt(userAccountIdParam);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                // Handle the parsing error appropriately
                // ...
            }
        }

        UserAccount userAccount = getUserAccount(request, userAccountId);
        logger.debug(String.valueOf(userAccount));

        if (userAccount != null) {
            // Set the UserAccount object as an attribute in the request
            request.setAttribute("userAccount", userAccount);

            // Forward the request to the JSP view for rendering
            RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/userDetail.jsp");
            dispatcher.forward(request, response);
        } else {

            response.getWriter().println("User Account not found.");
        }
    }

    public UserAccount getUserAccount(HttpServletRequest request, int userAccountId) {
        UserAccount userAccount = null;
        UserAccountDAO userAccountDAO = new UserAccountDAO();

        // Check if the userAccountId is provided
        if (userAccountId > 0) {
            userAccount = userAccountDAO.getUserAccount(userAccountId);
        }

        // If the userAccount is still null, try to get it from the session
        if (userAccount == null) {
            userAccount = (UserAccount) request.getSession().getAttribute("userAccount");
        }

        return userAccount;
    }



}
