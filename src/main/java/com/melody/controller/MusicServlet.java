package com.melody.controller;

import java.io.*;
import java.util.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.gson.Gson;

@WebServlet("/api/playlist")
public class MusicServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mp3Directory = "C:/melody/mp3"; // Replace this with your directory path

        File directory = new File(mp3Directory);
        File[] files = directory.listFiles(new FileFilter() {
            public boolean accept(File pathname) {
                return pathname.isFile() && pathname.getName().toLowerCase().endsWith(".mp3");
            }
        });

        List<String> mp3Files = new ArrayList<>();
        for (File file : files) {
            mp3Files.add(file.getName());
        }

        // Set the content type to JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Convert the list to JSON and send it as the response
        String json = new Gson().toJson(mp3Files);
        response.getWriter().write(json);
    }
}
