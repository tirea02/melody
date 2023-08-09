
$(document).ready(function() {

    let el = document.getElementById("playlist-container");

    Sortable.create(el, {
        animation: 150, // Animation speed in milliseconds
        ghostClass: 'sortable-ghost', // Class for the ghost element while dragging
        chosenClass: 'sortable-chosen', // Class for the chosen element while dragging
        dragClass: 'sortable-drag', // Class for the dragged element

    });


    function deleteSongFromPlaylist() {
        const deleteSongBtn = $("#delete-song-btn");

        const playlistId = deleteSongBtn.data('playlist-id');
        const songId = deleteSongBtn.data('song-id');
        const deleteUrl = `${contextPath}/DeleteToPlaylist?playlistId=${playlistId}&songId=${songId}`;

        console.log(playlistId);
        console.log(songId);

        $.ajax({
            url: deleteUrl,
            type: 'GET',
            dataType: "json",
            success: function(response) {
                if (response.success) {
                    // Redirect to CustomPlaylistServlet after successful deletion
                    console.log("Deletion successful:", response);
                    window.location.href = window.location.href = `${contextPath}/customPlaylist?playlistId=${playlistId}`;
                } else {
                    // Handle failure if needed
                    console.error("Failed to delete playlist.");
                }
            },
            error: function(xhr, status, error) {
                console.error("AJAX request error:", status, error);
            }
        });
    }

    $(".delete-song").click(function(event) {
        event.preventDefault();
        deleteSongFromPlaylist(this);
    });
});




