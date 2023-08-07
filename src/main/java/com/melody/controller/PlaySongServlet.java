package com.melody.controller;

import com.melody.dao.AlbumDAO;
import com.melody.dao.SongDAO;
import com.melody.model.Album;
import com.melody.model.Song;
import com.melody.service.YoutubeDownloader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/playSong")
public class PlaySongServlet extends HttpServlet {
    private static final Logger logger = LoggerFactory.getLogger(PlaySongServlet.class);
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get the songId from the request parameter (assuming it's provided in the URL)
            long songId = Long.parseLong(request.getParameter("songId"));

            // Fetch the Song using the SongDAO
            SongDAO songDAO = new SongDAO();
            AlbumDAO albumDAO = new AlbumDAO();
            Song song = songDAO.getSongById(songId);
            Album album = albumDAO.getAlbumDetails(song.getAlbumId());

            String downloadedFilePath = YoutubeDownloader.downloadAudio(song.getUrl(), song.getTitle(), 0);
            String relativePath = downloadedFilePath.substring("C:/melody".length()) +".mp3";
            song.setUrl(relativePath);

            logger.debug(downloadedFilePath);
            logger.debug(relativePath);

            // Set the Song object as an attribute in the request
            request.setAttribute("song", song);
            request.setAttribute("album", album);

            // Forward to the playSong.jsp for rendering
            request.getRequestDispatcher("pages/playSong.jsp").forward(request, response);
        } catch (NumberFormatException | SQLException e) {
            e.printStackTrace();
            // Handle any errors or exceptions here
        }
    }
}
