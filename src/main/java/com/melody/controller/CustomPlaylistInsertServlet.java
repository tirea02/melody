package com.melody.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.melody.dao.PlaylistDAO;
import com.melody.model.Hashtag;
import com.melody.model.Playlist;
import com.melody.model.UserAccount;

/**
 * Servlet implementation class CustomPlaylistInsertServlet
 */
@WebServlet("/CustomPlaylistInsert")
public class CustomPlaylistInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomPlaylistInsertServlet() {
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
		doGet(request, response);
		response.setContentType("text/html; charset=UTF-8");
		
		UserAccount useraccount = new UserAccount();
		Long useraccountId = Long.valueOf(useraccount.getAccountId());
		
		String playlistName = request.getParameter("playlistname");
		String playlistdescription = request.getParameter("playlistdescription");
		String playlisthasgtags = request.getParameter("playlisthashtags");
		
		String[] hashtags = playlisthasgtags.split(" ");
		
		
		
		
		Playlist playlist = new Playlist();
		playlist.setUserAccountId(useraccountId);
		playlist.setPlaylistName(playlistName);
		playlist.setDescription(playlistdescription);
		playlist.setCreatedDate(playlist.getCreatedDate());
		playlist.setPlaylistHashtags(hasgtags);
		
		
		
		PlaylistDAO playlistDAO = new PlaylistDAO();
//		playlistDAO.addPlaylist(playlist);
		
		
	}

}
