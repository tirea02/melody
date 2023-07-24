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

    public static String downloadAudio(String link, ServletContext servletContext) {
        String downloadedFilePath = null;
        try {
            String contextPath = servletContext.getRealPath("/");

            // Define the output directory for downloaded MP3 files
            String outputDirectory = contextPath + "resources/mp3";

            // Create the output directory if it does not exist
            Path outputPath = Paths.get(outputDirectory);
            if (!Files.exists(outputPath)) {
                Files.createDirectories(outputPath);
            }

            // Define the output filename format

            String outputFilenameFormat = outputDirectory + "/%(title)s_%(id)s.mp3";

            logger.debug("Output Filename Format: {}", outputFilenameFormat);

            ProcessBuilder processBuilder = new ProcessBuilder(
                    "yt-dlp",
                    "--extract-audio",
                    "--audio-format", "mp3",
                    "--audio-quality", "0",
                    "--output", outputFilenameFormat,
                    link
            );

            Process process = processBuilder.start();
            process.waitFor();
            System.out.println("Successfully Downloaded - see local folder");

            // Set the downloaded file path to return
            downloadedFilePath = String.format(outputFilenameFormat, "TITLE", "ID");
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
        return downloadedFilePath;
    }

}
