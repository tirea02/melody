package com.melody.service;

import javax.servlet.ServletContext;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class YoutubeDownloader {
    private static final Logger logger = LoggerFactory.getLogger(YoutubeDownloader.class);

    public static String downloadAudio(String link, String title, int songId) {
        String downloadedFilePath = null;
        try {
            // Define the output directory for downloaded MP3 files
            String outputDirectory = "C:/melody/mp3";

            // Create the output directory if it does not exist
            Path outputPath = Paths.get(outputDirectory);
            if (!Files.exists(outputPath)) {
                Files.createDirectories(outputPath);
            }

            // Define the output filename format
            String outputFilenameFormat = outputDirectory + "/" + title + "_" + songId;
            String ytDlpExecutablePath = "C:/melody/yt-dlp/yt-dlp";
            ProcessBuilder processBuilder = new ProcessBuilder(
                    ytDlpExecutablePath,
                    "-x",
                    "--audio-format", "mp3",
                    "--output", outputFilenameFormat,
                    link
            );

            Process process = processBuilder.start();
            process.waitFor();
            System.out.println("Successfully Downloaded - see local folder");

            // Set the downloaded file path to return
            downloadedFilePath = outputFilenameFormat;

            // Log the absolute path of the downloaded file

            logger.debug("Downloaded File Path: {}", downloadedFilePath);
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
        return downloadedFilePath;
    }

}
