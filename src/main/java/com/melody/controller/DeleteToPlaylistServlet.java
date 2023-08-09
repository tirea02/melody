package com.melody.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import com.melody.dao.SongPlaylistDAO;

/**
 * Servlet implementation class DeleteToPlaylistServlet
 */
@WebServlet("/DeleteToPlaylist")
public class DeleteToPlaylistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = LoggerFactory.getLogger(DeleteToPlaylistServlet.class);

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long playlistId = Long.parseLong(request.getParameter("playlistId"));
		logger.debug(String.valueOf(playlistId));
		long songId = Long.parseLong(request.getParameter("songId"));
		logger.debug(String.valueOf(songId));
		
		SongPlaylistDAO songplaylistDAO = new SongPlaylistDAO();

		boolean success = songplaylistDAO.deleteSongFromPlaylist(playlistId, songId);

		// Set response type to JSON
		response.setContentType("application/json");

		// Create a JSON object for the response
		JsonObject jsonResponse = new JsonObject();
		jsonResponse.addProperty("success", success);

		// Set response type to JSON
		response.setContentType("application/json");

		// Serialize and write JSON response using Gson
		PrintWriter out = response.getWriter();
		out.print(new Gson().toJson(jsonResponse));
		out.flush();
		
	}
}
