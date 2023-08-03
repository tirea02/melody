package com.melody.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.melody.dao.PlaylistDAO;
import com.melody.model.Playlist;

/**
 * Servlet implementation class CustomPlaylistDeleteServelt
 */
@WebServlet("/CustomPlaylistDeleteServelt")
public class CustomPlaylistDeleteServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomPlaylistDeleteServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		PlaylistDAO playlistDAO = new PlaylistDAO();
//		
//		Playlist playlist = new Playlist();
//		long playlist_id = playlist.getPlaylistId();
//		
//		try {
//			playlistDAO.deletePlaylist(playlist_id);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
		
		response.sendRedirect("pages/main-login.jsp");
	}

}
