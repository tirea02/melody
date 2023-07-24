package com.melody.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.melody.model.Song;
import com.melody.util.HibernateUtil;

@WebServlet(name = "SongServlet", value = "/song-servlet")
public class SongServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
             Session session = sessionFactory.openSession()) {

            Transaction transaction = session.beginTransaction();
            // Retrieve all songs from the database

            Query<Song> query = session.createQuery( "FROM Song" , Song.class);
            List<Song> songs = query.list();
            transaction.commit();

            // Display songs in the browser
            response.getWriter().println("<html><body>");
            response.getWriter().println("<h1>My Songs</h1>");
            response.getWriter().println("<ul>");
            for (Song song : songs) {
                response.getWriter().println("<li>" + song.getTitle() + " - " + song.getArtist() + "</li>");
            }
            response.getWriter().println("</ul>");
            response.getWriter().println("</body></html>");
        } catch (Exception ex) {
            // Handle any exceptions that occur during database operations
            response.getWriter().println("Error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }
}
