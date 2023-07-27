package com.melody.service;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.concurrent.TimeUnit;

public class YouTubeScraper {

    private static final Logger logger = LoggerFactory.getLogger(YouTubeScraper.class);

    private final WebDriver driver;

    public YouTubeScraper() {
        System.setProperty("webdriver.chrome.driver", "C:/melody/chromedriver/chromedriver.exe"); // Set the path to chromedriver
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--headless");
        options.addArguments("--disable-gpu"); // Some versions of Chrome require this to run headless

        driver = new ChromeDriver(options);
        driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);

    }

    public String getFirstVideoLink(String query) {
        String youtubeSearchUrl = "https://www.youtube.com/results?search_query=" + query;

        driver.get(youtubeSearchUrl);
//        try {Thread.sleep(1000);} catch (InterruptedException e) {}


        WebElement firstVideoElement = driver.findElement(By.cssSelector("ytd-video-renderer ytd-thumbnail a.yt-simple-endpoint"));
        String videoLink = firstVideoElement.getAttribute("href");

        if (firstVideoElement != null) {
            logger.debug(firstVideoElement.getAttribute("href"));
            return  firstVideoElement.getAttribute("href");
        } else {
            return "No videos found.";
        }
    }

    public void close() {
        driver.quit();
    }
}
