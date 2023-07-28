package com.melody.controller;

import com.melody.service.YoutubeDownloader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static java.lang.System.out;
import java.io.FileInputStream;

@WebServlet("/play")
public class PlayMusicServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = LoggerFactory.getLogger(PlayMusicServlet.class);

    public void init() throws ServletException {
        String log4jConfigFile = getServletContext().getInitParameter("log4jConfiguration");
        String fullPath = getServletContext().getRealPath("") + log4jConfigFile;
        System.setProperty("log4j.configurationFile", fullPath);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the downloaded file path from the request parameter
        HttpSession session = request.getSession();
        String filePath = (String) session.getAttribute("downloadedFilePath");
        filePath += ".mp3";
        out.println(filePath);
        logger.debug("passed  File Path: {}", filePath);


        if (filePath == null || filePath.isEmpty()) {
            response.getWriter().println("Please provide a valid file path.");
            return;
        }

        try {
            // Set the content type for audio
            response.setContentType("audio/mpeg");

            // Read the audio file and write it to the response output stream
            InputStream inputStream = new FileInputStream(filePath);
            OutputStream outputStream = response.getOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }

            // Close the streams
            inputStream.close();
            outputStream.flush();
            outputStream.close();

        } catch (Exception ex) {
            // Handle any exceptions that occur during the playback process
            response.getWriter().println("Error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }



}
