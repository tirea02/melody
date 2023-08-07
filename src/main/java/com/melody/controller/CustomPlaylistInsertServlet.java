package com.melody.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class CustomPlaylistInsertServlet
 */
@WebServlet("/CustomPlaylistInsert")
public class CustomPlaylistInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = LoggerFactory.getLogger(CustomPlaylistServlet.class);
	
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		UserAccount useraccount = (UserAccount) request.getSession().getAttribute("userAccount");
		long useraccountId = Long.valueOf(useraccount.getUserAccountId());
		
		
		String playlistName = request.getParameter("playlistname");
		String playlistdescription = request.getParameter("playlistdescription");
		String playlisthasgtags = request.getParameter("playlisthashtags");
		Date date = new java.util.Date();
		
		
		logger.debug(String.valueOf(useraccountId));
		logger.debug(playlistName);
		logger.debug(playlistdescription);
		logger.debug(playlisthasgtags);
		logger.debug(String.valueOf(date));

		
		Playlist playlist = new Playlist( useraccountId, playlistName, playlistdescription, date , playlisthasgtags );
		playlist.setUserAccountId(useraccountId);
		playlist.setPlaylistName(playlistName);
		playlist.setDescription(playlistdescription);
		playlist.setCreatedDate(date);
		
		PlaylistDAO playlistDAO = new PlaylistDAO();
		try {
			playlistDAO.addPlaylist(playlist);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/main-login.jsp");
		
	}

}



//playlist.setUserAccountId(useraccountId);
//playlist.setPlaylistName(playlistName);
//playlist.setDescription(playlistdescription);
//playlist.setCreatedDate(playlist.getCreatedDate());
//playlist.setPlaylistHashtags(playlisthasgtags);
