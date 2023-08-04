package com.melody.controller;

import com.google.gson.Gson;
import com.melody.dao.SingerDAO;
import com.melody.model.Singer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/artistServlet")
public class ArtistServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        // Fetch the list of artists from the data source (e.g., database)
        SingerDAO singerDAO =  new SingerDAO();
        List<Singer> artists = null;
        try {
            artists = singerDAO.getAllSingers();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        // Convert the list of artists to a JSON format
        Gson gson = new Gson();
        String jsonArtists = gson.toJson(artists);

        // Set the content type of the response to "application/json"
        response.setContentType("application/json");

        // Write the JSON string to the response
        response.getWriter().write(jsonArtists);
    }
}
