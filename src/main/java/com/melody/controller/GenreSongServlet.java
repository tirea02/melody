package com.melody.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.melody.dao.AlbumDAO;
import com.melody.dao.SongDAO;
import com.melody.model.Album;
import com.melody.model.Song;
import org.checkerframework.checker.units.qual.A;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/genreSongServlet")
public class GenreSongServlet extends HttpServlet {

    private static final Logger logger = LoggerFactory.getLogger(SearchServlet.class);
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        String genreIdParam = request.getParameter("genreId");
        int genreId = Integer.parseInt(genreIdParam);
        int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
        int pageSize = 10; // Number of songs to display per page

        SongDAO songDAO = new SongDAO();

        List<Song> songs = songDAO.getSongsByGenre(genreId, pageNumber, pageSize);
        int totalSongs = songDAO.getTotalSongsByGenre(genreId);


        logger.debug("songs : {}", songs);

        // Use Gson to convert the song list to JSON
        JsonObject jsonObject = new JsonObject();
        jsonObject.add("songs", new Gson().toJsonTree(songs));
        jsonObject.addProperty("totalSongs", totalSongs);
        jsonObject.addProperty("songsPerPage", pageSize);


        // Set the content type of the response to JSON
        response.setContentType("application/json");
        // Write the JSON string to the response
        response.getWriter().write(jsonObject.toString());
    }
}
