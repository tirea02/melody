package com.melody.controller;


import com.melody.dao.AlbumDAO;
import com.melody.dao.SingerDAO;
import com.melody.dao.SongDAO;
import com.melody.model.Singer;
import com.melody.model.Song;
import com.melody.model.Album;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {

    private static final Logger logger = LoggerFactory.getLogger(SearchServlet.class);
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String query = request.getParameter("mainSearchQuery");

            // Use the SearchDAO to get search results
            SingerDAO singerDAO = new SingerDAO();
            SongDAO songDAO = new SongDAO();
            AlbumDAO albumDAO = new AlbumDAO();


            List<Singer> singers = singerDAO.searchSingers(query);
            List<Song> songs = songDAO.searchSongs(query);
            List<Album> albums = albumDAO.searchAlbums(query);
            // You can add more search results as needed for genres, etc.

            logger.debug(singers.toString());
            logger.debug(songs.toString());
            logger.debug(albums.toString());

            // Set the search results as attributes to be used in the JSP
            request.setAttribute("singers", singers);
            request.setAttribute("songs", songs);
            request.setAttribute("albums", albums);
            // You can add more attributes as needed for genres, etc.

            request.getRequestDispatcher("pages/searchResult.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            // Handle any errors or exceptions here
        }
    }
}
