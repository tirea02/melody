package com.melody.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			long useraccountId = userAccount.getUserAccountId();
			
			String playlistName = request.getParameter("playlistname");
			String playlistDescription = request.getParameter("playlistdescription");
			Date date = new java.util.Date();
			String playlistHasgtags = request.getParameter("playlisthashtags");
			
			logger.debug(String.valueOf(useraccountId));
			logger.debug(playlistName);
			logger.debug(playlistDescription);
			logger.debug(String.valueOf(date));
			logger.debug(playlistHasgtags);
			
			Playlist playlist = new Playlist( useraccountId , playlistName, playlistDescription, date, playlistHasgtags );
			playlist.setPlaylistName(playlistName);
			playlist.setUserAccountId(useraccountId);
			playlist.setDescription(playlistDescription);
			playlist.setCreatedDate(date);
			
			
			PlaylistDAO PlaylistDAO = new PlaylistDAO();
			PlaylistDAO.addPlaylist(playlist);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("/pages/main-login.jsp").forward(request, response);
	}

}
