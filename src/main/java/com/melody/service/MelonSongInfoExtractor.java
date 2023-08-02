package com.melody.service;

import com.melody.model.SongSimple;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.concurrent.TimeUnit;

public class MelonSongInfoExtractor {

    private static final Logger logger = LoggerFactory.getLogger(MelonSongInfoExtractor.class);

    private final WebDriver driver;

    public MelonSongInfoExtractor() {
        System.setProperty("webdriver.chrome.driver", "C:/melody/chromedriver/chromedriver.exe"); // Set the path to chromedriver
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--headless");
        options.addArguments("--disable-gpu"); // Some versions of Chrome require this to run headless

        driver = new ChromeDriver(options);
        driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
    }

    public SongSimple extractSongInfo(String query) {
        SongSimple songSimple = new SongSimple();
        String melonSearchUrl = "https://www.melon.com/search/total/index.htm?q=" + query;

        driver.get(melonSearchUrl);
        // Wait for the page to load
        driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);

        // Get the first song element
        WebElement firstSongElement = driver.findElement(By.cssSelector("tbody > tr"));

        // Extract song information
        String title = firstSongElement.findElement(By.cssSelector("a.fc_gray")).getText();
        String artist = firstSongElement.findElement(By.cssSelector("div#artistName > a")).getText();
        WebElement albumElement = firstSongElement.findElement(By.cssSelector("td.t_left:nth-child(5) > div.wrap > div.ellipsis > a.fc_mgray"));
        String album = albumElement.getText();

        logger.debug(title);
        logger.debug(artist);
        logger.debug(album);

        songSimple.setTitle(title);
        songSimple.setArtist(artist);
        songSimple.setAlbum(album);
        driver.quit();

        return songSimple;

    }
}
