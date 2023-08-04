$(document).ready(function() {
    // Array of genre IDs to fetch data for
    var genreIds = [1, 2, 3, 4, 5, 6];
    var currentPage = {};
    var totalPages = {};

    // $('.genre-tab1').show();
    //
    // $('.genre-btn-tab a').click(function() {
    //     var genreId = $(this).attr('data-genre-id');
    //
    //     // Show the corresponding genre-tab and hide others
    //     $('.genre-tab').hide();
    //     $('.genre-tab' + genreId).show();
    //
    //     // Add 'active' class to the clicked tab and remove from siblings
    //     $(this).addClass('active').siblings().removeClass('active');
    // });

    // Function to make the AJAX call to retrieve song data for each genre ID
    function fetchGenreSongs(genreId, pageNumber) {
        currentPage[genreId] = pageNumber;

        $.ajax({
            url: contextPath + "/genreSongServlet",
            data: {
                genreId: genreId,
                pageNumber: pageNumber
            },
            dataType: "json",
            success: function(data) {
                renderGenreSongs(genreId, data.songs); // Use data.songs property from the response
                totalPages[genreId] = Math.ceil(data.totalSongs / 10); // Calculate total pages using totalSongs property
                updatePagination(genreId, totalPages[genreId]); // Pass totalPages[genreId] to the updatePagination function
            },
            error: function(xhr, status, error) {
                console.error("AJAX request error for Genre ID " + genreId + ":", status, error);
            }
        });
    }

    // Loop through each genre ID and make the AJAX call
    for (var i = 0; i < genreIds.length; i++) {
        console.log(`genreIds : ${genreIds}`);
        fetchGenreSongs(genreIds[i], 1); // Fetch songs for page 1
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

    // Function to update the pagination buttons
    function updatePagination(genreId, totalPages) {
        var paginationDiv = $(".genre-tab" + genreId + " .table-btn");
        paginationDiv.empty();
        for (var page = 1; page <= totalPages; page++) {
            var pageLink = $("<a>").text(page).attr("href", "#").attr("data-genre-id", genreId).attr("data-page", page);
            if (currentPage[genreId] === page) {
                pageLink.addClass("pagination");
                pageLink.addClass("active");
            }
            paginationDiv.append(pageLink);
        }
    }

    // Event delegation for click event on pagination links
    $(".table-btn").on("click", "a", function() {
        console.log("loadPage called");
        var genreId = $(this).attr("data-genre-id");
        var pageNumber = $(this).attr("data-page");
        fetchGenreSongs(genreId, pageNumber);
        return false;
    });
});
