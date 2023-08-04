// main.js
$(document).ready(function() {
    // Array of genre IDs to fetch data for
    var genreIds = [1, 2, 3, 4, 5];

    // Function to make the AJAX call to retrieve song data for each genre ID
    function fetchGenreSongs(genreId) {

        var ajaxUrl = contextPath+"/genreSongServlet";

        $.ajax({
            url: ajaxUrl,
            data: { genreId: genreId },
            dataType: "json",
            success: function(data) {
                console.log("Genre ID: " + genreId);
                console.log(data); // For testing purposes, log the data to the console
                renderGenreSongs(genreId, data);
            },
            error: function(xhr, status, error) {
                console.error("AJAX request error for Genre ID " + genreId + ":", status, error);
            }
        });
    }

    // Loop through each genre ID and make the AJAX call
    for (var i = 0; i < genreIds.length; i++) {
        fetchGenreSongs(genreIds[i]);
    }


    // Function to render the song data for a specific genre ID
    function renderGenreSongs(genreId, songs) {
        // Get the table element for the specific genre ID
        var table = $(".genre-tab" + genreId + " .genre-table");

        // Clear the existing table data (if any)
        table.empty();

        // Loop through the songs and create table rows for each song
        $.each(songs, function(index, song) {
            var row = $("<tr>");
            row.append("<td><p>" + (index + 1) + "</p></td>");
            row.append(
                '<td><div class="genre-song-info"><a href="#"><div class="genre-img-inner">' +
                '<img src="' + song.imageUrl + '"></div>' +
                '<div class="genre-song-name"><span>' + song.title + '</span></div></a></div></td>'
            );
            row.append("<td><p>" + song.artist + "</p></td>");
            row.append('<td><a href="#" class="genre-play"><i class="bi bi-play-fill"></i></a></td>');
            row.append('<td><a href="#" class="genre-plus"><i class="bi bi-plus"></i></a></td>');

            // Append the row to the table
            table.append(row);
        });
    }
});
