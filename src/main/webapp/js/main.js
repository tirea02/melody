$(document).ready(function() {
    // Array of genre IDs to fetch data for
    var genreIds = [1, 2, 3, 4, 5, 6];
    var currentPage = {};
    var totalPages = {};

    initializeChatHelper();

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

    function fetchArtists() {
        $.ajax({
            url: contextPath + "/artistServlet", // Replace with the correct URL for fetching artists
            dataType: "json",
            success: function(data) {
                renderArtists(data); // Render the list of artists
                $('.artist-slider').slick({
                    dots: true,
                    infinite: true,
                    centerMode: true,
                    centerPadding: '10px',
                    speed: 1000,
                    autoplay: true,
                    autoplaySpeed: 4000,
                    draggable: false,
                    slidesToShow: 2,
                    slidesToScroll: 4
                });

            },
            error: function(xhr, status, error) {
                console.error("AJAX request error:", status, error);
            }
        });
    }

    // Function to render the list of artists
    function renderArtists(artists) {
        var artistSlider = $(".artist-slider");
        var slideCount = Math.ceil(artists.length / 4); // Calculate the number of slides

        // Clear any existing artist data
        artistSlider.empty();

        // Loop through the slides and create artist items for each slide
        for (var i = 0; i < slideCount; i++) {
            var slide = $("<div>").addClass("artist-items");

            // Loop through the artists and create artist items for each slide
            for (var j = i * 3; j < Math.min((i + 1) * 3, artists.length); j++) {
                var artistItem = $("<div>").addClass("artist-item");
                var artistLink = $("<a>").attr("href", "#");
                var artistImg = $("<div>").addClass("artist-img-inner").append($("<img>").attr("src", artists[j].singerPhoto));
                var artistText = $("<div>").addClass("artist-text").append($("<span>").text(artists[j].singerName));

                artistLink.append(artistImg, artistText);
                artistItem.append(artistLink);
                slide.append(artistItem);
            }

            artistSlider.append(slide);
        }

    }

    // Load artists on page load
    fetchArtists();

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
                '<td><div class="genre-song-info"><a href="' + contextPath + '/albumDetail?albumID=' + song.albumId + '">' +
                '<div class="genre-img-inner"><img src="' + song.imageUrl + '"></div>' +
                '<div class="genre-song-name"><span>' + song.title + '</span></div></a></div></td>'
            );
            row.append("<td><p>" + song.artist + "</p></td>");
            row.append('<td><a href="' + contextPath + '/playSong?songId=' + song.songId + '" class="genre-play"><i class="bi bi-play-fill"></i></a></td>');
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


function initializeChatHelper() {
    const submitBtn = $("#submitBtn");
    const questionInput = $("#question");
    const answerDiv = $("#answer");

    submitBtn.click(function(e) {
        e.preventDefault(); // Prevent the default form submission

        const question = questionInput.val();
        if (question.trim() === "") {
            return;
        }

        // Send AJAX request to the servlet
        $.get(contextPath+"/pythonExecutor", { question: question }, function(data) {
            // Update the answer area with the response
            answerDiv.html(data);
        });
    });
}