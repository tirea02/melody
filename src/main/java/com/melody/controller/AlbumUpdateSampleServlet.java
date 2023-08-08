package com.melody.controller

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

@WebServlet("/albumUpdateServlet")
public class AlbumUpdateSampleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
   

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	   	
        String albumID = request.getParameter("albumID");
        int like = Integer.parseInt(request.getParameter("like"));
        AlbumDAO albumDAO = new AlbumDAO();
     
        Album album = albumDAO.getAlbumById(Long.valueOf(albumID));
        int currentLike = album.getLikes();
        album.setLikes(currentLike+like);
        
        albumDAO.updateAlbum(album);
        

        // Set the album object in the request attribute
       

        // Forward the request to the JSP for rendering
        request.getRequestDispatcher("/pages/album-detail.jsp").forward(request, response);
    }
}
