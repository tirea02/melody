package com.melody.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.melody.model.CustomPlaylist;
import com.melody.model.UserAccount;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.melody.dao.PlaylistDAO;

/**
 * Servlet implementation class DeletePlaylistServlet
 */
@WebServlet("/DeletePlaylist")
public class DeletePlaylistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = LoggerFactory.getLogger(AddToPlaylistServlet.class);
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");

		UserAccount userAccount = (UserAccount) request.getSession().getAttribute("userAccount");
		long userAccountId = userAccount.getUserAccountId();


		long playlistId = Long.parseLong(request.getParameter("playlistId"));
		logger.debug(String.valueOf(playlistId));
		
		PlaylistDAO playlistDAO = new PlaylistDAO();
		try {
			playlistDAO.deletePlaylist(playlistId);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		assert userAccount != null;
		List<CustomPlaylist> customPlaylists = playlistDAO.getAllPlaylistsForUser(userAccount.getUserAccountId());
		logger.debug("customPlaylists : {}" , customPlaylists);

		Gson gson = new Gson();
		String jsonCustomPlaylists = gson.toJson(customPlaylists);

		request.getSession().setAttribute("customPlaylists", customPlaylists);
		request.getSession().setAttribute("jsonCustomPlaylists", jsonCustomPlaylists);

		response.sendRedirect(request.getContextPath() + "/pages/main-login.jsp");
		



	}


}
