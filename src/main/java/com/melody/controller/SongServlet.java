package com.melody.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.melody.model.SongSimple;
import com.melody.dao.SongSimpleDAO;
import com.melody.dao.SongSimpleDAOImpl;

import javax.servlet.annotation.WebServlet;

@WebServlet("/songs")
public class SongServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            // Retrieve all songs from the database using the DAO
            SongSimpleDAO songSimpleDAO = new SongSimpleDAOImpl();
            List<SongSimple> songSimples = songSimpleDAO.getAllSongs();

            // Forward the request to the songList.jsp page with pagination information
            request.setAttribute("songSimples", songSimples);
            request.getRequestDispatcher("/pages/songList.jsp").forward(request, response);
        } catch (Exception ex) {
            // Handle any exceptions that occur during database operations
            response.getWriter().println("Error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }
}
