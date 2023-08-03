
let el = document.getElementById("playlist-container");

Sortable.create(el, {
    animation: 150, // Animation speed in milliseconds
    ghostClass: 'sortable-ghost', // Class for the ghost element while dragging
    chosenClass: 'sortable-chosen', // Class for the chosen element while dragging
    dragClass: 'sortable-drag', // Class for the dragged element

});


    // $.ajax({
    //     url: '<%= request.getContextPath() %>/updatePlaylistOrder',
    //     method: 'POST',
    //     data: { playlistId: ${customPlaylist.playlistId}, songOrder: updatedOrder },
    //     success: function (response) {
    //         // Handle the success response if needed
    //     },
    //     error: function (xhr, status, error) {
    //         // Handle the error if needed
    //     }
    // });





