package com.melody.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.melody.dao.SongPlaylistDAO;

/**
 * Servlet implementation class DeleteToPlaylistServlet
 */
@WebServlet("/DeleteToPlaylist")
public class DeleteToPlaylistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = LoggerFactory.getLogger(AddToPlaylistServlet.class);

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long playlistId = Long.parseLong(request.getParameter("playlistId"));
		logger.debug(String.valueOf(playlistId));
		long songId = Long.parseLong(request.getParameter("songId"));
		logger.debug(String.valueOf(songId));
		
		SongPlaylistDAO songplaylistDAO = new SongPlaylistDAO();
		
		songplaylistDAO.deleteSongFromPlaylist(playlistId, songId);
		
		
		
		request.getRequestDispatcher("/pages/customPlaylist.jsp").forward(request, response);
		
	}
	
	
}
