package com.melody.controller;

import com.melody.service.YouTubeScraper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/youtube-crawler")
public class YouTubeCrawlerServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query");

        if (query != null && !query.isEmpty()) {
            YouTubeScraper scraper = new YouTubeScraper();
            String videoLink = scraper.getFirstVideoLink(query);
            scraper.close();

            request.setAttribute("videoLink", videoLink);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {
            response.getWriter().println("Please provide a search query.");
        }
    }
}
