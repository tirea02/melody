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
 * Servlet implementation class AddPlaylistServlet
 */
@WebServlet("/AddPlaylistServlet")
public class AddPlaylistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPlaylistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			UserAccount userAccount = (UserAccount) request.getSession().getAttribute("userAccount");
			long useraccountId = userAccount.getUserAccountId();
			
			String playlistName = request.getParameter("playlistname");
			String playlistDescription = request.getParameter("playlistdescription");
			String playlistHasgtags = request.getParameter("playlisthashtags");
			
					
			Playlist playlist = new Playlist();
			playlist.setPlaylistName(playlistName);
			playlist.setUserAccountId(useraccountId);
			playlist.setDescription(playlistDescription);
			playlist.setPlaylistHashtags(playlistHasgtags);
			
			
			PlaylistDAO PlaylistDAO = new PlaylistDAO();
			PlaylistDAO.addPlaylist(playlist);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
