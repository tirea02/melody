package com.melody.controller.detail;

import com.melody.dao.AlbumDAO;
import com.melody.dao.SongDAO;
import com.melody.model.Album;
import com.melody.model.Song;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/albumDetail")
public class AlbumDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = LoggerFactory.getLogger(AlbumDetailServlet.class);

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String albumID = request.getParameter("albumID");
        AlbumDAO albumDAO = new AlbumDAO();
        SongDAO songDAO = new SongDAO();
        Album album = albumDAO.getAlbumDetails(Long.valueOf(albumID));
        List<Song> songs = songDAO.getSongsByAlbumId(Long.valueOf(albumID));

        logger.debug("album from AlbumDetailServlet : {} ", album.toString());
        logger.debug("songs from AlbumDetailServlet : {} ", songs);

        // Set the album object in the request attribute
        request.setAttribute("album", album);
        request.setAttribute("songs", songs);

        // Forward the request to the JSP for rendering
        request.getRequestDispatcher("/pages/album-detail.jsp").forward(request, response);
    }
}
