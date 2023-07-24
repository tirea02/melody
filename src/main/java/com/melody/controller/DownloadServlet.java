package com.melody.controller;

import java.io.IOException;
import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.melody.dao.SongDAO;
import com.melody.dao.SongDAOImpl;
import com.melody.service.YoutubeDownloader;

import javax.servlet.annotation.WebServlet;

@WebServlet("/download")
public class DownloadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            // Retrieve the id parameter from the request
            String idParam = request.getParameter("id");

            if (idParam == null || idParam.isEmpty()) {
                out.println("Please provide a valid ID.");
                return;
            }

            // Convert the id parameter to an integer
            int id = Integer.parseInt(idParam);

            // Retrieve the URL from the database based on the id
            SongDAO songDAO = new SongDAOImpl();
            String url = songDAO.getSongById(id).getUrl();

            if (url == null) {
                out.println("No URL found for the given ID.");
                return;
            }

            // Get the ServletContext object
            ServletContext servletContext = getServletContext();

            // Download the video using YoutubeDownloader
            YoutubeDownloader youtubeDownloader = new YoutubeDownloader();
            String downloadedFilePath = youtubeDownloader.downloadAudio(url, servletContext);

            // Store the downloaded file path in the session
            HttpSession session = request.getSession();
            session.setAttribute("downloadedFilePath", downloadedFilePath);

            // Redirect to the PlayMusicServlet to play the downloaded audio
            response.sendRedirect(request.getContextPath() + "/play");

        } catch (Exception ex) {
            // Handle any exceptions that occur during the download process
            out.println("Error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }
}
