package com.melody.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		long playlistId = Long.parseLong(request.getParameter("playlistId"));
		logger.debug(String.valueOf(playlistId));
		
		PlaylistDAO playlistDAO = new PlaylistDAO();
		try {
			playlistDAO.deletePlaylist(playlistId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	
	}


}
