package com.melody.service;

import com.melody.controller.PlayMusicServlet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/pythonExecutor")
public class PythonExecutorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = LoggerFactory.getLogger(PythonExecutorServlet.class);

    public void init() throws ServletException {
        String log4jConfigFile = getServletContext().getInitParameter("log4jConfiguration");
        String fullPath = getServletContext().getRealPath("") + log4jConfigFile;
        System.setProperty("log4j.configurationFile", fullPath);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String question = request.getParameter("question");
        String token = "ZQh13qusT4H_k4B40YJmBCcfWDKHvzNwaQjT-IlvEJXjlBPzS6NYIvaDNSnA0ZHyBUbN8Q."; // Your BARD API token

        String answer = executePythonScript(question, token);
        logger.debug("Answer : {}", answer);

        // Set the answer as an attribute in the request
        request.setAttribute("answer", answer);

        // Forward the request to the JSP page for rendering
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        request.getRequestDispatcher("/index.jsp").forward(request, response);
        

//        response.setContentType("text/plain");
//        response.setCharacterEncoding("UTF-8");
//        PrintWriter out = response.getWriter();
//
//        out.print(answer);
//        out.flush();
    }

    private String executePythonScript(String question, String token) throws IOException {
        logger.debug(question);
        logger.debug(token);
        String pythonExecutable = "C:/Program Files/Python311/python";
        ProcessBuilder processBuilder = new ProcessBuilder(pythonExecutable, "C:/melody/bard/bard_script.py", question, token);
        Process process = processBuilder.start();

        // Read the output from the Python script
        BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
        StringBuilder outputBuilder = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            outputBuilder.append(line).append("\n");
        }
        reader.close();
        String output = outputBuilder.toString();

        // Read the error output from the Python script
        BufferedReader errorReader = new BufferedReader(new InputStreamReader(process.getErrorStream()));
        StringBuilder errorOutputBuilder = new StringBuilder();
        while ((line = errorReader.readLine()) != null) {
            errorOutputBuilder.append(line).append("\n");
        }
        errorReader.close();
        String errorOutput = errorOutputBuilder.toString();

        // Log the error output if it is not empty
        if (!errorOutput.isEmpty()) {
            logger.error("Error from Python script:\n{}", errorOutput);
        }

        return output;
    }
}
