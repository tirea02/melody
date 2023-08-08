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
 * Servlet implementation class CustomPlaylistaddSong
 */
@WebServlet("/CustomPlaylistaddSong")
public class CustomPlaylistaddSongServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = LoggerFactory.getLogger(CustomPlaylistServlet.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomPlaylistaddSongServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		long playlistId = Long.parseLong(request.getParameter("playlistId"));
		logger.debug(String.valueOf(playlistId));
		long songId = Long.parseLong(request.getParameter("songId"));
		logger.debug(String.valueOf(songId));
				
		PlaylistDAO playlistDAO = new PlaylistDAO();
		try {
			playlistDAO.addSongToPlaylist(playlistId, songId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("pages/main-login.jsp");
	}
	
	

}
