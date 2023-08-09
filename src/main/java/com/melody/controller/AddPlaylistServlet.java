package com.melody.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.melody.model.CustomPlaylist;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.melody.dao.PlaylistDAO;
import com.melody.model.Playlist;
import com.melody.model.UserAccount;

/**
 * Servlet implementation class AddPlaylistServlet
 */
@WebServlet("/AddPlaylist")
public class AddPlaylistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = LoggerFactory.getLogger(AddToPlaylistServlet.class);

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			UserAccount userAccount = (UserAccount) request.getSession().getAttribute("userAccount");
			long userAccountId = userAccount.getUserAccountId();
			response.setCharacterEncoding("UTF-8");
			
			String playlistName = request.getParameter("playlistname");
			String playlistDescription = request.getParameter("playlistdescription");
			Date date = new java.util.Date();
			String playlistHashtags = request.getParameter("playlisthashtags");
			
//			logger.debug(String.valueOf(useraccountId));
//			logger.debug(playlistName);
//			logger.debug(playlistDescription);
//			logger.debug(String.valueOf(date));
//			logger.debug(playlistHasgtags);
			
			Playlist playlist = new Playlist();
			playlist.setPlaylistName(playlistName);
			playlist.setUserAccountId(userAccountId);
			playlist.setDescription(playlistDescription);
			playlist.setCreatedDate(date);
			
			
			PlaylistDAO playlistDAO = new PlaylistDAO();
			playlistDAO.addPlaylistWithStringHashtag(playlist,  playlistHashtags);

			assert userAccount != null;
			List<CustomPlaylist> customPlaylists = playlistDAO.getAllPlaylistsForUser(userAccount.getUserAccountId());
			logger.debug("customPlaylists : {}" , customPlaylists);

			Gson gson = new Gson();
			String jsonCustomPlaylists = gson.toJson(customPlaylists);

			request.getSession().setAttribute("customPlaylists", customPlaylists);
			request.getSession().setAttribute("jsonCustomPlaylists", jsonCustomPlaylists);

			response.sendRedirect(request.getContextPath() + "/pages/main-login.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
