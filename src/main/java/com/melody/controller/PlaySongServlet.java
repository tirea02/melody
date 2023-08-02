package com.melody.controller;

import com.melody.dao.SongDAO;
import com.melody.model.Song;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/playSong")
public class PlaySongServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get the songId from the request parameter (assuming it's provided in the URL)
            long songId = Long.parseLong(request.getParameter("songId"));

            // Fetch the Song using the SongDAO
            SongDAO songDAO = new SongDAO();
            Song song = songDAO.getSongById(songId);

            // Set the Song object as an attribute in the request
            request.setAttribute("song", song);

            // Forward to the playSong.jsp for rendering
            request.getRequestDispatcher("pages/playSong.jsp").forward(request, response);
        } catch (NumberFormatException | SQLException e) {
            e.printStackTrace();
            // Handle any errors or exceptions here
        }
    }
}
