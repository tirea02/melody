package com.melody.controller.user;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.melody.model.UserAccount;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/getUserAccount")
public class GetUserAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve user account data from the session
        UserAccount userAccount = (UserAccount) request.getSession().getAttribute("userAccount");

        // Convert userAccount to JSON
        Gson gson = new Gson();
        String jsonUserAccount = gson.toJson(userAccount);
        String contextPath = request.getContextPath();

        JsonObject jsonData = new JsonObject();

        // Add user account information to the JSON object

        jsonData.addProperty("name", userAccount.getName());
        jsonData.addProperty("contextPath", contextPath);

        // Set response content type
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Write JSON data to the response
        response.getWriter().write(jsonData.toString());
    }
}
