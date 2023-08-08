package com.melody.controller;


import com.melody.dao.PlaylistDAO;
import com.melody.dao.SongPlaylistDAO;
import com.melody.model.CustomPlaylist;
import com.melody.model.UserAccount;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
@WebServlet("/addToPlaylist")
public class AddToPlaylistServlet extends HttpServlet {
    private static final Logger logger = LoggerFactory.getLogger(AddToPlaylistServlet.class);
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get the songId and playlistId from the request parameters
            long songId = Long.parseLong(request.getParameter("songId"));
            long playlistId = Long.parseLong(request.getParameter("playlistId"));
            logger.debug("songId, playlistId : {} , {}", songId, playlistId);

            // Get the userAccountId from the session
            UserAccount userAccount = (UserAccount) request.getSession().getAttribute("userAccount");
            long userAccountId = userAccount.getUserAccountId();

            // Update the songplaylist table with the new entry
            SongPlaylistDAO songPlaylistDAO = new SongPlaylistDAO();
            songPlaylistDAO.addSongToPlaylist(playlistId, songId);

            // Retrieve updated custom playlists from the database
            PlaylistDAO playlistDAO = new PlaylistDAO();
            List<CustomPlaylist> updatedCustomPlaylists = playlistDAO.getAllPlaylistsForUser(userAccountId);
            logger.debug(updatedCustomPlaylists.toString());

            // Update the custom playlists in the session
            request.getSession().setAttribute("customPlaylists", updatedCustomPlaylists);

            // Send back a response if needed

        } catch (NumberFormatException e) {
            e.printStackTrace();
            // Handle error
        }
    }
}
