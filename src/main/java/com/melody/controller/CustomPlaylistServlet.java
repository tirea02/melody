package com.melody.controller;


import com.melody.dao.PlaylistDAO;
import com.melody.dao.SongPlaylistDAO;
import com.melody.model.CustomPlaylist;
import com.melody.model.Song;
import com.melody.service.PythonExecutorServlet;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/customPlaylist")
public class CustomPlaylistServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = LoggerFactory.getLogger(CustomPlaylistServlet.class);

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        long playlistId = Long.parseLong(request.getParameter("playlistId"));
        logger.debug(String.valueOf(playlistId));

        // Retrieve the custom playlist with songs from the database
        PlaylistDAO playlistDAO = new PlaylistDAO();
        CustomPlaylist customPlaylist = playlistDAO.getCustomPlaylistWithSongs(playlistId);

        logger.debug(String.valueOf(customPlaylist));

        if (customPlaylist != null) {
            // Set the custom playlist as an attribute in the request
            request.setAttribute("customPlaylist", customPlaylist);

            // Forward to the JSP page to display the custom playlist
            request.getRequestDispatcher("/pages/customPlaylist.jsp").forward(request, response);
        } else {
            // If the custom playlist is not found, redirect to an error page
//            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
}
