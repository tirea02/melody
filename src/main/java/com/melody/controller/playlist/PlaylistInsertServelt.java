package com.melody.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.melody.dao.PlayListDAOImpl;
import com.melody.util.DatabaseConfig;

/**
 * Servlet implementation class PlayListServlet
 */
@WebServlet("/createPlayList")
public class PlayListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlayListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		response.setContentType("text/html; charset=UTF-8");
	    
	    try (Connection connection = DatabaseConfig.getConnection()){
	    	PlayListDAOImpl PlayListDAO = new PlayListDAOImpl();
	    	PlayListDAO.createPlayList();
	    } catch(SQLException e) {

	    }
	    
	    response.sendRedirect("pages/playList.jsp");
	    //양식에 맞춰서 다시분리
	    
	    

		
		
		
	}

}
