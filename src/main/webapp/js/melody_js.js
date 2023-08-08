/**적용되는 사이트 : melody_albumDetail, songDetail.jsp
 * 작성자 : 이유진
 */

//albumDetail.jsp	-> 별점 드래그

	const rating_input = document.getElementById("rating-input");
	const rating_star = document.querySelector('.rating-star');

	rating_input.addEventListener('input', () => {
		rating_star.style.width = `${rating_input.value * 10}%`;
	});
	 
//albumDetail + songDetail.jsp	-> 좋아요 클릭 
function click_Likes(){
	const likeIcon = document.getElementById('likeIcon');
	
	const currentClass = likeIcon.className;
	
	if(currentClass === 'fa-regular fa-heart'){
		likeIcon.className = 'fa-solid fa-heart';
	}else{
		likeIcon.className = 'fa-regular fa-heart';
	}
}

$(document).ready(function() {
	let currentRating = 0;
	updateStars(currentRating);

	$("#rating-input").on("input", function() {
		currentRating = $(this).val();
		console.log("Input value: " + currentRating);
		updateStars(currentRating);
	});

	function updateStars(rating) {
		$(".rating-star").html("");
		for (let i = 0; i < 5; i++) {
			if (i < rating) {
				$(".rating-star").append("★");
			} else {
				$(".rating-star").append("☆");
			}
		}
		// 현재 평점을 업데이트
		console.log("Updating currentRating: " + rating);
		$("#currentRating").text(rating);
	}

	const audioPlayerContainer = $('#audio-player');
	$.ajax({
		url: 'pages/miniPlayerTest.jsp',
		dataType: 'html',
		success: function(response) {
			audioPlayerContainer.html(response);
			// Add your JavaScript code for managing playback state here
		},
		error: function(xhr, status, error) {
			console.error('AJAX request error:', status, error);
		}
	});
});