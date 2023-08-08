$(document).ready(function() {
    // Array of genre IDs to fetch data for
    var genreIds = [1, 2, 3, 4, 5, 6];
    var currentPage = {};
    var totalPages = {};

    var hdnSession = document.getElementById("hdnSession");
    if (hdnSession) {
        var jsonCustomPlaylist = hdnSession.getAttribute("data-value");
        if (jsonCustomPlaylist) {
            var parsedJsonCustomPlaylist = JSON.parse(jsonCustomPlaylist);
            console.log("json custom playlist:", parsedJsonCustomPlaylist);
        } else {
            console.log("data-value attribute not found in hdnSession");
        }
    } else {
        console.log("hdnSession element not found");
    }


    initializeChatHelper();



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
/*                    autoplay: true,
                    autoplaySpeed: 4000,*/
                    draggable: false,
                    slidesToShow: 1,
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
            row.append('<td><a href="#" class="genre-plus" data-songid="' + song.songId + '"><i class="bi bi-plus"></i></a></td>');

            // Append the row to the table
            table.append(row);

            var playlistDropdown = $('<div class="playlist-dropdown" style="display: none;"></div>');
            row.find(".genre-plus").click(function(e) {
                e.preventDefault();
                var songId = $(this).data("songid");
                playlistDropdown.toggle();
                $('.playlist-dropdown').toggleClass('open')

                // Generate the playlist dropdown content
                var playlistContent = '<ul class="playlist-list">';
                $.each(parsedJsonCustomPlaylist, function(index, playlist) {
                    playlistContent += '<li><a href="#" class="add-to-playlist" data-songid="' + songId + '" data-playlistid="' + playlist.playlistId + '">' + playlist.playlistName + '</a></li>';
                });
                playlistContent += '</ul>';

                playlistDropdown.html(playlistContent);
            });
            // Append the playlist dropdown to the row
            row.append(playlistDropdown);

        });
    }

    //function to add to playlist when clicked
    $(document).on("click", ".add-to-playlist", function(e) {
        e.preventDefault();
        var songId = $(this).data("songid");
        var playlistId = $(this).data("playlistid");

        console.log(`tt songId : ${songId}, playlistId " ${playlistId}`);

        // Perform AJAX request to add song to playlist
        $.ajax({
            type: "POST",
            url: contextPath + "/addToPlaylist", // Replace with your servlet URL
            data: { songId: songId, playlistId: playlistId },
            success: function(response) {
               console.log(`playlist updated successfully`);
            },
            error: function(xhr, status, error) {
                // Handle error
            }
        });
    });

    const audioPlayerContainer = $('#audio-player');
    $.ajax({
        url: contextPath+ '/pages/miniPlayerTest.jsp',
        dataType: 'html',
        success: function(response) {
            audioPlayerContainer.html(response);
            // Add your JavaScript code for managing playback state here
        },
        error: function(xhr, status, error) {
            console.error('AJAX request error:', status, error);
        }
    });

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

    const playSongForm = $("playSongForm");
    const songQuery = $("#songQuery");
    const playSongBtn = $("#playSongBtn");

    playSongBtn.click(function() { // Use the jQuery .click() method
        const songTitle = songQuery.val().trim();
        if (songTitle !== "") {
            songQuery.val(songTitle); // Use .val() to set the input's value
            playSongForm.submit();
        }
    });

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


