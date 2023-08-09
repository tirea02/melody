package com.melody.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;
import com.melody.dao.PlaylistDAO;
import com.melody.model.CustomPlaylist;
import com.melody.model.Playlist;
import com.melody.model.UserAccount;

/**
 * Servlet implementation class EditPlaylistServelt
 */
@WebServlet("/EditPlaylist")
public class EditPlaylistServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final Logger logger = LoggerFactory.getLogger(EditPlaylistServelt.class);
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserAccount userAccount = (UserAccount) request.getSession().getAttribute("userAccount");
		long playlistId = Long.parseLong(request.getParameter("playlistId"));
		long useraccountId = userAccount.getUserAccountId();
		String playlistName = request.getParameter("playlistname");
		String description = request.getParameter("playlistdescription");
		String playlistHashtag = request.getParameter("playlisthashtags");
		
		logger.debug(String.valueOf(playlistId));
		logger.debug(String.valueOf(useraccountId));
		logger.debug(playlistName);
		logger.debug(description);
		logger.debug(playlistHashtag);
		
		PlaylistDAO playlistDAO = new PlaylistDAO();
		try {
			response.setCharacterEncoding("UTF-8");
			Playlist playlist = new Playlist();
			
			playlist.setUserAccountId(useraccountId);
			playlist.setPlaylistName(playlistName);
			playlist.setDescription(description);
			playlist.setCreatedDate(new java.util.Date());
			playlist.setPlaylistId(playlistId);
			
			
			
			
			playlistDAO.updatePlaylistWithStringHashtags(playlist, playlistHashtag);
			
	        List<CustomPlaylist> customPlaylists = playlistDAO.getAllPlaylistsForUser(userAccount.getUserAccountId());
	        logger.debug("customPlaylists : {}" , customPlaylists);

	        Gson gson = new Gson();
	        String jsonCustomPlaylists = gson.toJson(customPlaylists);
	        
            request.getSession().setAttribute("customPlaylists", customPlaylists);
            request.getSession().setAttribute("jsonCustomPlaylists", jsonCustomPlaylists);
            
            response.sendRedirect(request.getContextPath() + "/pages/customPlaylist.jsp");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
