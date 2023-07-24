package com.melody.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.melody.model.Song;
import com.melody.dao.SongDAO;
import com.melody.dao.SongDAOImpl;

import javax.servlet.annotation.WebServlet;

@WebServlet("/songs")
public class SongServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            // Retrieve all songs from the database using the DAO
            SongDAO songDAO = new SongDAOImpl();
            List<Song> songs = songDAO.getAllSongs();

            // Forward the request to the songList.jsp page with pagination information
            request.setAttribute("songs", songs);
            request.getRequestDispatcher("/pages/songList.jsp").forward(request, response);
        } catch (Exception ex) {
            // Handle any exceptions that occur during database operations
            response.getWriter().println("Error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }
}
