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
import com.melody.model.UserAccount;

/**
 * Servlet implementation class EditPlaylistServelt
 */
@WebServlet("/EditPlaylistServelt")
public class EditPlaylistServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserAccount useraccount = (UserAccount) request.getSession().getAttribute("userAccount");
		long playlistID = Long.parseLong(request.getParameter("playlistId"));
		long useraccountID = useraccount.getUserAccountId();
		String playlistName = request.getParameter("playlistName");
		String description = request.getParameter("description");
		String playlistHashtag = request.getParameter("playlistHasgtag");
		
		PlaylistDAO playlistDAO = new PlaylistDAO();
		try {
			Playlist playlist = new Playlist();
			
	        
			playlist.setUserAccountId(useraccountID);
			playlist.setPlaylistName(playlistName);
			playlist.setDescription(description);
			playlist.setCreatedDate(new java.util.Date());
//			playlist.setPlaylistHashtags(playlistHashtag);
			playlist.setPlaylistId(playlistID);
			
			playlistDAO.updatePlaylist(playlist);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/pages/CustomPlaylist.jsp").forward(request, response);
	}
}
