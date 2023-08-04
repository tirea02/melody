package com.melody.controller;

import com.melody.model.SongSimple;
import com.melody.service.MelonSongInfoExtractor;
import com.melody.service.YouTubeScraper;
import com.melody.service.YoutubeDownloader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/playSongSimple")
public class PlaySongSimpleServlet extends HttpServlet {
    private static final Logger logger = LoggerFactory.getLogger(PlaySongSimpleServlet.class);
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String query = request.getParameter("melonQuery");

            // Fetch the SongSimple information using the MelonSongInfoExtractor

            if (query != null && !query.isEmpty()) {
                YouTubeScraper scraper = new YouTubeScraper();
                MelonSongInfoExtractor melonSongInfoExtractor = new MelonSongInfoExtractor();
                SongSimple songSimple = melonSongInfoExtractor.extractSongInfo(query);

                query += " lyrics";
                String videoLink = scraper.getFirstVideoLink(query);

                scraper.close();

                String downloadedFilePath = YoutubeDownloader.downloadAudio(videoLink, songSimple.getTitle(), 0);
                logger.debug(downloadedFilePath);
                String relativePath = downloadedFilePath.substring("C:/melody".length()) +".mp3";
                logger.debug(relativePath);
                songSimple.setUrl(relativePath);


                request.setAttribute("songSimple", songSimple);
                request.getRequestDispatcher("pages/playSongSimple.jsp").forward(request, response);

            } else {
                response.getWriter().println("Please provide a search query.");
            }

            // Forward to the songsimplePlay.jsp for rendering
//            request.getRequestDispatcher("pages/songsimplePlay.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            // Handle any errors or exceptions here
        }
    }
}
