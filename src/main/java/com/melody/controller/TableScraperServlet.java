package com.melody.controller;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.concurrent.TimeUnit;

@WebServlet("/TableScraperServlet")
public class TableScraperServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Set the path to chromedriver (You can use a relative path or specify the location in an environment variable)
        System.setProperty("webdriver.chrome.driver", "C:/melody/chromedriver/chromedriver.exe"); // Set the path to chromedriver
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--headless");
        options.addArguments("--disable-gpu"); // Some versions of Chrome require this to run headless


        // Create a new ChromeDriver instance
        WebDriver driver = new ChromeDriver(options);
        driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);

        try {
            // Fetch the webpage using Selenium
            driver.get("https://www.melon.com/chart/index.htm"); // Replace with the actual URL

            // Find the table element using a valid CSS selector
            WebElement tableElement = driver.findElement(By.cssSelector("table"));

            // Find all the rows in the table
            List<WebElement> rows = tableElement.findElements(By.cssSelector("tr"));

            // Set the response content type to HTML
            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();

            // Start generating the table HTML
            out.println("<table border='1'>");

            // Process each row and extract data
            for (WebElement row : rows) {
                List<WebElement> cells = row.findElements(By.cssSelector("td"));

                // Start generating a row in the table
                out.println("<tr>");

                // Process each cell and extract data
                for (WebElement cell : cells) {
                    String cellText = cell.getText();

                    // Generate a cell in the table
                    out.println("<td>" + cellText + "</td>");
                }

                // End the current row
                out.println("</tr>");
            }

            // End the table
            out.println("</table>");
        } finally {
            // Close the ChromeDriver instance
            driver.quit();
        }
    }
}
