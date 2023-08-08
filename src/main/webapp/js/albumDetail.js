let isOnce = 0;
let like = 1;

douccument.getEl

if(isOnce <1 ){
	click_Likes();
}

let click_Likes = function(){
	let albumId = 1;
	
	if(isOnce === 0 ){
		like = 1;
	}else if(isOnce ===1){
		like = -1;
	}
	
	 $.ajax({
            url: contextPath + "/albumUpdateServlet",
            data: {
                albumId, like
            },
            dataType: "json",
            success: function() {
               console.log("update successfully");
            },
            error: function(xhr, status, error) {
                console.error("AJAX request error for Genre ID " + genreId + ":", status, error);
            }
        });
	
	
}