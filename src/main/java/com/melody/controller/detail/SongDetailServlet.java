package com.melody.controller.detail;

import com.melody.dao.AlbumDAO;
import com.melody.dao.SongDAO;
import com.melody.model.Album;
import com.melody.model.Song;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/songDetail")
public class SongDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = LoggerFactory.getLogger(SongDetailServlet.class);

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String songID = request.getParameter("songID");
        SongDAO songDAO = new SongDAO();
        AlbumDAO albumDAO = new AlbumDAO();
        Song song = null;

        try {
          song = songDAO.getSongById(Long.parseLong(songID));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        Album album = albumDAO.getAlbumDetails(song.getAlbumId());

        logger.debug("song from SongDetailServlet: {}", song.toString());
        logger.debug("album from SongDetailServlet: {}", album.toString());

        // Set the song object in the request attribute
        request.setAttribute("song", song);
        request.setAttribute("album", album);

        // Forward the request to the JSP for rendering
        request.getRequestDispatcher("/pages/song-detail.jsp").forward(request, response);
    }
}
